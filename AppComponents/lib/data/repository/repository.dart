import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/repository/local/local_repository.dart';
import 'package:superdostavka/data/repository/remote/remote_repository.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/domain/action/action.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/code/code.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/order/order_response.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/domain/validate_order/validate_order_response.dart';
import 'package:superdostavka/logic/repository.dart';

class RepositoryImpl extends Repository {
  RepositoryImpl._({LocalRepository? local, RemoteRepository? remote})
      : _local = local ?? LocalRepository.makeInstance(),
        _remote = remote ?? RemoteRepository.makeInstance();

  static RepositoryImpl makeInstance() {
    return _instance ??= RepositoryImpl._();
  }

  static RepositoryImpl? _instance;

  // ignore: unused_field
  final LocalRepository _local;
  final RemoteRepository _remote;

  @override
  Future<Either<ExtendedErrors, Catalog>> getCatalog(int cityId) async {
    return _remote.getCatalog(cityId);
  }

  @override
  Future<Either<ExtendedErrors, Config>> getConfig() async {
    return _remote.getConfig();
  }

  @override
  Future<Either<ExtendedErrors, Actions>> getAction() async {
    return _remote.getAction();
  }

  @override
  Future<Either<ExtendedErrors, CartPositions>> getCartPositions() async {
    return _local.getCartPositions();
  }

  @override
  Future<Either<ExtendedErrors, CartPositions>> postCartPositions(
      CartPositions cartPositions) async {
    return _local.postCartPositions(cartPositions);
  }

  @override
  Future<Either<ExtendedErrors, City>> getCity() async {
    return _local.getCity();
  }

  @override
  Future<Either<ExtendedErrors, City>> saveCity(City city) {
    return _local.saveCity(city);
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> generateApiKey(
      int phone, int code, int cityId) async {
    return _remote.generateApiKey(phone, code, cityId);
  }

  @override
  Future<Either<ExtendedErrors, Code>> sendCode(int phone) async {
    return _remote.sendCode(phone);
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> getApiKey() async {
    return _local.getApiKey();
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> saveApiKey(ApiKey apiKey) async {
    return _local.saveApiKey(apiKey);
  }

  @override
  Future<Either<ExtendedErrors, UserInfo>> getUserInfo(int cityId) async {
    return _remote.getUserInfo(cityId);
  }

  @override
  Future<Either<ExtendedErrors, OrderResponse>> sendOrder(
      OrderBody body) async {
    return _remote.sendOrder(body);
  }

  @override
  Future<Either<ExtendedErrors, ValidateOrderResponse>> sendValidateOrder(ValidateOrderBody body) async {
    return _remote.sendValidateOrder(body);
  }
}

mixin RepositoryImplMixin {
  Future<Either<ExtendedErrors, R>> safeFunc<R>(
      Future<Either<ExtendedErrors, R>> Function() f) async {
    try {
      final r = await f.call();
      return r;
    } on Error catch (e) {
      //throw Exception(e);
      return left(ExtendedErrors.simple(e.toString()));
    } on Exception catch (e) {
      //throw Exception(e);
      return left(ExtendedErrors.simple(e.toString()));
    }
  }
}
