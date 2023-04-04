import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/data/catalog/catalog_dto.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/core/value_objects.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

part 'user_info_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserInfoDto {
  int? id;
  String? phone;
  String? name;
  double? bonuses;
  int? cashbackPercent;
  List<AddressDto>? addresses;
  List<PickupAddressDto>? pickupAddresses;
  DataVersionsDto? dataVersions;
  List<PositionsDto>? promoPositions;

  UserInfoDto();

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressDto {
  int? id;
  String? street;
  String? locality;
  String? kladrId;
  int? streetId;
  String? building;
  String? flat;
  String? entrance;
  String? floor;
  String? comment;
  bool? edit;
  DeliveryConditionsDto? deliveryConditions;

  AddressDto();

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryConditionsDto {
  double? freeFromSum;
  double? deliverySum;

  DeliveryConditionsDto();

  factory DeliveryConditionsDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryConditionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryConditionsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PickupAddressDto {
  int? id;
  String? name;
  String? address;

  PickupAddressDto();

  factory PickupAddressDto.fromJson(Map<String, dynamic> json) =>
      _$PickupAddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PickupAddressDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DataVersionsDto {
  String? mainConfig;

  DataVersionsDto();

  factory DataVersionsDto.fromJson(Map<String, dynamic> json) =>
      _$DataVersionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DataVersionsDtoToJson(this);
}

extension UserInfoDtoX on UserInfoDto {
  Either<ExtendedErrors, UserInfo> toDomain() {
    debugPrint('$now: toDomain: UserInfoDto = ${this}');
    try {
      final domain = UserInfo(
          id: id ?? 0,
          name: (name ?? '').nonEmpty,
          phone: (phone ?? '').nonEmpty,
          bonuses: bonuses ?? 0,
          cashbackPercent: cashbackPercent ?? 0,
          addresses: addresses?.map((e) {
                return Address(
                  id: e.id ?? 0,
                  street: (e.street ?? '').nonEmpty,
                  streetId: e.streetId ?? 0,
                  building: (e.building ?? '').nonEmpty,
                  flat: (e.flat ?? '').nonEmpty,
                  entrance: (e.entrance ?? '').nonEmpty,
                  floor: (e.floor ?? '').nonEmpty,
                  comment: (e.comment ?? '').nonEmpty,
                  edit: e.edit ?? false,
                  deliveryConditions: DeliveryConditions(
                      freeFromSum: e.deliveryConditions?.freeFromSum ?? 0,
                      deliverySum: e.deliveryConditions?.deliverySum ?? 0),
                  kladrId: (e.kladrId ?? '').nonEmpty,
                  locality: (e.locality ?? '').nonEmpty,
                );
              }).toList() ??
              [],
          pickupAddresses: pickupAddresses
                  ?.map((e) => PickupAddress(
                      id: e.id ?? 0,
                      name: (e.name ?? '').nonEmpty,
                      address: (e.address ?? '').nonEmpty))
                  .toList() ??
              [],
          dataVersions: DataVersions(
              mainConfig: (dataVersions?.mainConfig ?? '').nonEmpty),
          promoPositions: promoPositions
                  ?.map((e) => Position(
                      id: e.id ?? 0,
                      image: (e.image ?? '').nonEmpty,
                      imageSmall: (e.imageSmall ?? '').nonEmpty,
                      info: (e.info ?? '').nonEmpty,
                      name: (e.name ?? '').nonEmpty,
                      description: (e.description ?? '').nonEmpty,
                      price: e.price ?? 0,
                      oldPrice: e.oldPrice ?? 0,
                      sections: e.sections ?? [],
                      sortableRank: e.sortableRank ?? 0,
                      hasMods: e.hasMods ?? false,
                      isDiscount: e.isDiscount ?? false,
                      modifications: e.modifications
                              ?.map((e) => Position(
                                  id: e.id ?? 0,
                                  name: (e.name ?? '').nonEmpty,
                                  description: (e.description ?? '').nonEmpty,
                                  info: (e.info ?? '').nonEmpty,
                                  price: e.price ?? 0,
                                  sections: e.sections ?? [],
                                  parentId: e.parentId ?? 0,
                                  sortableRank: e.sortableRank ?? 0,
                                  modName: e.modName,
                                  hasMods: e.hasMods ?? false,
                                  isDiscount: e.isDiscount ?? false,
                                  labelsData: e.labelsData
                                          ?.map((e) => LabelData(name: (e.name ?? '').nonEmpty, colors: ColorDomain(background: (e.colors?.background ?? '').nonEmpty, backgroundCorner: (e.colors?.backgroundCorner ?? '').nonEmpty)))
                                          .toList() ??
                                      [],
                                  labels: e.labels ?? [],
                                  oldPrice: 0,
                                  modifications: [],
                                  image: ''.nonEmpty,
                                  imageSmall: ''.nonEmpty))
                              .toList() ??
                          [],
                      labelsData: e.labelsData?.map((e) => LabelData(name: (e.name ?? '').nonEmpty, colors: ColorDomain(background: (e.colors?.background ?? '').nonEmpty, backgroundCorner: (e.colors?.backgroundCorner ?? '').nonEmpty))).toList() ?? [],
                      labels: e.labels ?? [] /*e.labels?.map((e) =>
                              Label(id: e.id ?? 0,
                                name: (e.name ?? '').nonEmpty,
                                sort: e.sort ?? 0,
                                image: (e.image ?? '').nonEmpty,)).toList() ??
                              []*/
                      ))
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
