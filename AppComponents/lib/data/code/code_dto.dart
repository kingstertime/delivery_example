import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/code/code.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';

part 'code_dto.g.dart';

@JsonSerializable()
class CodeDto {
  bool? isSent;

  CodeDto();

  factory CodeDto.fromJson(Map<String, dynamic> json) =>
      _$CodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDtoToJson(this);
}

extension CodeDtoX on CodeDto {
  Either<ExtendedErrors, Code> toDomain() {
    try {
      final domain = Code(isSent: isSent ?? false);
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
