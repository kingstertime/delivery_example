import 'package:flutter/material.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/repository/repository.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/domain/action/action.dart' as domain;
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/code/code.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/order/order_response.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/domain/validate_order/validate_order_response.dart';

abstract class Repository extends ChangeNotifier {
  static Repository makeInstance() => RepositoryImpl.makeInstance();

  Future<Either<ExtendedErrors, Catalog>> getCatalog(int cityId);

  Future<Either<ExtendedErrors, Config>> getConfig();

  Future<Either<ExtendedErrors, domain.Actions>> getAction();

  Future<Either<ExtendedErrors, CartPositions>> getCartPositions();

  Future<Either<ExtendedErrors, CartPositions>> postCartPositions(
      CartPositions cartPositions);

  Future<Either<ExtendedErrors, City>> saveCity(City city);

  Future<Either<ExtendedErrors, City>> getCity();

  Future<Either<ExtendedErrors, Code>> sendCode(int phone);

  Future<Either<ExtendedErrors, ApiKey>> generateApiKey(
      int phone, int code, int cityId);

  Future<Either<ExtendedErrors, ApiKey>> saveApiKey(ApiKey apiKey);

  Future<Either<ExtendedErrors, ApiKey>> getApiKey();

  Future<Either<ExtendedErrors, UserInfo>> getUserInfo(int cityId);

  Future<Either<ExtendedErrors, OrderResponse>> sendOrder(OrderBody body);

  Future<Either<ExtendedErrors, ValidateOrderResponse>> sendValidateOrder(ValidateOrderBody body);
}
