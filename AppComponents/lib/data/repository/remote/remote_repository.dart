import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/repository/remote/src/remote_repo_impl.dart';
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

abstract class RemoteRepository {
  static RemoteRepository makeInstance() => RemoteRepositoryImpl.makeInstance();

  Future<Either<ExtendedErrors, Catalog>> getCatalog(int cityId);

  Future<Either<ExtendedErrors, Config>> getConfig();

  Future<Either<ExtendedErrors, Actions>> getAction();

  Future<Either<ExtendedErrors, Code>> sendCode(int phone);

  Future<Either<ExtendedErrors, ApiKey>> generateApiKey(
      int phone, int code, int cityId);

  Future<Either<ExtendedErrors, UserInfo>> getUserInfo(int cityId);

  Future<Either<ExtendedErrors, OrderResponse>> sendOrder(OrderBody body);

  Future<Either<ExtendedErrors, ValidateOrderResponse>> sendValidateOrder(ValidateOrderBody body);
}
