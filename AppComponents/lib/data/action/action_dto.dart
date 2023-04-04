import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/safe_coding.dart';
import 'package:superdostavka/domain/action/action.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'action_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActionResponseDto {
  String? modified;
  List<ActionDto>? actions;

  ActionResponseDto({this.modified, this.actions});

  factory ActionResponseDto.fromJson(Map<String, dynamic> json) {
    return _$ActionResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionResponseDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ActionDto {
  String? name;
  String? shortDescription;
  String? description;
  String? image;

  ActionDto({this.name, this.shortDescription, this.description, this.image});

  factory ActionDto.fromJson(Map<String, dynamic> json) {
    return _$ActionDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ActionDtoToJson(this);
}

extension ActionResponseDtoX on ActionResponseDto {
  Either<ExtendedErrors, Actions> toDomain() {
    try {
      final domain = Actions(
          modified: (modified ?? '').nonEmpty,
          actions: actions
                  ?.map((e) => Action(
                      name: (e.name ?? '').nonEmpty,
                      shortDescription: (e.shortDescription ?? '').nonEmpty,
                      description: (e.description ?? '').nonEmpty,
                      image: (e.image ?? '').nonEmpty))
                  .toList() ??
              []);
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
