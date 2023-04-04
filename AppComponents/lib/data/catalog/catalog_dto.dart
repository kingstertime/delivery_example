import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/core/value_objects.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

part 'catalog_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CatalogDto {
  String? hash;
  List<SectionsDto>? sections;
  List<MainSectionsDto>? mainSections;
  List<LabelsDto>? labels;
  List<GiftPositionsDto>? giftPositions;
  List<SectionsDto>? promoSections;
  List<AdditionsDto>? additions;

  CatalogDto();

  factory CatalogDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SectionsDto {
  int? id;
  String? name;
  int? isActive;
  int? isPromo;
  int? sortableRank;
  List<PositionsDto>? positions;
  List<SubsectionsDto>? subsections;
  int? imageId;
  String? image;

  SectionsDto();

  factory SectionsDto.fromJson(Map<String, dynamic> json) =>
      _$SectionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PositionsDto {
  int? id;
  String? name;
  String? description;
  double? price;
  double? oldPrice;
  List<int>? sections;
  int? sortableRank;
  bool? hasMods;
  bool? isDiscount;
  List<ModificationsDto>? modifications;
  List<LabelsDataDto>? labelsData;
  List<int>? labels;
  String? image;
  String? imageSmall;
  String? info;

  PositionsDto();

  factory PositionsDto.fromJson(Map<String, dynamic> json) =>
      _$PositionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PositionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MainSectionsDto {
  int? id;
  String? name;
  String? customHtml;
  int? isActive;
  int? isSite;
  int? type;
  String? uuid;
  int? sortableRank;
  List<SubsectionsDto>? subsections;
  String? slug;
  String? navClass;
  String? imageSrc;

  MainSectionsDto();

  factory MainSectionsDto.fromJson(Map<String, dynamic> json) =>
      _$MainSectionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainSectionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SubsectionsDto {
  int? parentId;
  int? id;
  String? name;
  int? sectionId;
  int? isActive;
  int? isSite;
  int? type;
  String? uuid;
  int? sortableRank;
  List<SubsectionsDto>? subsections;

  SubsectionsDto();

  factory SubsectionsDto.fromJson(Map<String, dynamic> json) =>
      _$SubsectionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubsectionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LabelsDto {
  int? id;
  String? name;
  int? sort;
  String? image;
  List<PositionsDto>? positions;

  LabelsDto();

  factory LabelsDto.fromJson(Map<String, dynamic> json) =>
      _$LabelsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LabelsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModificationsDto {
  int? id;
  String? name;
  String? description;
  String? info;
  double? price;
  List<int>? sections;
  int? parentId;
  int? sortableRank;
  String? modName;
  bool? hasMods;
  bool? isDiscount;
  List<ModificationsDto>? modifications;
  List<LabelsDataDto>? labelsData;
  List<int>? labels;

  ModificationsDto();

  factory ModificationsDto.fromJson(Map<String, dynamic> json) =>
      _$ModificationsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ModificationsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LabelsDataDto {
  String? name;
  ColorsDto? colors;

  LabelsDataDto();

  factory LabelsDataDto.fromJson(Map<String, dynamic> json) =>
      _$LabelsDataDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LabelsDataDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ColorsDto {
  String? background;
  String? backgroundCorner;

  ColorsDto();

  factory ColorsDto.fromJson(Map<String, dynamic> json) =>
      _$ColorsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiftPositionsDto {
  int? id;
  int? giftId;
  String? name;
  String? description;
  String? info;
  String? image;
  String? value;

  GiftPositionsDto();

  factory GiftPositionsDto.fromJson(Map<String, dynamic> json) =>
      _$GiftPositionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GiftPositionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AdditionsDto {
  int? id;
  String? name;
  String? description;
  String? info;
  double? price;
  String? image;
  String? imageSmall;
  int? sortableRank;

  AdditionsDto();

  factory AdditionsDto.fromJson(Map<String, dynamic> json) =>
      _$AdditionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionsDtoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

extension CatalogDtoX on CatalogDto {
  Either<ExtendedErrors, Catalog> toDomain() {
    debugPrint('$now: toDomain: CatalogDto = ${this}');
    try {
      final domain = Catalog(
          hash: (hash ?? '').nonEmpty,
          sections: sections
                  ?.map((e) => Section(
                      id: e.id ?? 0,
                      name: (e.name ?? '').nonEmpty,
                      isActive: e.isActive == 1 ? true : false,
                      isPromo: e.isPromo == 1 ? true : false,
                      sortableRank: e.sortableRank ?? 0,
                      positions: e.positions
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
                                          ?.map((e) => Position(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, description: (e.description ?? '').nonEmpty, info: (e.info ?? '').nonEmpty, price: e.price ?? 0, sections: e.sections ?? [], parentId: e.parentId ?? 0, sortableRank: e.sortableRank ?? 0, modName: e.modName, hasMods: e.hasMods ?? false, isDiscount: e.isDiscount ?? false, labelsData: e.labelsData?.map((e) => LabelData(name: (e.name ?? '').nonEmpty, colors: ColorDomain(background: (e.colors?.background ?? '').nonEmpty, backgroundCorner: (e.colors?.backgroundCorner ?? '').nonEmpty))).toList() ?? [], labels: e.labels ?? [], oldPrice: 0, modifications: [], image: ''.nonEmpty, imageSmall: ''.nonEmpty))
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
                          [],
                      subsections: e.subsections?.map((e) => Subsection(parentId: e.parentId ?? 0, id: e.id ?? 0, name: (e.name ?? '').nonEmpty, sectionId: e.sectionId ?? 0, isActive: e.isActive ?? 0, isSite: e.isSite ?? 0, type: e.type ?? 0, uuid: (e.uuid ?? '').nonEmpty, sortableRank: e.sortableRank ?? 0)).toList() ?? [],
                      imageId: e.imageId ?? 0,
                      image: (e.image ?? '').nonEmpty))
                  .toList() ??
              [],
          mainSections: mainSections?.map((e) => MainSection(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, customHtml: (e.customHtml ?? '').nonEmpty, isActive: e.isActive ?? 0, isSite: e.isSite ?? 0, type: e.type ?? 0, uuid: (e.uuid ?? '').nonEmpty, sortableRank: e.sortableRank ?? 0, subsections: e.subsections?.map((e) => Subsection(parentId: e.parentId ?? 0, id: e.id ?? 0, name: (e.name ?? '').nonEmpty, sectionId: e.sectionId ?? 0, isActive: e.isActive ?? 0, isSite: e.isSite ?? 0, type: e.type ?? 0, uuid: (e.uuid ?? '').nonEmpty, sortableRank: e.sortableRank ?? 0)).toList() ?? [], slug: (e.slug ?? '').nonEmpty, navClass: (e.navClass ?? '').nonEmpty, imageSrc: (e.imageSrc ?? '').nonEmpty)).toList() ?? [],
          labels: labels?.map((e) => Label(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, sort: e.sort ?? 0, image: (e.image ?? '').nonEmpty)).toList() ?? [],
          giftPositions: giftPositions?.map((e) => GiftPosition(id: e.id ?? 0, giftId: e.giftId ?? 0, name: (e.name ?? '').nonEmpty, description: (e.description ?? '').nonEmpty, info: (e.info ?? '').nonEmpty, image: (e.image ?? '').nonEmpty, value: (e.value ?? '').nonEmpty)).toList() ?? [],
          promoSections: promoSections?.map((e) => Section(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, isActive: e.isActive == 1 ? true : false, isPromo: e.isPromo == 1 ? true : false, sortableRank: e.sortableRank ?? 0, positions: e.positions?.map((e) => Position(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, image: (e.image ?? '').nonEmpty, imageSmall: (e.imageSmall ?? '').nonEmpty, info: (e.info ?? '').nonEmpty, description: (e.description ?? '').nonEmpty, price: e.price ?? 0, oldPrice: e.oldPrice ?? 0, sections: e.sections ?? [], sortableRank: e.sortableRank ?? 0, hasMods: e.hasMods ?? false, isDiscount: e.isDiscount ?? false, modifications: e.modifications?.map((e) => Position(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, description: (e.description ?? '').nonEmpty, info: (e.info ?? '').nonEmpty, price: e.price ?? 0, sections: e.sections ?? [], parentId: e.parentId ?? 0, sortableRank: e.sortableRank ?? 0, modName: e.modName, hasMods: e.hasMods ?? false, isDiscount: e.isDiscount ?? false, labelsData: e.labelsData?.map((e) => LabelData(name: (e.name ?? '').nonEmpty, colors: ColorDomain(background: (e.colors?.background ?? '').nonEmpty, backgroundCorner: (e.colors?.backgroundCorner ?? '').nonEmpty))).toList() ?? [], labels: e.labels ?? [], oldPrice: 0, modifications: [], image: ''.nonEmpty, imageSmall: ''.nonEmpty)).toList() ?? [], labelsData: e.labelsData?.map((e) => LabelData(name: (e.name ?? '').nonEmpty, colors: ColorDomain(background: (e.colors?.background ?? '').nonEmpty, backgroundCorner: (e.colors?.backgroundCorner ?? '').nonEmpty))).toList() ?? [], labels: e.labels ?? [] /*e.labels?.map((e) =>
															Label(id: e.id ?? 0,
																name: (e.name ?? '').nonEmpty,
																sort: e.sort ?? 0,
																image: (e.image ?? '').nonEmpty,)).toList() ??
															[]*/
              )).toList() ?? [], subsections: e.subsections?.map((e) => Subsection(parentId: e.parentId ?? 0, id: e.id ?? 0, name: (e.name ?? '').nonEmpty, sectionId: e.sectionId ?? 0, isActive: e.isActive ?? 0, isSite: e.isSite ?? 0, type: e.type ?? 0, uuid: (e.uuid ?? '').nonEmpty, sortableRank: e.sortableRank ?? 0)).toList() ?? [], imageId: e.imageId ?? 0, image: (e.image ?? '').nonEmpty)).toList() ?? [],
          additions: additions?.map((e) => Addition(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, description: (e.description ?? '').nonEmpty, info: (e.info ?? '').nonEmpty, price: e.price ?? 0, image: (e.image ?? '').nonEmpty, imageSmall: (e.imageSmall ?? '').nonEmpty, sortableRank: e.sortableRank ?? 0)).toList() ?? []);

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
