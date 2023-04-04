import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'config_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ConfigDto {
  DeliverySettingsDto? deliverySettings;
  PickupSettingsDto? pickupSettings;
  CommonSettingsDto? commonSettings;
  List<CitiesDto>? cities;
  String? version;
  String? os;

  ConfigDto(
      {this.deliverySettings,
      this.pickupSettings,
      this.commonSettings,
      this.cities,
      this.version,
      this.os});

  factory ConfigDto.fromJson(Map<String, dynamic> json) {
    _$ConfigDtoFromJson(json);
    return _$ConfigDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConfigDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliverySettingsDto {
  String? logoUrl;
  String? orderCheckUpdate;
  OnlinePaymentDto? onlinePayment;
  List<PaymentTypesDto>? paymentTypes;
  DeliveryConditionsDto? deliveryConditions;
  DeliveryOptionsDto? delivery;
  DeliveryOptionsDto? deliveryTime;
  NumberOfPersonsDto? numberOfPersons;
  SocialNetworksDto? socialNetworks;
  PromoDto? promo;
  OnlinePaymentDto? bonuses;
  ChefGiftDto? chefGift;
  CashbackOptionDto? cashback;
  CourierDto? courier;
  OrderConfirmTypeDto? orderConfirmType;
  PickupDto? pickup;
  OnlinePaymentDto? promocodes;
  DeliveryConditionsDto? alertInCart;
  Map<int, String>? catalogs;
  List<StructureDto>? structure;
  List<ScheduleDto>? schedule;
  AdditionsDto? additions;

  DeliverySettingsDto(
      {this.logoUrl,
      this.orderCheckUpdate,
      this.onlinePayment,
      this.paymentTypes,
      this.deliveryConditions,
      this.delivery,
      this.deliveryTime,
      this.numberOfPersons,
      this.socialNetworks,
      this.promo,
      this.bonuses,
      this.chefGift,
      this.cashback,
      this.courier,
      this.orderConfirmType,
      this.pickup,
      this.promocodes,
      this.alertInCart,
      this.catalogs,
      this.structure,
      this.schedule,
      this.additions});

  factory DeliverySettingsDto.fromJson(Map<String, dynamic> json) {
    return _$DeliverySettingsDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeliverySettingsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OnlinePaymentDto {
  bool? enabled;

  OnlinePaymentDto({this.enabled});

  factory OnlinePaymentDto.fromJson(Map<String, dynamic> json) =>
      _$OnlinePaymentDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OnlinePaymentDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentTypesDto {
  int? payType;
  String? name;

  PaymentTypesDto({this.payType, this.name});

  factory PaymentTypesDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentTypesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentTypesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryConditionsDto {
  bool? enabled;
  String? text;

  DeliveryConditionsDto({this.enabled, this.text});

  factory DeliveryConditionsDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryConditionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryConditionsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryOptionsDto {
  String? text;
  List<OptionsDto>? options;

  DeliveryOptionsDto({this.text, this.options});

  factory DeliveryOptionsDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryOptionsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OptionsDto {
  String? text;
  bool? isPickup;
  bool? pickupTakeaway;
  String? now;
  String? time;

  OptionsDto(
      {this.text, this.isPickup, this.pickupTakeaway, this.now, this.time});

  factory OptionsDto.fromJson(Map<String, dynamic> json) =>
      _$OptionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OptionsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NumberOfPersonsDto {
  bool? enabled;
  int? defaultValue;

  NumberOfPersonsDto({this.enabled, this.defaultValue});

  factory NumberOfPersonsDto.fromJson(Map<String, dynamic> json) =>
      _$NumberOfPersonsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NumberOfPersonsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SocialNetworksDto {
  bool? enabled;
  String? text;
  List<SocialListDto>? list;

  SocialNetworksDto({this.enabled, this.text, this.list});

  factory SocialNetworksDto.fromJson(Map<String, dynamic> json) =>
      _$SocialNetworksDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SocialNetworksDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SocialListDto {
  String? name;
  String? url;
  String? img;
  String? imgColor;

  SocialListDto({this.name, this.url, this.img, this.imgColor});

  factory SocialListDto.fromJson(Map<String, dynamic> json) =>
      _$SocialListDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SocialListDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PromoDto {
  bool? enabled;
  String? action;
  String? text;
  String? icon;
  PromoColorsDto? colors;

  PromoDto({this.enabled, this.action, this.text, this.icon, this.colors});

  factory PromoDto.fromJson(Map<String, dynamic> json) =>
      _$PromoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PromoColorsDto {
  String? background;
  String? font;
  String? icon;
  String? rightArrow;

  PromoColorsDto({this.background, this.font, this.icon, this.rightArrow});

  factory PromoColorsDto.fromJson(Map<String, dynamic> json) =>
      _$PromoColorsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoColorsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChefGiftDto {
  bool? enabled;
  List<String>? levels;

  ChefGiftDto({this.enabled, this.levels});

  factory ChefGiftDto.fromJson(Map<String, dynamic> json) =>
      _$ChefGiftDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ChefGiftDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CashbackOptionDto {
  bool? enabled;
  int? fixed;
  int? limit;
  List<LevelsDto>? levels;

  CashbackOptionDto({this.enabled, this.fixed, this.limit, this.levels});

  factory CashbackOptionDto.fromJson(Map<String, dynamic> json) =>
      _$CashbackOptionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CashbackOptionDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LevelsDto {
  int? id;
  String? name;
  int? moneyLimitFrom;
  int? percent;
  int? isFixed;
  int? isBase;

  LevelsDto(
      {this.id,
      this.name,
      this.moneyLimitFrom,
      this.percent,
      this.isFixed,
      this.isBase});

  factory LevelsDto.fromJson(Map<String, dynamic> json) =>
      _$LevelsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LevelsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CourierDto {
  bool? enabled;
  int? coordinatesUpdate;
  int? validTimePassed;

  CourierDto({this.enabled, this.coordinatesUpdate, this.validTimePassed});

  factory CourierDto.fromJson(Map<String, dynamic> json) =>
      _$CourierDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CourierDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderConfirmTypeDto {
  bool? enabled;
  bool? defaultValue;

  OrderConfirmTypeDto({this.enabled, this.defaultValue});

  factory OrderConfirmTypeDto.fromJson(Map<String, dynamic> json) =>
      _$OrderConfirmTypeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderConfirmTypeDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PickupDto {
  int? percent;
  String? text;

  PickupDto({this.percent, this.text});

  factory PickupDto.fromJson(Map<String, dynamic> json) =>
      _$PickupDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PickupDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StructureDto {
  String? name;
  String? slug;
  String? img;
  dynamic sort;
  SettingsDto? settings;

  StructureDto({this.name, this.slug, this.img, this.sort, this.settings});

  factory StructureDto.fromJson(Map<String, dynamic> json) =>
      _$StructureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StructureDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SettingsDto {
  List<DeliveryTabsDto>? deliveryTabs;
  List<DeliveryTabsDto>? pickupTabs;

  SettingsDto({this.deliveryTabs, this.pickupTabs});

  factory SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryTabsDto {
  String? name;
  String? slug;

  DeliveryTabsDto({this.name, this.slug});

  factory DeliveryTabsDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTabsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryTabsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ScheduleDto {
  String? notWorkingText;
  bool? technicalNotWorking;
  String? technicalNotWorkingText;
  List<RangeDto>? range;
  int? cityId;

  ScheduleDto(
      {this.notWorkingText,
      this.technicalNotWorking,
      this.technicalNotWorkingText,
      this.range,
      this.cityId});

  factory ScheduleDto.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RangeDto {
  String? day;
  List<String>? from;
  List<String>? to;

  RangeDto({this.day, this.from, this.to});

  factory RangeDto.fromJson(Map<String, dynamic> json) =>
      _$RangeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RangeDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AdditionsDto {
  bool? enabled;
  String? title;

  AdditionsDto({this.enabled, this.title});

  factory AdditionsDto.fromJson(Map<String, dynamic> json) =>
      _$AdditionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PickupSettingsDto {
  String? logoUrl;
  String? orderCheckUpdate;
  OnlinePaymentDto? onlinePayment;
  OnlinePaymentDto? orderPickupReadyButton;
  List<PaymentTypesDto>? paymentTypes;
  DeliveryOptionsDto? delivery;
  DeliveryOptionsDto? deliveryTime;
  SocialNetworksDto? socialNetworks;
  PromoDto? promo;
  OnlinePaymentDto? bonuses;
  ChefGiftDto? chefGift;
  CashbackOptionDto? cashback;
  CourierDto? courier;
  OrderConfirmTypeDto? orderConfirmType;
  PickupDto? pickup;
  OnlinePaymentDto? promocodes;
  Map<int, String>? catalogs;
  List<StructureDto>? structure;
  List<ScheduleDto>? schedule;
  AdditionsDto? additions;

  PickupSettingsDto(
      {this.logoUrl,
      this.orderCheckUpdate,
      this.onlinePayment,
      this.orderPickupReadyButton,
      this.paymentTypes,
      this.delivery,
      this.deliveryTime,
      this.socialNetworks,
      this.promo,
      this.bonuses,
      this.chefGift,
      this.cashback,
      this.courier,
      this.orderConfirmType,
      this.pickup,
      this.promocodes,
      this.catalogs,
      this.structure,
      this.schedule,
      this.additions});

  factory PickupSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$PickupSettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PickupSettingsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CommonSettingsDto {
  List<String>? locales;
  String? menuType;
  bool? pickupModuleEnabled;
  String? iosAppId;
  String? androidAppId;
  ForceUpdateAppDto? forceUpdateApp;
  PagesDto? pages;
  int? maxModificationsNumber;
  ColorsAndroidDto? colors;
  ColorsAndroidDto? colorsAndroid;
  StreetsDto? streets;
  bool? phoneCallInsteadSmsCodeConfirmation;
  LocaleDto? locale;

  CommonSettingsDto(
      {this.locales,
      this.menuType,
      this.pickupModuleEnabled,
      this.iosAppId,
      this.androidAppId,
      this.forceUpdateApp,
      this.pages,
      this.maxModificationsNumber,
      this.colors,
      this.colorsAndroid,
      this.streets,
      this.phoneCallInsteadSmsCodeConfirmation,
      this.locale});

  factory CommonSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$CommonSettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CommonSettingsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ForceUpdateAppDto {
  String? type;
  int? ios;
  int? android;

  ForceUpdateAppDto({this.type, this.ios, this.android});

  factory ForceUpdateAppDto.fromJson(Map<String, dynamic> json) =>
      _$ForceUpdateAppDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ForceUpdateAppDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PagesDto {
  CitySelectDto? citySelect;
  ModeSelectDto? modeSelect;
  CitySelectDto? pickupSelect;

  PagesDto({this.citySelect, this.modeSelect, this.pickupSelect});

  factory PagesDto.fromJson(Map<String, dynamic> json) =>
      _$PagesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PagesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CitySelectDto {
  String? title;

  CitySelectDto({this.title});

  factory CitySelectDto.fromJson(Map<String, dynamic> json) =>
      _$CitySelectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CitySelectDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ModeSelectDto {
  String? title;
  DeliveryTypesDto? deliveryTypes;

  ModeSelectDto({this.title, this.deliveryTypes});

  factory ModeSelectDto.fromJson(Map<String, dynamic> json) =>
      _$ModeSelectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ModeSelectDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryTypesDto {
  String? pickup;
  String? delivery;

  DeliveryTypesDto({this.pickup, this.delivery});

  factory DeliveryTypesDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryTypesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryTypesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ColorsDto {
  MainDto? main;
  StartDto? start;
  LoginDto? login;
  NavbarDto? navbar;
  CatalogStylesDto? catalog;
  FavoritesDto? favorites;
  CartDto? cart;
  GiftDto? gift;
  OrderDto? order;
  AddressDto? adress;
  DeliveryOptionsDto? delivery;
  ThankPageDto? thankPage;
  FeedbackDto? feedback;
  PromoCodeDto? promokod;
  PickupRestaurantDto? pickupRestaurant;
  CashbackOptionDto? cashback;
  FilterDto? filter;
  MapsDto? maps;

  ColorsDto(
      {this.main,
      this.start,
      this.login,
      this.navbar,
      this.catalog,
      this.favorites,
      this.cart,
      this.gift,
      this.order,
      this.adress,
      this.delivery,
      this.thankPage,
      this.feedback,
      this.promokod,
      this.pickupRestaurant,
      this.cashback,
      this.filter,
      this.maps});

  factory ColorsDto.fromJson(Map<String, dynamic> json) =>
      _$ColorsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MainDto {
  String? startnavbar;
  String? fontColorHead;
  String? background;
  String? border;
  String? fontColor;
  String? progressBar;
  String? colorCheck;
  String? backgroundHorizontalMenu;
  String? fontColorHorizontalMenu;
  String? colorActive;
  String? colorFilterIcon;

  MainDto(
      {this.startnavbar,
      this.fontColorHead,
      this.background,
      this.border,
      this.fontColor,
      this.progressBar,
      this.colorCheck,
      this.backgroundHorizontalMenu,
      this.fontColorHorizontalMenu,
      this.colorActive,
      this.colorFilterIcon});

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginDto {
  String? background;
  String? iconColor;
  String? startnavbar;
  String? fontColor;
  String? fontColorComment;
  String? borderPlaceholders;
  String? backgroundButtonActive;
  String? fontColorButtonActive;
  String? backgroundButton;
  String? fontColorButton;
  String? fontColorKod;
  String? colorBorder;
  String? fontColorErrore;
  String? fontColorHead;

  LoginDto(
      {this.background,
      this.iconColor,
      this.startnavbar,
      this.fontColor,
      this.fontColorComment,
      this.borderPlaceholders,
      this.backgroundButtonActive,
      this.fontColorButtonActive,
      this.backgroundButton,
      this.fontColorButton,
      this.fontColorKod,
      this.colorBorder,
      this.fontColorErrore,
      this.fontColorHead});

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CatalogStylesDto {
  String? fontColorTitle;
  String? fontColorName;
  String? fontColorDesc;
  String? fontColorInfo;
  String? fontColorCost;
  String? fontColorMod;
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? backgroundButtonCheck;
  String? borderButtonCheck;
  String? fontColorButtonCheck;
  String? fontColorQuantity;
  String? fontColorPriceFrom;
  String? fontColorPriceCursor;

  CatalogStylesDto(
      {this.fontColorTitle,
      this.fontColorName,
      this.fontColorDesc,
      this.fontColorInfo,
      this.fontColorCost,
      this.fontColorMod,
      this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.backgroundButtonCheck,
      this.borderButtonCheck,
      this.fontColorButtonCheck,
      this.fontColorQuantity,
      this.fontColorPriceFrom,
      this.fontColorPriceCursor});

  factory CatalogStylesDto.fromJson(Map<String, dynamic> json) =>
      _$CatalogStylesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CatalogStylesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FavoritesDto {
  String? colorActive;
  String? color;

  FavoritesDto({this.colorActive, this.color});

  factory FavoritesDto.fromJson(Map<String, dynamic> json) =>
      _$FavoritesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CartDto {
  String? fontColorName;
  String? fontColorInfo;
  String? fontColorCost;
  String? backgroundButtonCheck;
  String? borderButtonCheck;
  String? fontColorButtonCheck;
  String? fontColorQuantity;
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? colorTime;
  String? emptyText;
  String? emptyBackground;
  String? emptyHandle;
  String? emptyBasket;
  String? inactiveBackgroundButton;
  String? inactiveBorderButton;
  String? inactiveFontColorButton;
  String? imgUrl;
  String? fontColor;
  String? colorIcon;

  CartDto(
      {this.fontColorName,
      this.fontColorInfo,
      this.fontColorCost,
      this.backgroundButtonCheck,
      this.borderButtonCheck,
      this.fontColorButtonCheck,
      this.fontColorQuantity,
      this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.colorTime,
      this.emptyText,
      this.emptyBackground,
      this.emptyHandle,
      this.emptyBasket,
      this.inactiveBackgroundButton,
      this.inactiveBorderButton,
      this.inactiveFontColorButton,
      this.colorIcon,
      this.fontColor,
      this.imgUrl});

  factory CartDto.fromJson(Map<String, dynamic> json) =>
      _$CartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GiftDto {
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? backgroundButtonInactive;
  String? borderButtonInactive;
  String? fontColorButtonInactive;
  String? fontColorLink;

  GiftDto(
      {this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.backgroundButtonInactive,
      this.borderButtonInactive,
      this.fontColorButtonInactive,
      this.fontColorLink});

  factory GiftDto.fromJson(Map<String, dynamic> json) =>
      _$GiftDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GiftDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderDto {
  String? fontColorTitle;
  String? fontColorActive;
  String? fontColorPlaceholders;
  String? fontColorCost;
  String? backgroundButtonCheck;
  String? borderButtonCheck;
  String? fontColorButtonCheck;
  String? fontColorQuantity;
  String? border;
  String? colorIcon;
  String? colorCursor;

  OrderDto(
      {this.fontColorTitle,
      this.fontColorActive,
      this.fontColorPlaceholders,
      this.fontColorCost,
      this.backgroundButtonCheck,
      this.borderButtonCheck,
      this.fontColorButtonCheck,
      this.fontColorQuantity,
      this.border,
      this.colorIcon,
      this.colorCursor});

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressDto {
  String? backgroundHead;
  String? fontColorHead;
  String? primaryColor;
  String? secondaryColor;
  String? fontColorTitle;
  String? fontColorActive;
  String? fontColorPlaceholders;
  String? border;
  String? backgroundButton;
  String? buttonImg;
  String? colorTab;
  String? fontColorComment;
  String? fontColorError;
  String? colorIconDel;

  AddressDto(
      {this.backgroundHead,
      this.fontColorHead,
      this.primaryColor,
      this.secondaryColor,
      this.fontColorTitle,
      this.fontColorActive,
      this.fontColorPlaceholders,
      this.border,
      this.backgroundButton,
      this.buttonImg,
      this.colorTab,
      this.fontColorComment,
      this.fontColorError,
      this.colorIconDel});

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DeliveryDto {
  String? background;
  String? fontColorComment;
  String? fontColor;
  String? border;
  String? backgroundDelivery;
  String? fontColorDelivery;
  String? fontColorCall;
  String? fontColorCorriere;
  String? backgroundButton;
  String? buttonImg;
  String? fontColorActiveOrders;
  String? carUrl;

  DeliveryDto(
      {this.background,
      this.fontColorComment,
      this.fontColor,
      this.border,
      this.backgroundDelivery,
      this.fontColorDelivery,
      this.fontColorCall,
      this.fontColorCorriere,
      this.backgroundButton,
      this.buttonImg,
      this.fontColorActiveOrders,
      this.carUrl});

  factory DeliveryDto.fromJson(Map<String, dynamic> json) =>
      _$DeliveryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeliveryDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ThankPageDto {
  String? fontColor;
  String? background;
  String? thankUrl;
  String? fontColorTitle;
  String? fontColorZakaz;
  String? fontColorText;
  String? colorImg;
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;

  ThankPageDto(
      {this.fontColor,
      this.background,
      this.thankUrl,
      this.backgroundButton,
      this.borderButton,
      this.colorImg,
      this.fontColorButton,
      this.fontColorText,
      this.fontColorTitle,
      this.fontColorZakaz});

  factory ThankPageDto.fromJson(Map<String, dynamic> json) =>
      _$ThankPageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ThankPageDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FeedbackDto {
  String? fontColorclose;
  String? fontColorTitle;
  String? fontColorH2;
  String? fontColorIcon;
  String? fontColorComment;
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? fontColorCommentPlaceholder;

  FeedbackDto(
      {this.fontColorclose,
      this.fontColorTitle,
      this.fontColorH2,
      this.fontColorIcon,
      this.fontColorComment,
      this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.fontColorCommentPlaceholder});

  factory FeedbackDto.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PromoCodeDto {
  String? tab;
  String? background;
  String? topBackground;
  String? topLogin;
  String? topLoginBackgroundButton;
  String? topLoginFontCollorButton;
  String? topPromoTitle;
  String? topPromokod;
  String? topPromokodBackgroundButton;
  String? topPromokodFontCollorButton;
  String? topPromokodLine;
  String? topPromokodError;
  String? promokodBackground;
  String? promokodTitle;
  String? promokodIconKod;
  String? promokodTextKod;
  String? promokodIconDate;
  String? promokodTextDate;
  String? promokodText;
  String? promokodMore;
  String? socialTitle;
  String? socialText;
  String? actionBackground;
  String? actionTitle;
  String? actionText;
  String? actionMore;

  PromoCodeDto(
      {this.tab,
      this.background,
      this.topBackground,
      this.topLogin,
      this.topLoginBackgroundButton,
      this.topLoginFontCollorButton,
      this.topPromoTitle,
      this.topPromokod,
      this.topPromokodBackgroundButton,
      this.topPromokodFontCollorButton,
      this.topPromokodLine,
      this.topPromokodError,
      this.promokodBackground,
      this.promokodTitle,
      this.promokodIconKod,
      this.promokodTextKod,
      this.promokodIconDate,
      this.promokodTextDate,
      this.promokodText,
      this.promokodMore,
      this.socialTitle,
      this.socialText,
      this.actionBackground,
      this.actionTitle,
      this.actionText,
      this.actionMore});

  factory PromoCodeDto.fromJson(Map<String, dynamic> json) =>
      _$PromoCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoCodeDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class PickupRestaurantDto {
  String? dialogNavbarBackground;
  String? dialogNavbarFontColor;
  String? dialogBackground;
  String? dialogFontColor;
  String? dialogFontColorInactive;
  String? dialogIconColor;
  String? dialogHrColor;
  String? iconEditColor;
  String? iconLocationColor;
  String? adressBackground;
  String? adressFontColor;
  String? adressHrColor;
  String? pickupBackground;
  String? pickupFontColorAdress;
  String? pickupIconColorAdress;
  String? pickupIconLocationColorAdress;
  String? pickupIconColorCheck;
  String? pickupIconColorAccepted;
  String? pickupIconColorProduction;
  String? pickupIconColorCooked;
  String? pickupStatusFontColor;
  String? pickupOrderFontColor;
  String? pickupKodFontColor;
  String? pickupContentFontColor;
  String? pickupHrColor;
  String? listBackground;
  String? listOrder;
  String? listStatus;
  String? listTime;
  String? listIcon;
  String? listHr;
  String? pickupIconColorDone;

  PickupRestaurantDto(
      {this.dialogNavbarBackground,
      this.dialogNavbarFontColor,
      this.dialogBackground,
      this.dialogFontColor,
      this.dialogFontColorInactive,
      this.dialogIconColor,
      this.dialogHrColor,
      this.iconEditColor,
      this.iconLocationColor,
      this.adressBackground,
      this.adressFontColor,
      this.adressHrColor,
      this.pickupBackground,
      this.pickupFontColorAdress,
      this.pickupIconColorAdress,
      this.pickupIconLocationColorAdress,
      this.pickupIconColorCheck,
      this.pickupIconColorAccepted,
      this.pickupIconColorProduction,
      this.pickupIconColorCooked,
      this.pickupStatusFontColor,
      this.pickupOrderFontColor,
      this.pickupKodFontColor,
      this.pickupContentFontColor,
      this.pickupHrColor,
      this.listBackground,
      this.listOrder,
      this.listStatus,
      this.listTime,
      this.listIcon,
      this.listHr,
      this.pickupIconColorDone});

  factory PickupRestaurantDto.fromJson(Map<String, dynamic> json) =>
      _$PickupRestaurantDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PickupRestaurantDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CashbackDto {
  String? backgroundNav;
  String? iconColorBonus;
  String? fontColorBonus;
  String? iconColorInfo;
  String? backgroundNavbar;
  String? fontColorNavbar;
  String? background;
  String? fontColor;
  String? fontColorStatus;
  String? fontColorSum;
  String? hrColor;
  String? fontColorTranzak;
  String? iconUrl;

  CashbackDto(
      {this.backgroundNav,
      this.iconColorBonus,
      this.fontColorBonus,
      this.iconColorInfo,
      this.backgroundNavbar,
      this.fontColorNavbar,
      this.background,
      this.fontColor,
      this.fontColorStatus,
      this.fontColorSum,
      this.hrColor,
      this.fontColorTranzak,
      this.iconUrl});

  factory CashbackDto.fromJson(Map<String, dynamic> json) =>
      _$CashbackDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CashbackDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FilterDto {
  String? backgroundNav;
  String? fontColorNav;
  String? background;
  String? fontColor;
  String? circle;
  String? circleCheck;

  FilterDto(
      {this.backgroundNav,
      this.fontColorNav,
      this.background,
      this.fontColor,
      this.circle,
      this.circleCheck});

  factory FilterDto.fromJson(Map<String, dynamic> json) =>
      _$FilterDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FilterDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MapsDto {
  String? back;

  MapsDto({this.back});

  factory MapsDto.fromJson(Map<String, dynamic> json) =>
      _$MapsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MapsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ColorsAndroidDto {
  StartDto? start;
  LoginDto? login;
  NavbarDto? navbar;
  MenuDto? menu;
  CatalogStylesDto? catalog;
  CartDto? cart;
  SaveDto? save;
  DeliveryOptionsDto? delivery;
  BillDto? bill;
  AddressBlankDto? adressBlank;
  AlertDto? allert;
  ThankPageDto? thankPage;
  FeedbackDto? feedback;
  PickupRestaurantDto? pickupRestaurant;
  CashbackOptionDto? cashback;

  ColorsAndroidDto(
      {this.start,
      this.login,
      this.navbar,
      this.menu,
      this.catalog,
      this.cart,
      this.save,
      this.delivery,
      this.bill,
      this.adressBlank,
      this.allert,
      this.thankPage,
      this.feedback,
      this.pickupRestaurant,
      this.cashback});

  factory ColorsAndroidDto.fromJson(Map<String, dynamic> json) =>
      _$ColorsAndroidDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ColorsAndroidDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StartDto {
  String? startnavbar;
  String? background;
  String? fontColorNavbar;
  String? fontColor;
  String? colorChekNavbar;
  String? colorChek;

  StartDto(
      {this.startnavbar,
      this.background,
      this.fontColorNavbar,
      this.fontColor,
      this.colorChekNavbar,
      this.colorChek});

  factory StartDto.fromJson(Map<String, dynamic> json) =>
      _$StartDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StartDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class NavbarDto {
  String? fontColorName;
  String? fontColorPhone;
  String? fontColorOut;
  String? backgroundHead;
  String? headerImgUrl;
  String? background;
  String? fontColor;
  String? liColor;
  String? liColorActive;
  String? border;
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? fontColorCopyr;
  String? backgroundBonus;
  String? fontColorBonus;
  String? fontColorLogout;
  String? fontColorHead;
  String? iconColor;
  String? liFontColorActive;

  NavbarDto(
      {this.fontColorName,
      this.fontColorPhone,
      this.fontColorOut,
      this.backgroundHead,
      this.headerImgUrl,
      this.background,
      this.fontColor,
      this.liColor,
      this.liColorActive,
      this.border,
      this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.fontColorCopyr,
      this.backgroundBonus,
      this.fontColorBonus,
      this.fontColorHead,
      this.iconColor,
      this.fontColorLogout,
      this.liFontColorActive});

  factory NavbarDto.fromJson(Map<String, dynamic> json) =>
      _$NavbarDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NavbarDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class MenuDto {
  String? backgroundDrop;
  String? fontColorDrop;
  String? backgroundMenu;
  String? fontColorMenu;
  String? colorActive;
  String? colorFilterIcon;

  MenuDto(
      {this.backgroundDrop,
      this.fontColorDrop,
      this.backgroundMenu,
      this.fontColorMenu,
      this.colorActive,
      this.colorFilterIcon});

  factory MenuDto.fromJson(Map<String, dynamic> json) =>
      _$MenuDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MenuDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class SaveDto {
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;

  SaveDto({this.backgroundButton, this.borderButton, this.fontColorButton});

  factory SaveDto.fromJson(Map<String, dynamic> json) =>
      _$SaveDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SaveDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BillDto {
  String? backgroundButton;
  String? borderButton;
  String? fontColorButton;
  String? colorCursor;

  BillDto(
      {this.backgroundButton,
      this.borderButton,
      this.fontColorButton,
      this.colorCursor});

  factory BillDto.fromJson(Map<String, dynamic> json) =>
      _$BillDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BillDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AddressBlankDto {
  String? fontColor;
  String? fontColorAdd;
  String? pointer;
  String? backgroundButton;
  String? buttonImg;
  String? fontColorComment;
  String? fontColorError;
  String? colorIconDel;

  AddressBlankDto(
      {this.fontColor,
      this.fontColorAdd,
      this.pointer,
      this.backgroundButton,
      this.buttonImg,
      this.fontColorComment,
      this.fontColorError,
      this.colorIconDel});

  factory AddressBlankDto.fromJson(Map<String, dynamic> json) =>
      _$AddressBlankDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddressBlankDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AlertDto {
  String? fontColor;
  String? fontColorLink;
  String? background;

  AlertDto({this.fontColor, this.fontColorLink, this.background});

  factory AlertDto.fromJson(Map<String, dynamic> json) =>
      _$AlertDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AlertDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StreetsDto {
  String? value;
  String? token;
  //List<dynamic>? dadataOptions;

  StreetsDto({this.value, this.token, /*this.dadataOptions*/});

  factory StreetsDto.fromJson(Map<String, dynamic> json) =>
      _$StreetsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StreetsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LocaleDto {
  String? countryIso;
  String? countryCurrency;
  String? countryCode;
  int? phoneLength;
  String? phoneMask;
  String? country;
  String? systemLocale;
  String? currency;

  LocaleDto(
      {this.countryIso,
      this.countryCurrency,
      this.countryCode,
      this.phoneLength,
      this.phoneMask,
      this.country,
      this.systemLocale,
      this.currency});

  factory LocaleDto.fromJson(Map<String, dynamic> json) =>
      _$LocaleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocaleDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CitiesDto {
  int? id;
  String? name;
  bool? isPickup;
  bool? isDelivery;
  BoundsDto? bounds;
  CoordinateDto? coordinates;
  List<dynamic>? spots;

  CitiesDto(
      {this.id,
      this.name,
      this.isPickup,
      this.isDelivery,
      this.bounds,
      this.coordinates,
      this.spots});

  factory CitiesDto.fromJson(Map<String, dynamic> json) =>
      _$CitiesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class BoundsDto {
  CoordinateDto? sw;
  CoordinateDto? ne;

  BoundsDto({this.sw, this.ne});

  factory BoundsDto.fromJson(Map<String, dynamic> json) =>
      _$BoundsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BoundsDtoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CoordinateDto {
  double? lat;
  double? lng;

  CoordinateDto({this.lat, this.lng});

  factory CoordinateDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinateDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateDtoToJson(this);
}

extension ConfigDtoX on ConfigDto {
  Either<ExtendedErrors, Config> toDomain() {
    try {
      final domain = Config(
          deliverySettings: DeliverySettings(
              logoUrl: (deliverySettings?.logoUrl ?? '').nonEmpty,
              orderCheckUpdate:
                  (deliverySettings?.orderCheckUpdate ?? '').nonEmpty,
              onlinePayment: OnlinePayment(
                  enabled: deliverySettings?.onlinePayment?.enabled ?? false),
              paymentTypes: deliverySettings?.paymentTypes?.map((e) => PaymentTypes(payType: e.payType ?? 0, name: (e.name ?? '').nonEmpty)).toList() ??
                  [],
              deliveryConditions: DeliveryConditions(
                  enabled:
                      deliverySettings?.deliveryConditions?.enabled ?? false,
                  text: (deliverySettings?.deliveryConditions?.text ?? '')
                      .nonEmpty),
              delivery: DeliveryOptions(
                  text: (deliverySettings?.delivery?.text ?? '').nonEmpty,
                  options: deliverySettings?.delivery?.options?.map((e) => Options(text: (e.text ?? '').nonEmpty, isPickup: e.isPickup ?? false, pickupTakeaway: e.pickupTakeaway ?? false, now: (e.now ?? '').nonEmpty, time: (e.time ?? '').nonEmpty)).toList() ??
                      []),
              deliveryTime: DeliveryOptions(
                  text: (deliverySettings?.deliveryTime?.text ?? '').nonEmpty,
                  options: deliverySettings?.deliveryTime?.options?.map((e) => Options(text: (e.text ?? '').nonEmpty, isPickup: e.isPickup ?? false, pickupTakeaway: e.pickupTakeaway ?? false, now: (e.now ?? '').nonEmpty, time: (e.time ?? '').nonEmpty)).toList() ??
                      []),
              numberOfPersons: NumberOfPersons(
                  enabled: deliverySettings?.numberOfPersons?.enabled ?? false,
                  defaultValue:
                      deliverySettings?.numberOfPersons?.defaultValue ?? 0),
              socialNetworks: SocialNetworks(
                  enabled: deliverySettings?.socialNetworks?.enabled ?? false,
                  text: (deliverySettings?.socialNetworks?.text ?? '').nonEmpty,
                  list: deliverySettings?.socialNetworks?.list
                          ?.map((e) => SocialList(name: (e.name ?? '').nonEmpty, url: (e.url ?? '').nonEmpty, img: (e.img ?? '').nonEmpty, imgColor: (e.imgColor ?? '').nonEmpty))
                          .toList() ??
                      []),
              promo: Promo(enabled: deliverySettings?.promo?.enabled ?? false, action: (deliverySettings?.promo?.action ?? '').nonEmpty, text: (deliverySettings?.promo?.text ?? '').nonEmpty, icon: (deliverySettings?.promo?.icon ?? '').nonEmpty, colors: PromoColors(background: (deliverySettings?.promo?.colors?.background ?? '').nonEmpty, font: (deliverySettings?.promo?.colors?.font ?? '').nonEmpty, icon: (deliverySettings?.promo?.colors?.icon ?? '').nonEmpty, rightArrow: (deliverySettings?.promo?.colors?.rightArrow ?? '').nonEmpty)),
              bonuses: OnlinePayment(enabled: deliverySettings?.bonuses?.enabled ?? false),
              chefGift: ChefGift(
                enabled: deliverySettings?.chefGift?.enabled ?? false,
                levels: deliverySettings?.chefGift?.levels
                        ?.map((e) => e.nonEmpty)
                        .toList() ??
                    [],
              ),
              cashback: CashbackOption(enabled: deliverySettings?.cashback?.enabled ?? false, fixed: deliverySettings?.cashback?.fixed ?? 0, limit: deliverySettings?.cashback?.limit ?? 0, levels: deliverySettings?.cashback?.levels?.map((e) => Levels(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, moneyLimitFrom: e.moneyLimitFrom ?? 0, percent: e.percent ?? 0, isFixed: e.isFixed ?? 0, isBase: e.isBase ?? 0)).toList() ?? []),
              courier: Courier(enabled: deliverySettings?.courier?.enabled ?? false, coordinatesUpdate: deliverySettings?.courier?.coordinatesUpdate ?? 0, validTimePassed: deliverySettings?.courier?.validTimePassed ?? 0),
              orderConfirmType: OrderConfirmType(enabled: deliverySettings?.orderConfirmType?.enabled ?? false, defaultValue: deliverySettings?.orderConfirmType?.defaultValue ?? false),
              pickup: Pickup(percent: deliverySettings?.pickup?.percent ?? 0, text: (deliverySettings?.pickup?.text ?? '').nonEmpty),
              promocodes: OnlinePayment(enabled: deliverySettings?.promocodes?.enabled ?? false),
              alertInCart: DeliveryConditions(enabled: deliverySettings?.alertInCart?.enabled ?? false, text: (deliverySettings?.alertInCart?.text ?? '').nonEmpty),
              catalogs: deliverySettings?.catalogs ?? {},
              structure: deliverySettings?.structure
                      ?.map((e) => Structure(
                          name: (e.name ?? '').nonEmpty,
                          slug: (e.slug ?? '').nonEmpty,
                          img: (e.img ?? '').nonEmpty,
                          sort: ''.nonEmpty,
                          settings: Settings(
                            deliveryTabs: e.settings?.deliveryTabs
                                    ?.map((e) => DeliveryTabs(
                                        name: (e.name ?? '').nonEmpty,
                                        slug: (e.slug ?? '').nonEmpty))
                                    .toList() ??
                                [],
                            pickupTabs: e.settings?.pickupTabs
                                    ?.map((e) => DeliveryTabs(
                                        name: (e.name ?? '').nonEmpty,
                                        slug: (e.slug ?? '').nonEmpty))
                                    .toList() ??
                                [],
                          )))
                      .toList() ??
                  [],
              schedule: deliverySettings?.schedule?.map((e) => Schedule(notWorkingText: (e.notWorkingText ?? '').nonEmpty, technicalNotWorking: e.technicalNotWorking ?? false, technicalNotWorkingText: (e.technicalNotWorkingText ?? '').nonEmpty, range: e.range?.map((e) => Range(day: (e.day ?? '').nonEmpty, from: e.from?.map((e) => e.nonEmpty).toList() ?? [], to: e.to?.map((e) => e.nonEmpty).toList() ?? [])).toList() ?? [], cityId: e.cityId ?? 0)).toList() ?? [],
              additions: Additions(enabled: deliverySettings?.additions?.enabled ?? false, title: (deliverySettings?.additions?.title ?? '').nonEmpty)),
          pickupSettings: PickupSettings(
              logoUrl: (pickupSettings?.logoUrl ?? '').nonEmpty,
              orderCheckUpdate: (pickupSettings?.orderCheckUpdate ?? '').nonEmpty,
              onlinePayment: OnlinePayment(enabled: pickupSettings?.onlinePayment?.enabled ?? false),
              paymentTypes: pickupSettings?.paymentTypes?.map((e) => PaymentTypes(payType: e.payType ?? 0, name: (e.name ?? '').nonEmpty)).toList() ?? [],
              delivery: DeliveryOptions(text: (pickupSettings?.delivery?.text ?? '').nonEmpty, options: pickupSettings?.delivery?.options?.map((e) => Options(text: (e.text ?? '').nonEmpty, isPickup: e.isPickup ?? false, pickupTakeaway: e.pickupTakeaway ?? false, now: (e.now ?? '').nonEmpty, time: (e.time ?? '').nonEmpty)).toList() ?? []),
              deliveryTime: DeliveryOptions(text: (pickupSettings?.deliveryTime?.text ?? '').nonEmpty, options: pickupSettings?.deliveryTime?.options?.map((e) => Options(text: (e.text ?? '').nonEmpty, isPickup: e.isPickup ?? false, pickupTakeaway: e.pickupTakeaway ?? false, now: (e.now ?? '').nonEmpty, time: (e.time ?? '').nonEmpty)).toList() ?? []),
              socialNetworks: SocialNetworks(enabled: pickupSettings?.socialNetworks?.enabled ?? false, text: (pickupSettings?.socialNetworks?.text ?? '').nonEmpty, list: pickupSettings?.socialNetworks?.list?.map((e) => SocialList(name: (e.name ?? '').nonEmpty, url: (e.url ?? '').nonEmpty, img: (e.img ?? '').nonEmpty, imgColor: (e.imgColor ?? '').nonEmpty)).toList() ?? []),
              promo: Promo(enabled: pickupSettings?.promo?.enabled ?? false, action: (pickupSettings?.promo?.action ?? '').nonEmpty, text: (pickupSettings?.promo?.text ?? '').nonEmpty, icon: (pickupSettings?.promo?.icon ?? '').nonEmpty, colors: PromoColors(background: (pickupSettings?.promo?.colors?.background ?? '').nonEmpty, font: (pickupSettings?.promo?.colors?.font ?? '').nonEmpty, icon: (pickupSettings?.promo?.colors?.icon ?? '').nonEmpty, rightArrow: (pickupSettings?.promo?.colors?.rightArrow ?? '').nonEmpty)),
              bonuses: OnlinePayment(enabled: pickupSettings?.bonuses?.enabled ?? false),
              chefGift: ChefGift(
                enabled: pickupSettings?.chefGift?.enabled ?? false,
                levels: pickupSettings?.chefGift?.levels
                        ?.map((e) => e.nonEmpty)
                        .toList() ??
                    [],
              ),
              cashback: CashbackOption(enabled: pickupSettings?.cashback?.enabled ?? false, fixed: pickupSettings?.cashback?.fixed ?? 0, limit: pickupSettings?.cashback?.limit ?? 0, levels: pickupSettings?.cashback?.levels?.map((e) => Levels(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, moneyLimitFrom: e.moneyLimitFrom ?? 0, percent: e.percent ?? 0, isFixed: e.isFixed ?? 0, isBase: e.isBase ?? 0)).toList() ?? []),
              courier: Courier(enabled: pickupSettings?.courier?.enabled ?? false, coordinatesUpdate: pickupSettings?.courier?.coordinatesUpdate ?? 0, validTimePassed: pickupSettings?.courier?.validTimePassed ?? 0),
              orderConfirmType: OrderConfirmType(enabled: pickupSettings?.orderConfirmType?.enabled ?? false, defaultValue: pickupSettings?.orderConfirmType?.defaultValue ?? false),
              pickup: Pickup(percent: pickupSettings?.pickup?.percent ?? 0, text: (pickupSettings?.pickup?.text ?? '').nonEmpty),
              promocodes: OnlinePayment(enabled: pickupSettings?.promocodes?.enabled ?? false),
              catalogs: pickupSettings?.catalogs ?? {},
              structure: pickupSettings?.structure
                      ?.map((e) => Structure(
                          name: (e.name ?? '').nonEmpty,
                          slug: (e.slug ?? '').nonEmpty,
                          img: (e.img ?? '').nonEmpty,
                          sort: ''.nonEmpty,
                          settings: Settings(
                            deliveryTabs: e.settings?.deliveryTabs
                                    ?.map((e) => DeliveryTabs(
                                        name: (e.name ?? '').nonEmpty,
                                        slug: (e.slug ?? '').nonEmpty))
                                    .toList() ??
                                [],
                            pickupTabs: e.settings?.pickupTabs
                                    ?.map((e) => DeliveryTabs(
                                        name: (e.name ?? '').nonEmpty,
                                        slug: (e.slug ?? '').nonEmpty))
                                    .toList() ??
                                [],
                          )))
                      .toList() ??
                  [],
              schedule: pickupSettings?.schedule?.map((e) => Schedule(notWorkingText: (e.notWorkingText ?? '').nonEmpty, technicalNotWorking: e.technicalNotWorking ?? false, technicalNotWorkingText: (e.technicalNotWorkingText ?? '').nonEmpty, range: e.range?.map((e) => Range(day: (e.day ?? '').nonEmpty, from: e.from?.map((e) => e.nonEmpty).toList() ?? [], to: e.to?.map((e) => e.nonEmpty).toList() ?? [])).toList() ?? [], cityId: e.cityId ?? 0)).toList() ?? [],
              additions: Additions(enabled: pickupSettings?.additions?.enabled ?? false, title: (pickupSettings?.additions?.title ?? '').nonEmpty),
              orderPickupReadyButton: OnlinePayment(enabled: pickupSettings?.orderPickupReadyButton?.enabled ?? false)),
          commonSettings: CommonSettings(
              locales: commonSettings?.locales?.map((e) => e.nonEmpty).toList() ?? [],
              menuType: (commonSettings?.menuType ?? '').nonEmpty,
              pickupModuleEnabled: commonSettings?.pickupModuleEnabled ?? false,
              iosAppId: (commonSettings?.iosAppId ?? '').nonEmpty,
              androidAppId: (commonSettings?.androidAppId ?? '').nonEmpty,
              forceUpdateApp: ForceUpdateApp(type: (commonSettings?.forceUpdateApp?.type ?? '').nonEmpty, ios: commonSettings?.forceUpdateApp?.ios ?? 0, android: commonSettings?.forceUpdateApp?.android ?? 0),
              pages: Pages(citySelect: CitySelect(title: (commonSettings?.pages?.citySelect?.title ?? '').nonEmpty), modeSelect: ModeSelect(title: (commonSettings?.pages?.modeSelect?.title ?? '').nonEmpty, deliveryTypes: DeliveryTypes(pickup: (commonSettings?.pages?.modeSelect?.deliveryTypes?.pickup ?? '').nonEmpty, delivery: (commonSettings?.pages?.modeSelect?.deliveryTypes?.delivery ?? '').nonEmpty)), pickupSelect: CitySelect(title: (commonSettings?.pages?.pickupSelect?.title ?? '').nonEmpty)),
              maxModificationsNumber: commonSettings?.maxModificationsNumber ?? 0,
              colors: ColorsAndroid(
                start: Start(
                  startnavbar:
                  (commonSettings?.colors?.start?.startnavbar ?? '')
                      .nonEmpty,
                  background:
                  (commonSettings?.colors?.start?.background ?? '')
                      .nonEmpty,
                  fontColorNavbar:
                  (commonSettings?.colors?.start?.fontColorNavbar ??
                      '')
                      .nonEmpty,
                  fontColor:
                  (commonSettings?.colors?.start?.fontColor ?? '')
                      .nonEmpty,
                  colorChek:
                  (commonSettings?.colors?.start?.colorChek ?? '')
                      .nonEmpty,
                  colorChekNavbar:
                  (commonSettings?.colors?.start?.colorChekNavbar ??
                      '')
                      .nonEmpty,
                ),
                login: Login(
                    background:
                    (commonSettings?.colors?.login?.background ?? '')
                        .nonEmpty,
                    iconColor: (commonSettings?.colors?.login?.iconColor ?? '')
                        .nonEmpty,
                    startnavbar:
                    (commonSettings?.colors?.login?.startnavbar ?? '')
                        .nonEmpty,
                    fontColor: (commonSettings?.colors?.login?.fontColor ?? '')
                        .nonEmpty,
                    fontColorComment:
                    (commonSettings?.colors?.login?.fontColorComment ?? '')
                        .nonEmpty,
                    borderPlaceholders:
                    (commonSettings?.colors?.login?.borderPlaceholders ?? '')
                        .nonEmpty,
                    backgroundButtonActive:
                    (commonSettings?.colors?.login?.backgroundButtonActive ?? '')
                        .nonEmpty,
                    fontColorButtonActive:
                    (commonSettings?.colors?.login?.fontColorButton ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colors?.login?.background ?? '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colors?.login?.fontColorButton ?? '')
                        .nonEmpty,
                    fontColorKod: (commonSettings?.colors?.login?.fontColorKod ?? '').nonEmpty,
                    colorBorder: (commonSettings?.colors?.login?.colorBorder ?? '').nonEmpty,
                    fontColorErrore: (commonSettings?.colors?.login?.fontColorErrore ?? '').nonEmpty,
                    fontColorHead: (commonSettings?.colors?.login?.fontColorHead ?? '').nonEmpty),
                navbar: Navbar(
                  fontColorName:
                  (commonSettings?.colors?.navbar?.fontColorName ??
                      '')
                      .nonEmpty,
                  fontColorPhone:
                  (commonSettings?.colors?.navbar?.fontColorPhone ??
                      '')
                      .nonEmpty,
                  fontColorOut:
                  (commonSettings?.colors?.navbar?.fontColorOut ??
                      '')
                      .nonEmpty,
                  backgroundHead:
                  (commonSettings?.colors?.navbar?.backgroundHead ??
                      '')
                      .nonEmpty,
                  headerImgUrl:
                  (commonSettings?.colors?.navbar?.headerImgUrl ??
                      '')
                      .nonEmpty,
                  background:
                  (commonSettings?.colors?.navbar?.background ?? '')
                      .nonEmpty,
                  fontColor:
                  (commonSettings?.colors?.navbar?.fontColor ?? '')
                      .nonEmpty,
                  liColor:
                  (commonSettings?.colors?.navbar?.liColor ?? '')
                      .nonEmpty,
                  liColorActive: (commonSettings
                      ?.colors?.navbar?.liFontColorActive ??
                      '')
                      .nonEmpty,
                  border: (commonSettings?.colors?.navbar?.border ?? '')
                      .nonEmpty,
                  backgroundButton: (commonSettings
                      ?.colors?.navbar?.backgroundButton ??
                      '')
                      .nonEmpty,
                  borderButton:
                  (commonSettings?.colors?.navbar?.borderButton ??
                      '')
                      .nonEmpty,
                  fontColorButton:
                  (commonSettings?.colors?.navbar?.fontColorButton ??
                      '')
                      .nonEmpty,
                  fontColorCopyr:
                  (commonSettings?.colors?.navbar?.fontColorCopyr ??
                      '')
                      .nonEmpty,
                  backgroundBonus:
                  (commonSettings?.colors?.navbar?.backgroundBonus ??
                      '')
                      .nonEmpty,
                  fontColorBonus:
                  (commonSettings?.colors?.navbar?.fontColorBonus ??
                      '')
                      .nonEmpty,
                  fontColorLogout:
                  (commonSettings?.colors?.navbar?.fontColorLogout ??
                      '')
                      .nonEmpty,
                  fontColorHead:
                  (commonSettings?.colors?.navbar?.fontColorHead ??
                      '')
                      .nonEmpty,
                  iconColor:
                  (commonSettings?.colors?.navbar?.iconColor ?? '')
                      .nonEmpty,
                  liFontColorActive: (commonSettings
                      ?.colors?.navbar?.liFontColorActive ??
                      '')
                      .nonEmpty,
                ),
                menu: Menu(
                    backgroundDrop: (commonSettings
                        ?.colors?.menu?.backgroundDrop ??
                        '')
                        .nonEmpty,
                    fontColorDrop:
                    (commonSettings?.colors?.menu?.fontColorDrop ??
                        '')
                        .nonEmpty,
                    backgroundMenu:
                    (commonSettings?.colors?.menu?.backgroundMenu ??
                        '')
                        .nonEmpty,
                    fontColorMenu:
                    (commonSettings
                        ?.colors?.menu?.fontColorMenu ??
                        '')
                        .nonEmpty,
                    colorActive:
                    (commonSettings?.colors?.menu?.colorActive ?? '')
                        .nonEmpty,
                    colorFilterIcon:
                    (commonSettings?.colors?.menu?.colorFilterIcon ??
                        '')
                        .nonEmpty),
                catalog: CatalogStyle(
                    fontColorTitle:
                    (commonSettings?.colors?.catalog?.fontColorTitle ?? '')
                        .nonEmpty,
                    fontColorName:
                    (commonSettings?.colors?.catalog?.fontColorName ?? '')
                        .nonEmpty,
                    fontColorDesc:
                    (commonSettings?.colors?.catalog?.fontColorDesc ?? '')
                        .nonEmpty,
                    fontColorInfo:
                    (commonSettings?.colors?.catalog?.fontColorInfo ?? '')
                        .nonEmpty,
                    fontColorCost:
                    (commonSettings?.colors?.catalog?.fontColorCost ?? '')
                        .nonEmpty,
                    fontColorMod: (commonSettings?.colors?.catalog?.fontColorMod ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colors?.catalog?.backgroundButton ?? '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colors?.catalog?.borderButton ?? '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colors?.catalog?.fontColorButton ?? '')
                        .nonEmpty,
                    backgroundButtonCheck:
                    (commonSettings?.colors?.catalog?.backgroundButtonCheck ?? '')
                        .nonEmpty,
                    borderButtonCheck:
                    (commonSettings?.colors?.catalog?.borderButtonCheck ?? '').nonEmpty,
                    fontColorButtonCheck: (commonSettings?.colors?.catalog?.fontColorButtonCheck ?? '').nonEmpty,
                    fontColorQuantity: (commonSettings?.colors?.catalog?.fontColorQuantity ?? '').nonEmpty,
                    fontColorPriceFrom: (commonSettings?.colors?.catalog?.fontColorPriceFrom ?? '').nonEmpty,
                    fontColorPriceCursor: (commonSettings?.colors?.catalog?.fontColorPriceCursor ?? '').nonEmpty),
                cart: Cart(
                    fontColorName: (commonSettings?.colors?.cart?.fontColorName ?? '')
                        .nonEmpty,
                    fontColorInfo:
                    (commonSettings?.colors?.cart?.fontColorInfo ?? '')
                        .nonEmpty,
                    fontColorCost:
                    (commonSettings?.colors?.cart?.fontColorCost ?? '')
                        .nonEmpty,
                    backgroundButtonCheck:
                    (commonSettings?.colors?.cart?.backgroundButtonCheck ?? '')
                        .nonEmpty,
                    borderButtonCheck:
                    (commonSettings?.colorsAndroid?.cart?.borderButtonCheck ?? '')
                        .nonEmpty,
                    fontColorButtonCheck:
                    (commonSettings?.colorsAndroid?.cart?.fontColorButtonCheck ?? '')
                        .nonEmpty,
                    fontColorQuantity:
                    (commonSettings?.colorsAndroid?.cart?.fontColorQuantity ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colorsAndroid?.cart?.backgroundButton ?? '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colorsAndroid?.cart?.borderButton ?? '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colorsAndroid?.cart?.fontColorButton ?? '').nonEmpty,
                    colorTime: (commonSettings?.colorsAndroid?.cart?.colorTime ?? '').nonEmpty,
                    emptyText: (commonSettings?.colorsAndroid?.cart?.emptyText ?? '').nonEmpty,
                    emptyBackground: (commonSettings?.colorsAndroid?.cart?.emptyBackground ?? '').nonEmpty,
                    emptyHandle: (commonSettings?.colorsAndroid?.cart?.emptyHandle ?? '').nonEmpty,
                    emptyBasket: (commonSettings?.colorsAndroid?.cart?.emptyBasket ?? '').nonEmpty,
                    inactiveBackgroundButton: (commonSettings?.colorsAndroid?.cart?.inactiveBackgroundButton ?? '').nonEmpty,
                    inactiveBorderButton: (commonSettings?.colorsAndroid?.cart?.inactiveBorderButton ?? '').nonEmpty,
                    inactiveFontColorButton: (commonSettings?.colorsAndroid?.cart?.inactiveFontColorButton ?? '').nonEmpty,
                    imgUrl: (commonSettings?.colorsAndroid?.cart?.imgUrl ?? '').nonEmpty,
                    fontColor: (commonSettings?.colorsAndroid?.cart?.fontColor ?? '').nonEmpty,
                    colorIcon: (commonSettings?.colorsAndroid?.cart?.colorIcon ?? '').nonEmpty),
                save: Save(
                    backgroundButton: (commonSettings
                        ?.colorsAndroid?.save?.backgroundButton ??
                        '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colorsAndroid?.save?.borderButton ??
                        '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colorsAndroid?.save?.fontColorButton ??
                        '')
                        .nonEmpty),
                delivery: DeliveryOptions(
                    text: (commonSettings?.colorsAndroid?.delivery?.text ?? '')
                        .nonEmpty,
                    options: commonSettings?.colorsAndroid?.delivery?.options
                        ?.map((e) => Options(
                        text: (e.text ?? '').nonEmpty,
                        isPickup: e.isPickup ?? false,
                        pickupTakeaway: e.pickupTakeaway ?? false,
                        now: (e.now ?? '').nonEmpty,
                        time: (e.time ?? '').nonEmpty))
                        .toList() ??
                        []),
                bill: Bill(
                    backgroundButton: (commonSettings
                        ?.colorsAndroid?.bill?.backgroundButton ??
                        '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colorsAndroid?.bill?.borderButton ??
                        '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colorsAndroid?.bill?.fontColorButton ??
                        '')
                        .nonEmpty,
                    colorCursor:
                    (commonSettings?.colorsAndroid?.bill?.colorCursor ?? '')
                        .nonEmpty),
                adressBlank: AddressBlank(
                    fontColor:
                    (commonSettings?.colorsAndroid?.adressBlank?.fontColor ?? '')
                        .nonEmpty,
                    fontColorAdd:
                    (commonSettings?.colorsAndroid?.adressBlank?.fontColorAdd ?? '')
                        .nonEmpty,
                    pointer:
                    (commonSettings?.colorsAndroid?.adressBlank?.pointer ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colorsAndroid?.adressBlank?.backgroundButton ?? '')
                        .nonEmpty,
                    buttonImg:
                    (commonSettings?.colorsAndroid?.adressBlank?.buttonImg ?? '')
                        .nonEmpty,
                    fontColorComment: (commonSettings?.colorsAndroid
                        ?.adressBlank?.fontColorComment ??
                        '')
                        .nonEmpty,
                    fontColorError: (commonSettings
                        ?.colorsAndroid?.adressBlank?.fontColorError ??
                        '')
                        .nonEmpty,
                    colorIconDel:
                    (commonSettings?.colorsAndroid?.adressBlank?.colorIconDel ??
                        '')
                        .nonEmpty),
                allert: Alert(
                    fontColor:
                    (commonSettings?.colorsAndroid?.allert?.fontColor ?? '')
                        .nonEmpty,
                    fontColorLink:
                    (commonSettings?.colorsAndroid?.allert?.fontColorLink ??
                        '')
                        .nonEmpty,
                    background:
                    (commonSettings?.colorsAndroid?.allert?.background ??
                        '')
                        .nonEmpty),
                thankPage: ThankPage(
                    fontColor:
                    (commonSettings?.colorsAndroid?.thankPage?.fontColor ?? '')
                        .nonEmpty,
                    background:
                    (commonSettings?.colorsAndroid?.thankPage?.background ?? '')
                        .nonEmpty,
                    thankUrl:
                    (commonSettings?.colorsAndroid?.thankPage?.thankUrl ?? '')
                        .nonEmpty,
                    fontColorTitle:
                    (commonSettings?.colorsAndroid?.thankPage?.fontColorTitle ?? '')
                        .nonEmpty,
                    fontColorZakaz:
                    (commonSettings?.colorsAndroid?.thankPage?.fontColorZakaz ?? '')
                        .nonEmpty,
                    fontColorText:
                    (commonSettings?.colorsAndroid?.thankPage?.fontColorText ?? '')
                        .nonEmpty,
                    colorImg:
                    (commonSettings?.colorsAndroid?.thankPage?.colorImg ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colorsAndroid?.thankPage?.backgroundButton ?? '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colorsAndroid?.thankPage?.borderButton ?? '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colorsAndroid?.thankPage?.fontColorButton ?? '')
                        .nonEmpty),
                feedback: Feedback(
                    fontColorclose:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorclose ?? '')
                        .nonEmpty,
                    fontColorTitle:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorTitle ?? '')
                        .nonEmpty,
                    fontColorH2:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorH2 ?? '')
                        .nonEmpty,
                    fontColorIcon:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorIcon ?? '')
                        .nonEmpty,
                    fontColorComment:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorComment ?? '')
                        .nonEmpty,
                    backgroundButton:
                    (commonSettings?.colorsAndroid?.feedback?.backgroundButton ?? '')
                        .nonEmpty,
                    borderButton:
                    (commonSettings?.colorsAndroid?.feedback?.borderButton ?? '')
                        .nonEmpty,
                    fontColorButton:
                    (commonSettings?.colorsAndroid?.feedback?.fontColorButton ?? '')
                        .nonEmpty,
                    fontColorCommentPlaceholder: (commonSettings?.colorsAndroid
                        ?.feedback?.fontColorCommentPlaceholder ??
                        '')
                        .nonEmpty),
                pickupRestaurant: PickupRestaurant(
                    dialogNavbarBackground: (commonSettings?.colorsAndroid
                        ?.pickupRestaurant?.dialogNavbarBackground ??
                        '')
                        .nonEmpty,
                    dialogNavbarFontColor: (commonSettings?.colorsAndroid
                        ?.pickupRestaurant?.dialogNavbarFontColor ??
                        '')
                        .nonEmpty,
                    dialogBackground:
                    (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogBackground ?? '')
                        .nonEmpty,
                    dialogFontColor:
                    (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogFontColor ?? '')
                        .nonEmpty,
                    dialogFontColorInactive: (commonSettings?.colorsAndroid
                        ?.pickupRestaurant?.dialogFontColorInactive ??
                        '')
                        .nonEmpty,
                    dialogIconColor:
                    (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogIconColor ?? '').nonEmpty,
                    dialogHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogHrColor ?? '').nonEmpty,
                    iconEditColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.iconEditColor ?? '').nonEmpty,
                    iconLocationColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.iconLocationColor ?? '').nonEmpty,
                    adressBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressBackground ?? '').nonEmpty,
                    adressFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressFontColor ?? '').nonEmpty,
                    adressHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressHrColor ?? '').nonEmpty,
                    pickupBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupBackground ?? '').nonEmpty,
                    pickupFontColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupFontColorAdress ?? '').nonEmpty,
                    pickupIconColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorAdress ?? '').nonEmpty,
                    pickupIconLocationColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconLocationColorAdress ?? '').nonEmpty,
                    pickupIconColorCheck: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorCheck ?? '').nonEmpty,
                    pickupIconColorAccepted: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorAccepted ?? '').nonEmpty,
                    pickupIconColorProduction: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorProduction ?? '').nonEmpty,
                    pickupIconColorCooked: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorCooked ?? '').nonEmpty,
                    pickupStatusFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupStatusFontColor ?? '').nonEmpty,
                    pickupOrderFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupOrderFontColor ?? '').nonEmpty,
                    pickupKodFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupKodFontColor ?? '').nonEmpty,
                    pickupContentFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupContentFontColor ?? '').nonEmpty,
                    pickupHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupHrColor ?? '').nonEmpty,
                    listBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.listBackground ?? '').nonEmpty,
                    listOrder: (commonSettings?.colorsAndroid?.pickupRestaurant?.listOrder ?? '').nonEmpty,
                    listStatus: (commonSettings?.colorsAndroid?.pickupRestaurant?.listStatus ?? '').nonEmpty,
                    listTime: (commonSettings?.colorsAndroid?.pickupRestaurant?.listTime ?? '').nonEmpty,
                    listIcon: (commonSettings?.colorsAndroid?.pickupRestaurant?.listIcon ?? '').nonEmpty,
                    listHr: (commonSettings?.colorsAndroid?.pickupRestaurant?.listHr ?? '').nonEmpty,
                    pickupIconColorDone: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorDone ?? '').nonEmpty),
                cashback: CashbackOption(
                    enabled: commonSettings?.colorsAndroid?.cashback?.enabled ??
                        false,
                    fixed: commonSettings?.colorsAndroid?.cashback?.fixed ?? 0,
                    limit: commonSettings?.colorsAndroid?.cashback?.limit ?? 0,
                    levels: commonSettings?.colorsAndroid?.cashback?.levels
                        ?.map((e) => Levels(
                        id: e.id ?? 0,
                        name: (e.name ?? '').nonEmpty,
                        moneyLimitFrom: e.moneyLimitFrom ?? 0,
                        percent: e.percent ?? 0,
                        isFixed: e.isFixed ?? 0,
                        isBase: e.isBase ?? 0))
                        .toList() ??
                        []),
              ),
              colorsAndroid: ColorsAndroid(
                start: Start(
                  startnavbar:
                      (commonSettings?.colorsAndroid?.start?.startnavbar ?? '')
                          .nonEmpty,
                  background:
                      (commonSettings?.colorsAndroid?.start?.background ?? '')
                          .nonEmpty,
                  fontColorNavbar:
                      (commonSettings?.colorsAndroid?.start?.fontColorNavbar ??
                              '')
                          .nonEmpty,
                  fontColor:
                      (commonSettings?.colorsAndroid?.start?.fontColor ?? '')
                          .nonEmpty,
                  colorChek:
                      (commonSettings?.colorsAndroid?.start?.colorChek ?? '')
                          .nonEmpty,
                  colorChekNavbar:
                      (commonSettings?.colorsAndroid?.start?.colorChekNavbar ??
                              '')
                          .nonEmpty,
                ),
                login: Login(
                    background:
                        (commonSettings?.colorsAndroid?.login?.background ?? '')
                            .nonEmpty,
                    iconColor: (commonSettings?.colorsAndroid?.login?.iconColor ?? '')
                        .nonEmpty,
                    startnavbar:
                        (commonSettings?.colorsAndroid?.login?.startnavbar ?? '')
                            .nonEmpty,
                    fontColor: (commonSettings?.colorsAndroid?.login?.fontColor ?? '')
                        .nonEmpty,
                    fontColorComment:
                        (commonSettings?.colorsAndroid?.login?.fontColorComment ?? '')
                            .nonEmpty,
                    borderPlaceholders:
                        (commonSettings?.colorsAndroid?.login?.borderPlaceholders ?? '')
                            .nonEmpty,
                    backgroundButtonActive:
                        (commonSettings?.colorsAndroid?.login?.backgroundButtonActive ?? '')
                            .nonEmpty,
                    fontColorButtonActive:
                        (commonSettings?.colorsAndroid?.login?.fontColorButton ?? '')
                            .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.login?.background ?? '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.login?.fontColorButton ?? '')
                            .nonEmpty,
                    fontColorKod: (commonSettings?.colorsAndroid?.login?.fontColorKod ?? '').nonEmpty,
                    colorBorder: (commonSettings?.colorsAndroid?.login?.colorBorder ?? '').nonEmpty,
                    fontColorErrore: (commonSettings?.colorsAndroid?.login?.fontColorErrore ?? '').nonEmpty,
                    fontColorHead: (commonSettings?.colorsAndroid?.login?.fontColorHead ?? '').nonEmpty),
                navbar: Navbar(
                  fontColorName:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorName ??
                              '')
                          .nonEmpty,
                  fontColorPhone:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorPhone ??
                              '')
                          .nonEmpty,
                  fontColorOut:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorOut ??
                              '')
                          .nonEmpty,
                  backgroundHead:
                      (commonSettings?.colorsAndroid?.navbar?.backgroundHead ??
                              '')
                          .nonEmpty,
                  headerImgUrl:
                      (commonSettings?.colorsAndroid?.navbar?.headerImgUrl ??
                              '')
                          .nonEmpty,
                  background:
                      (commonSettings?.colorsAndroid?.navbar?.background ?? '')
                          .nonEmpty,
                  fontColor:
                      (commonSettings?.colorsAndroid?.navbar?.fontColor ?? '')
                          .nonEmpty,
                  liColor:
                      (commonSettings?.colorsAndroid?.navbar?.liColor ?? '')
                          .nonEmpty,
                  liColorActive: (commonSettings
                              ?.colorsAndroid?.navbar?.liFontColorActive ??
                          '')
                      .nonEmpty,
                  border: (commonSettings?.colorsAndroid?.navbar?.border ?? '')
                      .nonEmpty,
                  backgroundButton: (commonSettings
                              ?.colorsAndroid?.navbar?.backgroundButton ??
                          '')
                      .nonEmpty,
                  borderButton:
                      (commonSettings?.colorsAndroid?.navbar?.borderButton ??
                              '')
                          .nonEmpty,
                  fontColorButton:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorButton ??
                              '')
                          .nonEmpty,
                  fontColorCopyr:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorCopyr ??
                              '')
                          .nonEmpty,
                  backgroundBonus:
                      (commonSettings?.colorsAndroid?.navbar?.backgroundBonus ??
                              '')
                          .nonEmpty,
                  fontColorBonus:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorBonus ??
                              '')
                          .nonEmpty,
                  fontColorLogout:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorLogout ??
                              '')
                          .nonEmpty,
                  fontColorHead:
                      (commonSettings?.colorsAndroid?.navbar?.fontColorHead ??
                              '')
                          .nonEmpty,
                  iconColor:
                      (commonSettings?.colorsAndroid?.navbar?.iconColor ?? '')
                          .nonEmpty,
                  liFontColorActive: (commonSettings
                              ?.colorsAndroid?.navbar?.liFontColorActive ??
                          '')
                      .nonEmpty,
                ),
                menu: Menu(
                    backgroundDrop: (commonSettings
                                ?.colorsAndroid?.menu?.backgroundDrop ??
                            '')
                        .nonEmpty,
                    fontColorDrop:
                        (commonSettings?.colorsAndroid?.menu?.fontColorDrop ??
                                '')
                            .nonEmpty,
                    backgroundMenu:
                        (commonSettings?.colorsAndroid?.menu?.backgroundMenu ??
                                '')
                            .nonEmpty,
                    fontColorMenu:
                        (commonSettings
                                    ?.colorsAndroid?.menu?.fontColorMenu ??
                                '')
                            .nonEmpty,
                    colorActive:
                        (commonSettings?.colorsAndroid?.menu?.colorActive ?? '')
                            .nonEmpty,
                    colorFilterIcon:
                        (commonSettings?.colorsAndroid?.menu?.colorFilterIcon ??
                                '')
                            .nonEmpty),
                catalog: CatalogStyle(
                    fontColorTitle:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorTitle ?? '')
                            .nonEmpty,
                    fontColorName:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorName ?? '')
                            .nonEmpty,
                    fontColorDesc:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorDesc ?? '')
                            .nonEmpty,
                    fontColorInfo:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorInfo ?? '')
                            .nonEmpty,
                    fontColorCost:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorCost ?? '')
                            .nonEmpty,
                    fontColorMod: (commonSettings?.colorsAndroid?.catalog?.fontColorMod ?? '')
                        .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.catalog?.backgroundButton ?? '')
                            .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.catalog?.borderButton ?? '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.catalog?.fontColorButton ?? '')
                            .nonEmpty,
                    backgroundButtonCheck:
                        (commonSettings?.colorsAndroid?.catalog?.backgroundButtonCheck ?? '')
                            .nonEmpty,
                    borderButtonCheck:
                        (commonSettings?.colorsAndroid?.catalog?.borderButtonCheck ?? '').nonEmpty,
                    fontColorButtonCheck: (commonSettings?.colorsAndroid?.catalog?.fontColorButtonCheck ?? '').nonEmpty,
                    fontColorQuantity: (commonSettings?.colorsAndroid?.catalog?.fontColorQuantity ?? '').nonEmpty,
                    fontColorPriceFrom: (commonSettings?.colorsAndroid?.catalog?.fontColorPriceFrom ?? '').nonEmpty,
                    fontColorPriceCursor: (commonSettings?.colorsAndroid?.catalog?.fontColorPriceCursor ?? '').nonEmpty),
                cart: Cart(
                    fontColorName: (commonSettings?.colorsAndroid?.cart?.fontColorName ?? '')
                        .nonEmpty,
                    fontColorInfo:
                        (commonSettings?.colorsAndroid?.cart?.fontColorInfo ?? '')
                            .nonEmpty,
                    fontColorCost:
                        (commonSettings?.colorsAndroid?.cart?.fontColorCost ?? '')
                            .nonEmpty,
                    backgroundButtonCheck:
                        (commonSettings?.colorsAndroid?.cart?.backgroundButtonCheck ?? '')
                            .nonEmpty,
                    borderButtonCheck:
                        (commonSettings?.colorsAndroid?.cart?.borderButtonCheck ?? '')
                            .nonEmpty,
                    fontColorButtonCheck:
                        (commonSettings?.colorsAndroid?.cart?.fontColorButtonCheck ?? '')
                            .nonEmpty,
                    fontColorQuantity:
                        (commonSettings?.colorsAndroid?.cart?.fontColorQuantity ?? '')
                            .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.cart?.backgroundButton ?? '')
                            .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.cart?.borderButton ?? '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.cart?.fontColorButton ?? '').nonEmpty,
                    colorTime: (commonSettings?.colorsAndroid?.cart?.colorTime ?? '').nonEmpty,
                    emptyText: (commonSettings?.colorsAndroid?.cart?.emptyText ?? '').nonEmpty,
                    emptyBackground: (commonSettings?.colorsAndroid?.cart?.emptyBackground ?? '').nonEmpty,
                    emptyHandle: (commonSettings?.colorsAndroid?.cart?.emptyHandle ?? '').nonEmpty,
                    emptyBasket: (commonSettings?.colorsAndroid?.cart?.emptyBasket ?? '').nonEmpty,
                    inactiveBackgroundButton: (commonSettings?.colorsAndroid?.cart?.inactiveBackgroundButton ?? '').nonEmpty,
                    inactiveBorderButton: (commonSettings?.colorsAndroid?.cart?.inactiveBorderButton ?? '').nonEmpty,
                    inactiveFontColorButton: (commonSettings?.colorsAndroid?.cart?.inactiveFontColorButton ?? '').nonEmpty,
                    imgUrl: (commonSettings?.colorsAndroid?.cart?.imgUrl ?? '').nonEmpty,
                    fontColor: (commonSettings?.colorsAndroid?.cart?.fontColor ?? '').nonEmpty,
                    colorIcon: (commonSettings?.colorsAndroid?.cart?.colorIcon ?? '').nonEmpty),
                save: Save(
                    backgroundButton: (commonSettings
                                ?.colorsAndroid?.save?.backgroundButton ??
                            '')
                        .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.save?.borderButton ??
                                '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.save?.fontColorButton ??
                                '')
                            .nonEmpty),
                delivery: DeliveryOptions(
                    text: (commonSettings?.colorsAndroid?.delivery?.text ?? '')
                        .nonEmpty,
                    options: commonSettings?.colorsAndroid?.delivery?.options
                            ?.map((e) => Options(
                                text: (e.text ?? '').nonEmpty,
                                isPickup: e.isPickup ?? false,
                                pickupTakeaway: e.pickupTakeaway ?? false,
                                now: (e.now ?? '').nonEmpty,
                                time: (e.time ?? '').nonEmpty))
                            .toList() ??
                        []),
                bill: Bill(
                    backgroundButton: (commonSettings
                                ?.colorsAndroid?.bill?.backgroundButton ??
                            '')
                        .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.bill?.borderButton ??
                                '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.bill?.fontColorButton ??
                                '')
                            .nonEmpty,
                    colorCursor:
                        (commonSettings?.colorsAndroid?.bill?.colorCursor ?? '')
                            .nonEmpty),
                adressBlank: AddressBlank(
                    fontColor:
                        (commonSettings?.colorsAndroid?.adressBlank?.fontColor ?? '')
                            .nonEmpty,
                    fontColorAdd:
                        (commonSettings?.colorsAndroid?.adressBlank?.fontColorAdd ?? '')
                            .nonEmpty,
                    pointer:
                        (commonSettings?.colorsAndroid?.adressBlank?.pointer ?? '')
                            .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.adressBlank?.backgroundButton ?? '')
                            .nonEmpty,
                    buttonImg:
                        (commonSettings?.colorsAndroid?.adressBlank?.buttonImg ?? '')
                            .nonEmpty,
                    fontColorComment: (commonSettings?.colorsAndroid
                                ?.adressBlank?.fontColorComment ??
                            '')
                        .nonEmpty,
                    fontColorError: (commonSettings
                                ?.colorsAndroid?.adressBlank?.fontColorError ??
                            '')
                        .nonEmpty,
                    colorIconDel:
                        (commonSettings?.colorsAndroid?.adressBlank?.colorIconDel ??
                                '')
                            .nonEmpty),
                allert: Alert(
                    fontColor:
                        (commonSettings?.colorsAndroid?.allert?.fontColor ?? '')
                            .nonEmpty,
                    fontColorLink:
                        (commonSettings?.colorsAndroid?.allert?.fontColorLink ??
                                '')
                            .nonEmpty,
                    background:
                        (commonSettings?.colorsAndroid?.allert?.background ??
                                '')
                            .nonEmpty),
                thankPage: ThankPage(
                    fontColor:
                        (commonSettings?.colorsAndroid?.thankPage?.fontColor ?? '')
                            .nonEmpty,
                    background:
                        (commonSettings?.colorsAndroid?.thankPage?.background ?? '')
                            .nonEmpty,
                    thankUrl:
                        (commonSettings?.colorsAndroid?.thankPage?.thankUrl ?? '')
                            .nonEmpty,
                    fontColorTitle:
                        (commonSettings?.colorsAndroid?.thankPage?.fontColorTitle ?? '')
                            .nonEmpty,
                    fontColorZakaz:
                        (commonSettings?.colorsAndroid?.thankPage?.fontColorZakaz ?? '')
                            .nonEmpty,
                    fontColorText:
                        (commonSettings?.colorsAndroid?.thankPage?.fontColorText ?? '')
                            .nonEmpty,
                    colorImg:
                        (commonSettings?.colorsAndroid?.thankPage?.colorImg ?? '')
                            .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.thankPage?.backgroundButton ?? '')
                            .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.thankPage?.borderButton ?? '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.thankPage?.fontColorButton ?? '')
                            .nonEmpty),
                feedback: Feedback(
                    fontColorclose:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorclose ?? '')
                            .nonEmpty,
                    fontColorTitle:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorTitle ?? '')
                            .nonEmpty,
                    fontColorH2:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorH2 ?? '')
                            .nonEmpty,
                    fontColorIcon:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorIcon ?? '')
                            .nonEmpty,
                    fontColorComment:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorComment ?? '')
                            .nonEmpty,
                    backgroundButton:
                        (commonSettings?.colorsAndroid?.feedback?.backgroundButton ?? '')
                            .nonEmpty,
                    borderButton:
                        (commonSettings?.colorsAndroid?.feedback?.borderButton ?? '')
                            .nonEmpty,
                    fontColorButton:
                        (commonSettings?.colorsAndroid?.feedback?.fontColorButton ?? '')
                            .nonEmpty,
                    fontColorCommentPlaceholder: (commonSettings?.colorsAndroid
                                ?.feedback?.fontColorCommentPlaceholder ??
                            '')
                        .nonEmpty),
                pickupRestaurant: PickupRestaurant(
                    dialogNavbarBackground: (commonSettings?.colorsAndroid
                                ?.pickupRestaurant?.dialogNavbarBackground ??
                            '')
                        .nonEmpty,
                    dialogNavbarFontColor: (commonSettings?.colorsAndroid
                                ?.pickupRestaurant?.dialogNavbarFontColor ??
                            '')
                        .nonEmpty,
                    dialogBackground:
                        (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogBackground ?? '')
                            .nonEmpty,
                    dialogFontColor:
                        (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogFontColor ?? '')
                            .nonEmpty,
                    dialogFontColorInactive: (commonSettings?.colorsAndroid
                                ?.pickupRestaurant?.dialogFontColorInactive ??
                            '')
                        .nonEmpty,
                    dialogIconColor:
                        (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogIconColor ?? '').nonEmpty,
                    dialogHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.dialogHrColor ?? '').nonEmpty,
                    iconEditColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.iconEditColor ?? '').nonEmpty,
                    iconLocationColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.iconLocationColor ?? '').nonEmpty,
                    adressBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressBackground ?? '').nonEmpty,
                    adressFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressFontColor ?? '').nonEmpty,
                    adressHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.adressHrColor ?? '').nonEmpty,
                    pickupBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupBackground ?? '').nonEmpty,
                    pickupFontColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupFontColorAdress ?? '').nonEmpty,
                    pickupIconColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorAdress ?? '').nonEmpty,
                    pickupIconLocationColorAdress: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconLocationColorAdress ?? '').nonEmpty,
                    pickupIconColorCheck: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorCheck ?? '').nonEmpty,
                    pickupIconColorAccepted: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorAccepted ?? '').nonEmpty,
                    pickupIconColorProduction: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorProduction ?? '').nonEmpty,
                    pickupIconColorCooked: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorCooked ?? '').nonEmpty,
                    pickupStatusFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupStatusFontColor ?? '').nonEmpty,
                    pickupOrderFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupOrderFontColor ?? '').nonEmpty,
                    pickupKodFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupKodFontColor ?? '').nonEmpty,
                    pickupContentFontColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupContentFontColor ?? '').nonEmpty,
                    pickupHrColor: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupHrColor ?? '').nonEmpty,
                    listBackground: (commonSettings?.colorsAndroid?.pickupRestaurant?.listBackground ?? '').nonEmpty,
                    listOrder: (commonSettings?.colorsAndroid?.pickupRestaurant?.listOrder ?? '').nonEmpty,
                    listStatus: (commonSettings?.colorsAndroid?.pickupRestaurant?.listStatus ?? '').nonEmpty,
                    listTime: (commonSettings?.colorsAndroid?.pickupRestaurant?.listTime ?? '').nonEmpty,
                    listIcon: (commonSettings?.colorsAndroid?.pickupRestaurant?.listIcon ?? '').nonEmpty,
                    listHr: (commonSettings?.colorsAndroid?.pickupRestaurant?.listHr ?? '').nonEmpty,
                    pickupIconColorDone: (commonSettings?.colorsAndroid?.pickupRestaurant?.pickupIconColorDone ?? '').nonEmpty),
                cashback: CashbackOption(
                    enabled: commonSettings?.colorsAndroid?.cashback?.enabled ??
                        false,
                    fixed: commonSettings?.colorsAndroid?.cashback?.fixed ?? 0,
                    limit: commonSettings?.colorsAndroid?.cashback?.limit ?? 0,
                    levels: commonSettings?.colorsAndroid?.cashback?.levels
                            ?.map((e) => Levels(
                                id: e.id ?? 0,
                                name: (e.name ?? '').nonEmpty,
                                moneyLimitFrom: e.moneyLimitFrom ?? 0,
                                percent: e.percent ?? 0,
                                isFixed: e.isFixed ?? 0,
                                isBase: e.isBase ?? 0))
                            .toList() ??
                        []),
              ),
              streets: Streets(value: (commonSettings?.streets?.value ?? '').nonEmpty, token: (commonSettings?.streets?.token ?? '').nonEmpty, dadataOptions: []),
              phoneCallInsteadSmsCodeConfirmation: commonSettings?.phoneCallInsteadSmsCodeConfirmation ?? false,
              locale: Locale(countryIso: (commonSettings?.locale?.countryIso ?? '').nonEmpty, countryCurrency: (commonSettings?.locale?.countryCurrency ?? '').nonEmpty, countryCode: (commonSettings?.locale?.countryCode ?? '').nonEmpty, phoneLength: (commonSettings?.locale?.phoneLength ?? 0), phoneMask: (commonSettings?.locale?.phoneMask ?? '').nonEmpty, country: (commonSettings?.locale?.country ?? '').nonEmpty, systemLocale: (commonSettings?.locale?.systemLocale ?? '').nonEmpty, currency: (commonSettings?.locale?.currency ?? '').nonEmpty)),
          cities: cities?.map((e) => City(id: e.id ?? 0, name: (e.name ?? '').nonEmpty, isPickup: e.isPickup ?? false, isDelivery: e.isDelivery ?? false, bounds: Bounds(sw: Coordinate(lat: e.bounds?.sw?.lat ?? 0, lng: e.bounds?.sw?.lat ?? 0), ne: Coordinate(lat: e.bounds?.ne?.lat ?? 0, lng: e.bounds?.ne?.lng ?? 0)), coordinates: Coordinate(lat: e.coordinates?.lat ?? 0, lng: e.coordinates?.lng ?? 0), spots: e.spots ?? [])).toList() ?? [],
          version: (version ?? '').nonEmpty,
          os: (os ?? '').nonEmpty);
      return Right(domain);
    } on Error catch (e) {
      return left(ExtendedErrors.simple(e.stackTrace.toString()));
    } on CheckedFromJsonException catch (e) {
      return left(ExtendedErrors.simple(e.innerStack.toString()));
    } on Exception catch (e) {
      return left(ExtendedErrors.simple(e.toString()));
    }
  }
}
