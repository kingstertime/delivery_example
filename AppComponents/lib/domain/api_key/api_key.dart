import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/core/json_converters.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'api_key.freezed.dart';
part 'api_key.g.dart';

@Freezed(toJson: true, fromJson: true)
class ApiKey with _$ApiKey {
  const factory ApiKey(
      {@NonEmptyStringConverter() required NonEmptyString apiKey}) = _ApiKey;

  factory ApiKey.fromJson(Map<String, dynamic> json) => _$ApiKeyFromJson(json);
}
