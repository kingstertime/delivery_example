import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_body.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class OrderBody {
  Order? order;

  OrderBody({this.order});

  factory OrderBody.fromJson(Map<String, dynamic> json) =>
      _$OrderBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class Order {
  int? addressId;
  DateBody? date;
  int? deliveryType;
  bool? isPickup;
  int? cityId;
  String? comment;
  @JsonKey(name: 'contact')
  ContactBody? contactBody;
  @JsonKey(name: 'positions')
  List<PositionsBody>? positionsBody;
  int? bonuses;
  int? persons;
  PaymentBody? payment;
  int? workshopId;

  Order(
      {this.bonuses,
      this.date,
      this.positionsBody,
      this.contactBody,
      this.comment,
      this.cityId,
      this.payment,
      this.isPickup,
      this.addressId,
      this.deliveryType,
      this.persons,
      this.workshopId});

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class DateBody {
  int? type;
  String? day;
  String? hour;
  String? minute;

  DateBody({this.type, this.day, this.hour, this.minute});

  factory DateBody.fromJson(Map<String, dynamic> json) =>
      _$DateBodyFromJson(json);

  Map<String, dynamic> toJson() => _$DateBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ContactBody {
  String? phone;
  String? name;

  ContactBody({this.phone, this.name});

  factory ContactBody.fromJson(Map<String, dynamic> json) =>
      _$ContactBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ContactBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PositionsBody {
  String? id;
  String? quantity;

  PositionsBody({this.id, this.quantity});

  factory PositionsBody.fromJson(Map<String, dynamic> json) =>
      _$PositionsBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PositionsBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class PaymentBody {
  int? payType;
  int? payMethod;
  String? paymentData;
  int? cashPaid;
  int? cardId;

  PaymentBody(
      {this.payType,
      this.paymentData,
      this.cardId,
      this.cashPaid,
      this.payMethod});

  factory PaymentBody.fromJson(Map<String, dynamic> json) =>
      _$PaymentBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBodyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
