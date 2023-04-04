import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/data/repository/local/src/shared_pref_repo_impl.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';

abstract class LocalRepository {
  static LocalRepository makeInstance() => SPRepositoryImpl.instance;

  Future<Either<ExtendedErrors, CartPositions>> getCartPositions();

  Future<Either<ExtendedErrors, CartPositions>> postCartPositions(
      CartPositions cartPositions);

  Future<Either<ExtendedErrors, City>> saveCity(City city);

  Future<Either<ExtendedErrors, City>> getCity();

  Future<Either<ExtendedErrors, ApiKey>> saveApiKey(ApiKey apiKey);

  Future<Either<ExtendedErrors, ApiKey>> getApiKey();
}
