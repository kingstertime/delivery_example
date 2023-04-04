import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/core/json_converters.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'config.freezed.dart';
part 'config.g.dart';

@freezed
class Config with _$Config {
  const factory Config({
    required DeliverySettings deliverySettings,
    required PickupSettings pickupSettings,
    required CommonSettings commonSettings,
    required List<City> cities,
    required NonEmptyString version,
    required NonEmptyString os,
  }) = _Config;
}

@freezed
class DeliverySettings with _$DeliverySettings {
  const factory DeliverySettings({
    required NonEmptyString logoUrl,
    required NonEmptyString orderCheckUpdate,
    required OnlinePayment onlinePayment,
    required List<PaymentTypes> paymentTypes,
    required DeliveryConditions deliveryConditions,
    required DeliveryOptions delivery,
    required DeliveryOptions deliveryTime,
    required NumberOfPersons numberOfPersons,
    required SocialNetworks socialNetworks,
    required Promo promo,
    required OnlinePayment bonuses,
    required ChefGift chefGift,
    required CashbackOption cashback,
    required Courier courier,
    required OrderConfirmType orderConfirmType,
    required Pickup pickup,
    required OnlinePayment promocodes,
    required DeliveryConditions alertInCart,
    required Map<int, String>? catalogs,
    required List<Structure> structure,
    required List<Schedule> schedule,
    required Additions additions,
  }) = _DeliverySettings;
}

@freezed
class OnlinePayment with _$OnlinePayment {
  const factory OnlinePayment({
    required bool enabled,
  }) = _OnlinePayment;
}

@freezed
class PaymentTypes with _$PaymentTypes {
  const factory PaymentTypes({
    required int payType,
    required NonEmptyString name,
  }) = _PaymentTypes;
}

@freezed
class DeliveryConditions with _$DeliveryConditions {
  const factory DeliveryConditions({
    required bool enabled,
    required NonEmptyString text,
  }) = _DeliveryConditions;
}

@freezed
class DeliveryOptions with _$DeliveryOptions {
  const factory DeliveryOptions({
    required NonEmptyString text,
    required List<Options> options,
  }) = _DeliveryOptions;
}

@freezed
class Options with _$Options {
  const factory Options({
    required NonEmptyString text,
    required bool isPickup,
    required bool pickupTakeaway,
    required NonEmptyString now,
    required NonEmptyString time,
  }) = _Options;
}

@freezed
class NumberOfPersons with _$NumberOfPersons {
  const factory NumberOfPersons({
    required bool enabled,
    required int defaultValue,
  }) = _NumberOfPersons;
}

@freezed
class SocialNetworks with _$SocialNetworks {
  const factory SocialNetworks({
    required bool enabled,
    required NonEmptyString text,
    required List<SocialList> list,
  }) = _SocialNetworks;
}

@freezed
class SocialList with _$SocialList {
  const factory SocialList({
    required NonEmptyString name,
    required NonEmptyString url,
    required NonEmptyString img,
    required NonEmptyString imgColor,
  }) = _SocialList;
}

@freezed
class Promo with _$Promo {
  const factory Promo({
    required bool enabled,
    required NonEmptyString action,
    required NonEmptyString text,
    required NonEmptyString icon,
    required PromoColors colors,
  }) = _Promo;
}

@freezed
class PromoColors with _$PromoColors {
  const factory PromoColors({
    required NonEmptyString background,
    required NonEmptyString font,
    required NonEmptyString icon,
    required NonEmptyString rightArrow,
  }) = _PromoColors;
}

@freezed
class ChefGift with _$ChefGift {
  const factory ChefGift({
    required bool enabled,
    required List<NonEmptyString> levels,
  }) = _ChefGift;
}

@freezed
class CashbackOption with _$CashbackOption {
  const factory CashbackOption({
    required bool enabled,
    required int fixed,
    required int limit,
    required List<Levels>? levels,
  }) = _CashbackOption;
}

@freezed
class Levels with _$Levels {
  const factory Levels({
    required int id,
    required NonEmptyString name,
    required int moneyLimitFrom,
    required int percent,
    required int isFixed,
    required int isBase,
  }) = _Levels;
}

@freezed
class Courier with _$Courier {
  const factory Courier({
    required bool enabled,
    required int coordinatesUpdate,
    required int validTimePassed,
  }) = _Courier;
}

@freezed
class OrderConfirmType with _$OrderConfirmType {
  const factory OrderConfirmType({
    required bool enabled,
    required bool defaultValue,
  }) = _OrderConfirmType;
}

@freezed
class Pickup with _$Pickup {
  const factory Pickup({
    required int percent,
    required NonEmptyString text,
  }) = _Pickup;
}

@freezed
class Structure with _$Structure {
  const factory Structure({
    required NonEmptyString name,
    required NonEmptyString slug,
    required NonEmptyString img,
    required NonEmptyString sort,
    required Settings settings,
  }) = _Structure;

  static Structure empty = Structure(
      name: ''.nonEmpty,
      slug: ''.nonEmpty,
      img: ''.nonEmpty,
      sort: ''.nonEmpty,
      settings: const Settings(deliveryTabs: [], pickupTabs: []));
}

@freezed
class Settings with _$Settings {
  const factory Settings({
    required List<DeliveryTabs> deliveryTabs,
    required List<DeliveryTabs>? pickupTabs,
  }) = _Settings;
}

@freezed
class DeliveryTabs with _$DeliveryTabs {
  const factory DeliveryTabs({
    required NonEmptyString name,
    required NonEmptyString slug,
  }) = _DeliveryTabs;
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required NonEmptyString notWorkingText,
    required bool technicalNotWorking,
    required NonEmptyString technicalNotWorkingText,
    required List<Range> range,
    required int cityId,
  }) = _Schedule;
}

@freezed
class Range with _$Range {
  const factory Range({
    required NonEmptyString day,
    required List<NonEmptyString> from,
    required List<NonEmptyString> to,
  }) = _Range;
}

@freezed
class Additions with _$Additions {
  const factory Additions(
      {required bool enabled, required NonEmptyString title}) = _Additions;
}

@freezed
class PickupSettings with _$PickupSettings {
  const factory PickupSettings({
    required NonEmptyString logoUrl,
    required NonEmptyString orderCheckUpdate,
    required OnlinePayment onlinePayment,
    required OnlinePayment orderPickupReadyButton,
    required List<PaymentTypes> paymentTypes,
    required DeliveryOptions delivery,
    required DeliveryOptions deliveryTime,
    required SocialNetworks socialNetworks,
    required Promo promo,
    required OnlinePayment bonuses,
    required ChefGift chefGift,
    required CashbackOption cashback,
    required Courier courier,
    required OrderConfirmType orderConfirmType,
    required Pickup pickup,
    required OnlinePayment promocodes,
    required Map<int, String> catalogs,
    required List<Structure> structure,
    required List<Schedule> schedule,
    required Additions additions,
  }) = _PickupSettings;
}

@freezed
class CommonSettings with _$CommonSettings {
  const factory CommonSettings({
    required List<NonEmptyString> locales,
    required NonEmptyString menuType,
    required bool pickupModuleEnabled,
    required NonEmptyString iosAppId,
    required NonEmptyString androidAppId,
    required ForceUpdateApp forceUpdateApp,
    required Pages pages,
    required int maxModificationsNumber,
    required ColorsAndroid colors,
    required ColorsAndroid colorsAndroid,
    required Streets streets,
    required bool phoneCallInsteadSmsCodeConfirmation,
    required Locale locale,
  }) = _CommonSettings;
}

@freezed
class ForceUpdateApp with _$ForceUpdateApp {
  const factory ForceUpdateApp({
    required NonEmptyString type,
    required int ios,
    required int android,
  }) = _ForceUpdateApp;
}

@freezed
class Pages with _$Pages {
  const factory Pages({
    required CitySelect citySelect,
    required ModeSelect modeSelect,
    required CitySelect pickupSelect,
  }) = _Pages;
}

@freezed
class CitySelect with _$CitySelect {
  const factory CitySelect({
    required NonEmptyString title,
  }) = _CitySelect;
}

@freezed
class ModeSelect with _$ModeSelect {
  const factory ModeSelect({
    required NonEmptyString title,
    required DeliveryTypes deliveryTypes,
  }) = _ModeSelect;
}

@freezed
class DeliveryTypes with _$DeliveryTypes {
  const factory DeliveryTypes({
    required NonEmptyString pickup,
    required NonEmptyString delivery,
  }) = _DeliveryTypes;
}

@freezed
class Colors with _$Colors {
  const factory Colors({
    required Main main,
    required Start start,
    required Login login,
    required Navbar navbar,
    required CatalogStyle catalog,
    required Favorites favorites,
    required Cart cart,
    required Gift gift,
    required Order order,
    required Address adress,
    required DeliveryOptions delivery,
    required ThankPage thankPage,
    required Feedback feedback,
    required PromoCode promokod,
    required PickupRestaurant pickupRestaurant,
    required CashbackOption cashback,
    required Filter filter,
    required Maps maps,
  }) = _Colors;
}

@freezed
class Main with _$Main {
  const factory Main({
    required NonEmptyString startnavbar,
    required NonEmptyString fontColorHead,
    required NonEmptyString background,
    required NonEmptyString border,
    required NonEmptyString fontColor,
    required NonEmptyString progressBar,
    required NonEmptyString colorCheck,
    required NonEmptyString backgroundHorizontalMenu,
    required NonEmptyString fontColorHorizontalMenu,
    required NonEmptyString colorActive,
    required NonEmptyString colorFilterIcon,
  }) = _Main;
}

@freezed
class Login with _$Login {
  const factory Login({
    required NonEmptyString background,
    required NonEmptyString iconColor,
    required NonEmptyString startnavbar,
    required NonEmptyString fontColor,
    required NonEmptyString fontColorComment,
    required NonEmptyString borderPlaceholders,
    required NonEmptyString backgroundButtonActive,
    required NonEmptyString fontColorButtonActive,
    required NonEmptyString backgroundButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString fontColorKod,
    required NonEmptyString colorBorder,
    required NonEmptyString fontColorErrore,
    required NonEmptyString fontColorHead,
  }) = _Login;
}

@freezed
class CatalogStyle with _$CatalogStyle {
  const factory CatalogStyle({
    required NonEmptyString fontColorTitle,
    required NonEmptyString fontColorName,
    required NonEmptyString fontColorDesc,
    required NonEmptyString fontColorInfo,
    required NonEmptyString fontColorCost,
    required NonEmptyString fontColorMod,
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString backgroundButtonCheck,
    required NonEmptyString borderButtonCheck,
    required NonEmptyString fontColorButtonCheck,
    required NonEmptyString fontColorQuantity,
    required NonEmptyString fontColorPriceFrom,
    required NonEmptyString fontColorPriceCursor,
  }) = _CatalogStyle;
}

@freezed
class Favorites with _$Favorites {
  const factory Favorites({
    required NonEmptyString colorActive,
    required NonEmptyString color,
  }) = _Favorites;
}

@freezed
class Cart with _$Cart {
  const factory Cart({
    required NonEmptyString fontColorName,
    required NonEmptyString fontColorInfo,
    required NonEmptyString fontColorCost,
    required NonEmptyString backgroundButtonCheck,
    required NonEmptyString borderButtonCheck,
    required NonEmptyString fontColorButtonCheck,
    required NonEmptyString fontColorQuantity,
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString colorTime,
    required NonEmptyString emptyText,
    required NonEmptyString emptyBackground,
    required NonEmptyString emptyHandle,
    required NonEmptyString emptyBasket,
    required NonEmptyString inactiveBackgroundButton,
    required NonEmptyString inactiveBorderButton,
    required NonEmptyString inactiveFontColorButton,
    required NonEmptyString imgUrl,
    required NonEmptyString fontColor,
    required NonEmptyString colorIcon,
  }) = _Cart;
}

@freezed
class Gift with _$Gift {
  const factory Gift({
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString backgroundButtonInactive,
    required NonEmptyString borderButtonInactive,
    required NonEmptyString fontColorButtonInactive,
    required NonEmptyString fontColorLink,
  }) = _Gift;
}

@freezed
class Order with _$Order {
  const factory Order({
    required NonEmptyString fontColorTitle,
    required NonEmptyString fontColorActive,
    required NonEmptyString fontColorPlaceholders,
    required NonEmptyString fontColorCost,
    required NonEmptyString backgroundButtonCheck,
    required NonEmptyString borderButtonCheck,
    required NonEmptyString fontColorButtonCheck,
    required NonEmptyString fontColorQuantity,
    required NonEmptyString border,
    required NonEmptyString colorIcon,
    required NonEmptyString colorCursor,
  }) = _Order;
}

@freezed
class Address with _$Address {
  const factory Address({
    required NonEmptyString backgroundHead,
    required NonEmptyString fontColorHead,
    required NonEmptyString primaryColor,
    required NonEmptyString secondaryColor,
    required NonEmptyString fontColorTitle,
    required NonEmptyString fontColorActive,
    required NonEmptyString fontColorPlaceholders,
    required NonEmptyString border,
    required NonEmptyString backgroundButton,
    required NonEmptyString buttonImg,
    required NonEmptyString colorTab,
    required NonEmptyString fontColorComment,
    required NonEmptyString fontColorError,
    required NonEmptyString colorIconDel,
  }) = _Address;
}

@freezed
class Delivery with _$Delivery {
  const factory Delivery({
    required NonEmptyString background,
    required NonEmptyString fontColorComment,
    required NonEmptyString fontColor,
    required NonEmptyString border,
    required NonEmptyString backgroundDelivery,
    required NonEmptyString fontColorDelivery,
    required NonEmptyString fontColorCall,
    required NonEmptyString fontColorCorriere,
    required NonEmptyString backgroundButton,
    required NonEmptyString buttonImg,
    required NonEmptyString fontColorActiveOrders,
    required NonEmptyString carUrl,
  }) = _Delivery;
}

@freezed
class ThankPage with _$ThankPage {
  const factory ThankPage({
    required NonEmptyString fontColor,
    required NonEmptyString background,
    required NonEmptyString thankUrl,
    required NonEmptyString fontColorTitle,
    required NonEmptyString fontColorZakaz,
    required NonEmptyString fontColorText,
    required NonEmptyString colorImg,
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
  }) = _ThankPage;
}

@freezed
class Feedback with _$Feedback {
  const factory Feedback({
    required NonEmptyString fontColorclose,
    required NonEmptyString fontColorTitle,
    required NonEmptyString fontColorH2,
    required NonEmptyString fontColorIcon,
    required NonEmptyString fontColorComment,
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString fontColorCommentPlaceholder,
  }) = _Feedback;
}

@freezed
class PromoCode with _$PromoCode {
  const factory PromoCode({
    required NonEmptyString tab,
    required NonEmptyString background,
    required NonEmptyString topBackground,
    required NonEmptyString topLogin,
    required NonEmptyString topLoginBackgroundButton,
    required NonEmptyString topLoginFontCollorButton,
    required NonEmptyString topPromoTitle,
    required NonEmptyString topPromokod,
    required NonEmptyString topPromokodBackgroundButton,
    required NonEmptyString topPromokodFontCollorButton,
    required NonEmptyString topPromokodLine,
    required NonEmptyString topPromokodError,
    required NonEmptyString promokodBackground,
    required NonEmptyString promokodTitle,
    required NonEmptyString promokodIconKod,
    required NonEmptyString promokodTextKod,
    required NonEmptyString promokodIconDate,
    required NonEmptyString promokodTextDate,
    required NonEmptyString promokodText,
    required NonEmptyString promokodMore,
    required NonEmptyString socialTitle,
    required NonEmptyString socialText,
    required NonEmptyString actionBackground,
    required NonEmptyString actionTitle,
    required NonEmptyString actionText,
    required NonEmptyString actionMore,
  }) = _PromoCode;
}

@freezed
class PickupRestaurant with _$PickupRestaurant {
  const factory PickupRestaurant({
    required NonEmptyString dialogNavbarBackground,
    required NonEmptyString dialogNavbarFontColor,
    required NonEmptyString dialogBackground,
    required NonEmptyString dialogFontColor,
    required NonEmptyString dialogFontColorInactive,
    required NonEmptyString dialogIconColor,
    required NonEmptyString dialogHrColor,
    required NonEmptyString iconEditColor,
    required NonEmptyString iconLocationColor,
    required NonEmptyString adressBackground,
    required NonEmptyString adressFontColor,
    required NonEmptyString adressHrColor,
    required NonEmptyString pickupBackground,
    required NonEmptyString pickupFontColorAdress,
    required NonEmptyString pickupIconColorAdress,
    required NonEmptyString pickupIconLocationColorAdress,
    required NonEmptyString pickupIconColorCheck,
    required NonEmptyString pickupIconColorAccepted,
    required NonEmptyString pickupIconColorProduction,
    required NonEmptyString pickupIconColorCooked,
    required NonEmptyString pickupStatusFontColor,
    required NonEmptyString pickupOrderFontColor,
    required NonEmptyString pickupKodFontColor,
    required NonEmptyString pickupContentFontColor,
    required NonEmptyString pickupHrColor,
    required NonEmptyString listBackground,
    required NonEmptyString listOrder,
    required NonEmptyString listStatus,
    required NonEmptyString listTime,
    required NonEmptyString listIcon,
    required NonEmptyString listHr,
    required NonEmptyString pickupIconColorDone,
  }) = _PickupRestaurant;
}

@freezed
class Cashback with _$Cashback {
  const factory Cashback({
    required NonEmptyString backgroundNav,
    required NonEmptyString iconColorBonus,
    required NonEmptyString fontColorBonus,
    required NonEmptyString iconColorInfo,
    required NonEmptyString backgroundNavbar,
    required NonEmptyString fontColorNavbar,
    required NonEmptyString background,
    required NonEmptyString fontColor,
    required NonEmptyString fontColorStatus,
    required NonEmptyString fontColorSum,
    required NonEmptyString hrColor,
    required NonEmptyString fontColorTranzak,
    required NonEmptyString iconUrl,
  }) = _Cashback;
}

@freezed
class Filter with _$Filter {
  const factory Filter({
    required NonEmptyString backgroundNav,
    required NonEmptyString fontColorNav,
    required NonEmptyString background,
    required NonEmptyString fontColor,
    required NonEmptyString circle,
    required NonEmptyString circleCheck,
  }) = _Filter;
}

@freezed
class Maps with _$Maps {
  const factory Maps({required NonEmptyString back}) = _Maps;
}

@freezed
class ColorsAndroid with _$ColorsAndroid {
  const factory ColorsAndroid({
    required Start start,
    required Login login,
    required Navbar navbar,
    required Menu menu,
    required CatalogStyle catalog,
    required Cart cart,
    required Save save,
    required DeliveryOptions delivery,
    required Bill bill,
    required AddressBlank adressBlank,
    required Alert allert,
    required ThankPage thankPage,
    required Feedback feedback,
    required PickupRestaurant pickupRestaurant,
    required CashbackOption cashback,
  }) = _ColorsAndroid;
}

@freezed
class Start with _$Start {
  const factory Start({
    required NonEmptyString startnavbar,
    required NonEmptyString background,
    required NonEmptyString fontColorNavbar,
    required NonEmptyString fontColor,
    required NonEmptyString colorChekNavbar,
    required NonEmptyString colorChek,
  }) = _Start;
}

@freezed
class Navbar with _$Navbar {
  const factory Navbar({
    required NonEmptyString fontColorName,
    required NonEmptyString fontColorPhone,
    required NonEmptyString fontColorOut,
    required NonEmptyString backgroundHead,
    required NonEmptyString headerImgUrl,
    required NonEmptyString background,
    required NonEmptyString fontColor,
    required NonEmptyString liColor,
    required NonEmptyString liColorActive,
    required NonEmptyString border,
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString fontColorCopyr,
    required NonEmptyString backgroundBonus,
    required NonEmptyString fontColorBonus,
    required NonEmptyString fontColorLogout,
    required NonEmptyString fontColorHead,
    required NonEmptyString iconColor,
    required NonEmptyString liFontColorActive,
  }) = _Navbar;
}

@freezed
class Menu with _$Menu {
  const factory Menu({
    required NonEmptyString backgroundDrop,
    required NonEmptyString fontColorDrop,
    required NonEmptyString backgroundMenu,
    required NonEmptyString fontColorMenu,
    required NonEmptyString colorActive,
    required NonEmptyString colorFilterIcon,
  }) = _Menu;
}

@freezed
class Save with _$Save {
  const factory Save({
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
  }) = _Save;
}

@freezed
class Bill with _$Bill {
  const factory Bill({
    required NonEmptyString backgroundButton,
    required NonEmptyString borderButton,
    required NonEmptyString fontColorButton,
    required NonEmptyString colorCursor,
  }) = _Bill;
}

@freezed
class AddressBlank with _$AddressBlank {
  const factory AddressBlank({
    required NonEmptyString fontColor,
    required NonEmptyString fontColorAdd,
    required NonEmptyString pointer,
    required NonEmptyString backgroundButton,
    required NonEmptyString buttonImg,
    required NonEmptyString fontColorComment,
    required NonEmptyString fontColorError,
    required NonEmptyString colorIconDel,
  }) = _AddressBlank;
}

@freezed
class Alert with _$Alert {
  const factory Alert({
    required NonEmptyString fontColor,
    required NonEmptyString fontColorLink,
    required NonEmptyString background,
  }) = _Alert;
}

@freezed
class Streets with _$Streets {
  const factory Streets({
    required NonEmptyString value,
    required NonEmptyString token,
    required List<dynamic> dadataOptions,
  }) = _Streets;
}

@freezed
class Locale with _$Locale {
  const factory Locale({
    required NonEmptyString countryIso,
    required NonEmptyString countryCurrency,
    required NonEmptyString countryCode,
    required int phoneLength,
    required NonEmptyString phoneMask,
    required NonEmptyString country,
    required NonEmptyString systemLocale,
    required NonEmptyString currency,
  }) = _Locale;
}

@Freezed(toJson: true, fromJson: true)
class City with _$City {
  const factory City({
    required int id,
    @NonEmptyStringConverter() required NonEmptyString name,
    required bool isPickup,
    required bool isDelivery,
    required Bounds bounds,
    required Coordinate coordinates,
    required List<dynamic> spots,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  static City empty = City(
      id: 0,
      name: ''.nonEmpty,
      isPickup: false,
      isDelivery: false,
      bounds: Bounds.empty,
      coordinates: Coordinate.empty,
      spots: []);
}

@Freezed(toJson: true, fromJson: true)
class Bounds with _$Bounds {
  const factory Bounds({
    required Coordinate sw,
    required Coordinate ne,
  }) = _Bounds;

  static Bounds empty = Bounds(sw: Coordinate.empty, ne: Coordinate.empty);

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}

@Freezed(toJson: true, fromJson: true)
class Coordinate with _$Coordinate {
  const factory Coordinate({
    required double lat,
    required double lng,
  }) = _Coordinate;

  static Coordinate empty = const Coordinate(lat: 0, lng: 0);

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);
}
