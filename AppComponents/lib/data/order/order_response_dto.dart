import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/order/order_response.dart';

part 'order_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderResponseDto {
  bool? errors;
  int? number;
  double? bonuses;
  double? sum;

  OrderResponseDto();

  factory OrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderResponseDtoToJson(this);
}

extension OrderResponseDtoX on OrderResponseDto {
  Either<ExtendedErrors, OrderResponse> toDomain() {
    try {
      final domain = OrderResponse(
          errors: errors ?? false,
          number: number ?? 0,
          bonuses: bonuses ?? 0,
          sum: sum ?? 0);
      return right(domain);
    } on Error catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    } on CheckedFromJsonException catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    } on Exception catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    }
  }
}
