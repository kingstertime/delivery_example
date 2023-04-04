import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_order_response.freezed.dart';

@freezed
class ValidateOrderResponse with _$ValidateOrderResponse {
  const factory ValidateOrderResponse({
    required String errorMessage,
    required Order order,
}) = _ValidateOrderResponse;
}

@freezed
class Order with _$Order {
  const factory Order({
    required int cityId,
    required int promocode,
    required int giftId,
    required List<PositionsBody> positions,
}) = _Order;
}

@freezed
class PositionsBody with _$PositionsBody {
  const factory PositionsBody({
    required int id,
    required int quantity,
    required double price
}) = _PositionsBody;
}