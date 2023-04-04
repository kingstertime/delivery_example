import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/actions/actions_screen.dart';
import 'package:superdostavka/ui/screens/cart/cart_screen.dart';
import 'package:superdostavka/ui/screens/create_order/address/add_address/add_address_screen.dart';
import 'package:superdostavka/ui/screens/create_order/address/address_screen.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_screen.dart';
import 'package:superdostavka/ui/screens/create_order/payment/payment_screen.dart';
import 'package:superdostavka/ui/screens/create_order/time/choose_time_screen.dart';
import 'package:superdostavka/ui/screens/favorites/favorites_screen.dart';
import 'package:superdostavka/ui/screens/gift/gift_screen.dart';
import 'package:superdostavka/ui/screens/login/login_screen.dart';
import 'package:superdostavka/ui/screens/splash/splash_screen.dart';

import 'ui/screens/cart/bonuses/bonus_screen.dart';
import 'ui/screens/city/city_screen.dart';
import 'ui/screens/create_order/payment/payment_change/payment_change_screen.dart';
import 'ui/screens/login/code_screen.dart';
import 'ui/screens/menu/menu_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String menu = '/menu';
  static const String login = '/login';
  static const String actions = '/action';
  static const String favorites = '/favorites';
  static const String cart = '/cart';
  static const String gifts = '/gifts';
  static const String city = '/city';
  static const String createOrder = '/create_order';
  static const String addresses = '/addresses';
  static const String addAddress = '/add_address';
  static const String time = '/time';
  static const String payment = '/payment';
  static const String change = '/change';
  static const String code = '/code';
  static const String bonuse = '/bonuse';

  static List<String> routeList = [
    splash,
    menu,
    login,
    actions,
    favorites,
    cart,
    gifts,
    city,
    bonuse,
  ];

  final List<GetPage> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.menu,
      page: () => MenuScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.actions,
        page: () => ActionsScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.favorites,
        page: () => FavoritesScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.cart,
        page: () => CartScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.gifts,
        page: () => GiftScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.city,
        page: () => CityScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.createOrder,
        page: () => CreateOrderScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.addresses,
        page: () => AddressScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.addAddress,
        page: () => AddAddressScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.time,
        page: () => ChooseTimeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.payment,
        page: () => PaymentScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.change,
        page: () => PaymentChangeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.code,
        page: () => CodeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: AppRoutes.bonuse,
        page: () => BonusScreen(),
        transition: Transition.fade)
  ];
}
