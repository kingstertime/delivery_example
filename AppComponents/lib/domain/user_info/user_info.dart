import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/core/json_converters.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString phone,
    @NonEmptyStringConverter() required NonEmptyString name,
    required double bonuses,
    required int cashbackPercent,
    required List<Address> addresses,
    required List<PickupAddress> pickupAddresses,
    required DataVersions dataVersions,
    required List<Position> promoPositions,
  }) = _UserInfo;

  static UserInfo empty = UserInfo(
    id: 0,
    phone: ''.nonEmpty,
    name: ''.nonEmpty,
    bonuses: 0,
    cashbackPercent: 0,
    addresses: [],
    pickupAddresses: [],
    dataVersions: DataVersions(mainConfig: ''.nonEmpty),
    promoPositions: [],
  );
}

@freezed
class Address with _$Address {
  const factory Address({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString street,
    @NonEmptyStringConverter() required NonEmptyString kladrId,
    @NonEmptyStringConverter() required NonEmptyString locality,
    required int streetId,
    @NonEmptyStringConverter() required NonEmptyString building,
    @NonEmptyStringConverter() required NonEmptyString flat,
    @NonEmptyStringConverter() required NonEmptyString entrance,
    @NonEmptyStringConverter() required NonEmptyString floor,
    @NonEmptyStringConverter() required NonEmptyString comment,
    required bool edit,
    required DeliveryConditions deliveryConditions,
  }) = _Address;
}

@freezed
class DeliveryConditions with _$DeliveryConditions {
  const factory DeliveryConditions(
      {required double freeFromSum,
      required double deliverySum}) = _DeliveryConditions;
}

@freezed
class PickupAddress with _$PickupAddress {
  const factory PickupAddress({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString name,
    @NonEmptyStringConverter() required NonEmptyString address,
  }) = _PickupAddress;
}

@freezed
class DataVersions with _$DataVersions {
  const factory DataVersions({
    @NonEmptyStringConverter() required NonEmptyString mainConfig,
  }) = _DataVersions;
}
