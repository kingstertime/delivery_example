import 'package:freezed_annotation/freezed_annotation.dart';

part 'validate_order_body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class ValidateOrderBody {
  OrderDto? order;

  ValidateOrderBody({this.order});

  factory ValidateOrderBody.fromJson(Map<String, dynamic> json) =>
      _$ValidateOrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateOrderBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class OrderDto {
  int? cityId;
  int? promocode;
  int? giftId;
  List<PositionsBodyDto>? positions;

  OrderDto({
    this.cityId,
    this.positions,
    this.promocode,
    this.giftId
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PositionsBodyDto {
  int? id;
  int? quantity;
  double? price;


  PositionsBodyDto({this.id, this.quantity, this.price});

  factory PositionsBodyDto.fromJson(Map<String, dynamic> json) =>
      _$PositionsBodyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PositionsBodyDtoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
