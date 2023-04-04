import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/core/services/app_logger.dart';
import 'package:superdostavka/data/repository/local/local_repository.dart';
import 'package:superdostavka/data/repository/local/src/shared_pref_repo_impl.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:uuid/uuid.dart';

abstract class IDioProvider {
  Dio get dio;

  String get baseUrl;
}

class DioBuilder implements IDioProvider {
  DioBuilder._({
    LocalRepository? repo,
  }) : repoLocal = repo ?? SPRepositoryImpl.instance;

  static DioBuilder makeInstance() {
    return _instance ??= DioBuilder._();
  }

  static DioBuilder? _instance;

  // final AppLogger _logger;

  final LocalRepository repoLocal;

  Dio? _dio;

  @override
  String get baseUrl => dio.options.baseUrl;

  @override
  Dio get dio => _dio ??= _buildDio();

  Dio _buildDio() {
    final options = BaseOptions(baseUrl: AppConfig.apiEndpoint);
    final dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final apiKey = await repoLocal.getApiKey();
        apiKey.fold(
            (l) => null,
            (r) => r.apiKey.value.fold(
                (l) => null, (r) => options.queryParameters['apikey'] = r));
        if (options.uri.path.contains('/mobile_api/register_mobile_user')) {
          debugPrint('queryParam: ${options.queryParameters}');
          String phone = options.path.substring(options.uri.path.length + 7);
          debugPrint('phone: $phone');
          final String ua =
              'okhttp/3.12.0 Project/deliverest App/20230203 Android/10';
          options.headers['User-Agent'] = ua;
          debugPrint('user-agent: $ua');
          var randomKey = const Uuid().v4();
          debugPrint('randomKey: $randomKey');
          String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
          debugPrint('date: $date');
          String hash = '$ua$randomKey$phone$date';
          debugPrint('hash: $hash');

          var sha = sha1.convert(utf8.encode(hash));
          debugPrint('sha: $sha');
          options.queryParameters['sh'] = sha;
          options.queryParameters['sk'] = randomKey;
        }
        debugPrint('URI: ${options.uri.path}');
        await _setHeaders(options);
        log(
          '${options.method} ${options.uri.toString()}\n${options.headers}\n${options.extra}',
          name: 'HTTP REQUEST',
        );
        log(options.data.toString());
        if (!AppConfig.isProduction &&
            options.data != null &&
            options.data is Map) {
          // TODO: do for FormData
          final bodyAsString = jsonEncode(options.data);
          log(
            bodyAsString,
            name: 'HTTP REQUEST BODY',
          );
        }

        return handler.next(options);
      },
      onResponse: (response, handler) async {
        final respString = response.toString();
        log(
            respString.substring(
              0,
              respString.length > 500 ? 500 : respString.length - 1,
            ),
            name: 'HTTP RESPONSE');
        return handler.next(response);
      },
      onError: _onError,
    ));
    final headers = {
      'Accept': 'application/json',
    };

    dio.options.headers = headers;
    return dio;
  }

  Future _onError(DioError e, handler) async {
    loggerSimple
        .i('DioBuilder._onError: ${e.response} / ${e.response?.statusCode}');
    return _resolveErrorForClient(e.response?.statusCode ?? -1, e, handler);
  }

  /// Помощь для передачи разного рода ошибок клиенту
  /// Передается код и ендпойнт
  Future _resolveErrorForClient(int statusCode, DioError e, handler) async {
    final partOf = e.toString().maxLen(200);
    final errors =
        e.response?.data as Map<String, dynamic>? ?? <String, dynamic>{};

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.1=$errors');

    if (!errors.containsKey(ExtendedErrorsX.errorKey)) {
      errors[ExtendedErrorsX.errorKey] = partOf;
    }
    if (!errors.containsKey(ExtendedErrorsX.errorsKey)) {
      errors[ExtendedErrorsX.errorsKey] = <String, dynamic>{
        ExtendedErrorsX.errorKey: [errors[ExtendedErrorsX.errorKey]],
      };
    }

    if ([401, 402, 500, 502, 503].contains(statusCode)) {
      //TODO: Тут сделать logout
      final respNew = Response(
          requestOptions: RequestOptions(path: e.toString()),
          data: <String, dynamic>{
            'status': false,
            'errors': {
              ExtendedErrorsX.errorKey: 'Ошибка связи [$statusCode]',
              ExtendedErrorsX.errorsKey: ['Ошибка связи [$statusCode]'],
            },
          });
      return handler.resolve(respNew);
    }

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.2=$errors');

    errors[ExtendedErrorsX.errorsKey]
        [ExtendedErrorsX.dioStatusCodeKey] = [statusCode];
    errors[ExtendedErrorsX.errorsKey]
        [ExtendedErrorsX.dioApiKey] = [e.requestOptions.path];

    loggerSimple.i('DioBuilder._resolveErrorForClient: errors.3=$errors');

    final respNew = Response(
        requestOptions:
            e.response?.requestOptions ?? RequestOptions(path: 'unknown path'),
        data: <String, dynamic>{
          'status': false,
          'errors': errors,
        });
    return handler.resolve(respNew);
  }

  Future _setHeaders(RequestOptions options) async {
    loggerSimple.i('DioBuilder._setHeaders: ${options.headers}');
  }
}
