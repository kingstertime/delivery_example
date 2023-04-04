import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/core/json_converters.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'catalog.freezed.dart';
part 'catalog.g.dart';

@freezed
class Catalog with _$Catalog {
  const factory Catalog({
    required NonEmptyString hash,
    required List<Section> sections,
    required List<MainSection> mainSections,
    required List<Label> labels,
    required List<GiftPosition> giftPositions,
    required List<Section> promoSections,
    required List<Addition> additions,
  }) = _Catalog;

  static Catalog emptyCatalog = Catalog(
      hash: ''.nonEmpty,
      sections: [],
      mainSections: [],
      labels: [],
      giftPositions: [],
      promoSections: [],
      additions: []);
}

@freezed
class Section with _$Section {
  const factory Section({
    required int id,
    required NonEmptyString name,
    required bool isActive,
    required bool isPromo,
    required int sortableRank,
    required List<Position> positions,
    required List<Subsection> subsections,
    required int imageId,
    required NonEmptyString image,
  }) = _Section;
}

@freezed
class MainSection with _$MainSection {
  const factory MainSection({
    required int id,
    required NonEmptyString name,
    required NonEmptyString customHtml,
    required int isActive,
    required int isSite,
    required int type,
    required NonEmptyString uuid,
    required int sortableRank,
    required List<Subsection> subsections,
    required NonEmptyString slug,
    required NonEmptyString navClass,
    required NonEmptyString imageSrc,
  }) = _MainSection;
}

@freezed
class Label with _$Label {
  const factory Label({
    required int id,
    required NonEmptyString name,
    required int sort,
    required NonEmptyString image,
    List<Position>? positions,
  }) = _Label;
}

@freezed
class GiftPosition with _$GiftPosition {
  const factory GiftPosition({
    required int id,
    required int giftId,
    required NonEmptyString name,
    required NonEmptyString description,
    required NonEmptyString info,
    required NonEmptyString image,
    required NonEmptyString value,
  }) = _GiftPosition;
  static GiftPosition empty = GiftPosition(
      id: 0,
      giftId: 0,
      name: ''.nonEmpty,
      description: ''.nonEmpty,
      info: ''.nonEmpty,
      image: ''.nonEmpty,
      value: ''.nonEmpty);
}

@freezed
class Addition with _$Addition {
  const factory Addition({
    required int id,
    required NonEmptyString name,
    required NonEmptyString description,
    required NonEmptyString info,
    required double price,
    required NonEmptyString image,
    required NonEmptyString imageSmall,
    required int sortableRank,
  }) = _Addition;
}

@Freezed(fromJson: true, toJson: true)
class Position with _$Position {
  const factory Position({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString name,
    @NonEmptyStringConverter() required NonEmptyString description,
    required double price,
    required double oldPrice,
    required List<int> sections,
    required int sortableRank,
    required bool hasMods,
    required bool isDiscount,
    required List<Position> modifications,
    required List<LabelData> labelsData,
    required List<int> labels,
    int? parentId,
    String? modName,
    @NonEmptyStringConverter() required NonEmptyString image,
    @NonEmptyStringConverter() required NonEmptyString imageSmall,
    @NonEmptyStringConverter() required NonEmptyString info,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}

@freezed
class Modification with _$Modification {
  const factory Modification({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString name,
    @NonEmptyStringConverter() required NonEmptyString description,
    @NonEmptyStringConverter() required NonEmptyString info,
    required double price,
    required List<int> sections,
    required int parentId,
    required int sortableRank,
    @NonEmptyStringConverter() required NonEmptyString modName,
    required bool hasMods,
    required bool isDiscount,
    List<Modification>? modifications,
    required List<LabelData> labelsData,
    required List<int> labels,
  }) = _Modification;

  factory Modification.fromJson(Map<String, dynamic> json) =>
      _$ModificationFromJson(json);
}

@freezed
class LabelData with _$LabelData {
  const factory LabelData({
    @NonEmptyStringConverter() required NonEmptyString name,
    required ColorDomain colors,
  }) = _LabelData;

  factory LabelData.fromJson(Map<String, dynamic> json) =>
      _$LabelDataFromJson(json);
}

@freezed
class ColorDomain with _$ColorDomain {
  const factory ColorDomain({
    @NonEmptyStringConverter() required NonEmptyString background,
    @NonEmptyStringConverter() required NonEmptyString backgroundCorner,
  }) = _ColorDomain;

  factory ColorDomain.fromJson(Map<String, dynamic> json) =>
      _$ColorDomainFromJson(json);
}

@freezed
class Subsection with _$Subsection {
  const factory Subsection({
    required int parentId,
    required int id,
    required NonEmptyString name,
    required int sectionId,
    required int isActive,
    required int isSite,
    required int type,
    required NonEmptyString uuid,
    required int sortableRank,
    List<Subsection>? subsection,
  }) = _Subsection;
}
