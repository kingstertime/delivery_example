import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/data/action/action_dto.dart';
import 'package:superdostavka/data/api_key/api_key_dto.dart';
import 'package:superdostavka/data/catalog/catalog_dto.dart';
import 'package:superdostavka/data/code/code_dto.dart';
import 'package:superdostavka/data/config/config_dto.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/order/order_response_dto.dart';
import 'package:superdostavka/data/repository/remote/remote_repository.dart';
import 'package:superdostavka/data/repository/remote/src/http/api_client.dart';
import 'package:superdostavka/data/repository/repository.dart';
import 'package:superdostavka/data/user_info/user_info_dto.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/data/validate_order/validate_order_response_dto.dart';
import 'package:superdostavka/domain/action/action.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/code/code.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/order/order_response.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/domain/validate_order/validate_order_response.dart';

class RemoteRepositoryImpl
    with RepositoryImplMixin
    implements RemoteRepository {
  static RemoteRepositoryImpl makeInstance({ApiClient? apiClient}) {
    return _instance ??= RemoteRepositoryImpl._(apiClient: apiClient);
  }

  static RemoteRepositoryImpl? _instance;

  RemoteRepositoryImpl._({
    ApiClient? apiClient,
  }) : _client = apiClient ?? ApiClient.makeInstance();

  final ApiClient _client;

  @override
  Future<Either<ExtendedErrors, Catalog>> getCatalog(int cityId) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.getCatalog(cityId: cityId);
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, Config>> getConfig() async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.getConfig();
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, Actions>> getAction() async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.getActions();
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> generateApiKey(
      int phone, int code, int cityId) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.generateApiKey(phone, code, cityId);
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, Code>> sendCode(int phone) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.sendCode(phone);
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, UserInfo>> getUserInfo(int cityId) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.getUserInfo(cityId);
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, OrderResponse>> sendOrder(
      OrderBody body) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.sendOrder(body);
      final domain = dto.toDomain();
      return domain;
    });
  }

  @override
  Future<Either<ExtendedErrors, ValidateOrderResponse>> sendValidateOrder(ValidateOrderBody body) async {
    return safeFunc(() async {
      final client = _client.getClient();
      final dto = await client.sendValidateOrder(body);
      final domain = dto.toDomain();
      return domain;
    });
  }
}
