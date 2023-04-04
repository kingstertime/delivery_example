import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_response.freezed.dart';

@freezed
class OrderResponse with _$OrderResponse {
  const factory OrderResponse({
    required bool errors,
    required int number,
    required double bonuses,
    required double sum,
  }) = _OrderResponse;
}
