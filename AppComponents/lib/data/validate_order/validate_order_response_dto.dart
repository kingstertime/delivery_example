import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/validate_order/validate_order_response.dart';

part 'validate_order_response_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ValidateOrderResponseDto {
  String? errorMessage;
  OrderDto? order;

  ValidateOrderResponseDto(
      this.errorMessage,
      this.order
      );

  factory ValidateOrderResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ValidateOrderResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateOrderResponseDtoToJson(this);
}

extension ValidateOrderResponseDtoX on ValidateOrderResponseDto {
  Either<ExtendedErrors, ValidateOrderResponse> toDomain() {
    try {
      final domain = ValidateOrderResponse(
          errorMessage: errorMessage ?? '',
          order: Order(cityId: order?.cityId ?? 0,
            promocode: order?.promocode ?? 0,
            positions: order?.positions?.map((e) => PositionsBody(id: e.id ?? 0, quantity: e.quantity ?? 0, price: e.price ?? 0)).toList() ?? [], giftId: order?.giftId ?? 0
          ));
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