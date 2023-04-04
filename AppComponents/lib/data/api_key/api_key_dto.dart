import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'api_key_dto.g.dart';

@JsonSerializable()
class ApiKeyDto {
  @JsonKey(name: 'apikey')
  String? apiKey;

  ApiKeyDto();

  factory ApiKeyDto.fromJson(Map<String, dynamic> json) {
    debugPrint('json: $json');
    debugPrint('from Json: ${_$ApiKeyDtoFromJson(json).apiKey}');
    return _$ApiKeyDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApiKeyDtoToJson(this);
}

extension ApiKeyDtoX on ApiKeyDto {
  Either<ExtendedErrors, ApiKey> toDomain() {
    try {
      debugPrint('hm: $apiKey');
      final domain = ApiKey(apiKey: (apiKey ?? '').nonEmpty);
      return Right(domain);
    } on Error catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    } on CheckedFromJsonException catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    } on Exception catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    }
  }
}
