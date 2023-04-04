import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';

part 'position_with_count.g.dart';

@JsonSerializable()
class CartPositions {
  CartPositions({required this.map});
  Map<int, PositionWithCount> map;

  factory CartPositions.fromJson(Map<String, dynamic> json) =>
      _$CartPositionsFromJson(json);

  Map<String, dynamic> toJson() => _$CartPositionsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PositionWithCount {
  PositionWithCount({required this.position, required this.count});

  Position position;

  int count;

  factory PositionWithCount.fromJson(Map<String, dynamic> json) =>
      _$PositionWithCountFromJson(json);

  Map<String, dynamic> toJson() => _$PositionWithCountToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
