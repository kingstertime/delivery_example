import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/data/repository/local/local_repository.dart';
import 'package:superdostavka/data/repository/repository.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class SPRepositoryImpl
    with RepositoryImplMixin, SPRepositoryImplMixin
    implements LocalRepository {
  static final SPRepositoryImpl instance = SPRepositoryImpl._();

  SPRepositoryImpl._() {
    debugPrint('$now: SPRepositoryImpl._: ');
  }

  static const _cartKey = 'cart_key';

  static const _cityKey = 'city_key';

  static const _apiKey = 'api_key';

  @override
  Future<Either<ExtendedErrors, CartPositions>> getCartPositions() async {
    return safeFunc(() async {
      final s = await _getString(_cartKey, def: '');
      final json = jsonDecode(s);
      final o = CartPositions.fromJson(json);
      return right(o);
    });
  }

  @override
  Future<Either<ExtendedErrors, CartPositions>> postCartPositions(
      CartPositions cartPositions) async {
    final json = cartPositions.toJson();
    final s = jsonEncode(json);
    _saveString(_cartKey, s);
    return getCartPositions();
  }

  @override
  Future<Either<ExtendedErrors, City>> saveCity(City city) async {
    final json = city.toJson();
    final s = jsonEncode(json);
    _saveString(_cityKey, s);
    return getCity();
  }

  @override
  Future<Either<ExtendedErrors, City>> getCity() async {
    return safeFunc(() async {
      final s = await _getString(_cityKey, def: '');
      final json = jsonDecode(s);
      final o = City.fromJson(json);
      return right(o);
    });
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> saveApiKey(ApiKey apiKey) {
    final json = apiKey.toJson();
    final s = jsonEncode(json);
    _saveString(_apiKey, s);
    return getApiKey();
  }

  @override
  Future<Either<ExtendedErrors, ApiKey>> getApiKey() {
    return safeFunc(() async {
      final s = await _getString(_apiKey, def: '');
      final json = jsonDecode(s);
      final o = ApiKey.fromJson(json);
      return right(o);
    });
  }
}

/// Миксин сделан для удобства вынесения второстепенной логики в репах
mixin SPRepositoryImplMixin {
  SharedPreferences? _pref;

  Future _init() async {
    _pref ??= await SharedPreferences.getInstance();
    return;
  }

  Future _saveString(String key, String data) async {
    await _init();
    await _pref?.setString(key, data);
  }

  Future<String> _getString(String key, {String? def}) async {
    return _init().then((_) => _pref?.getString(key) ?? def ?? '');
  }
}
