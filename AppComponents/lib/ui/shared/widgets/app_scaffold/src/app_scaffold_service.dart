import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class AppScaffoldService extends GetxService with StreamSubscriberMixin {
  AppScaffoldService({CartService? cartService, AuthService? authService})
      : cartService = cartService ?? Get.find(),
        authService = authService ?? Get.find();

  final AuthService authService;

  final _currentNavIndex = 0.obs; // для BottomNavigationBar index

  int get currentNavIndex$ => _currentNavIndex();

  void currentNavIndex(int index) => _currentNavIndex(index);

  final CartService cartService;

  GetRxDecoratorInt get cartSum => cartService.sum;

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  GetRxDecorator<List<BottomNavModel>> get listBottomNav => [
        BottomNavModel(
          text: 'Menu',
          activeColor: Colors.white,
          icon: AppIcons.menu,
        ),
        BottomNavModel(
          text: 'Cart: ${cartSum.value} ₹',
          activeColor: Colors.white,
          icon: AppIcons.cart,
        ),
        BottomNavModel(
          text: 'Orders',
          activeColor: Colors.white,
          icon: AppIcons.orders,
        ),
      ].obsDeco();

  void goToPage(int index) {
    Get.toNamed(listBottomNav.value[index].router ?? '');
    currentNavIndex(index);
  }

  int? _lastTimeBackButtonWasTapped;
  Future<bool> doubleExit() async {
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    if (_lastTimeBackButtonWasTapped != null &&
        (currentTime - (_lastTimeBackButtonWasTapped ?? 0)) < 2000) {
      return Future.value(true);
    } else {
      _lastTimeBackButtonWasTapped = DateTime.now().millisecondsSinceEpoch;
      return Future.value(false);
    }
  }

  Future<bool> tryExit() async {
    return Future.value(false);
  }
}

class BottomNavModel {
  Color activeColor;
  String icon;
  String text;
  String? router;

  BottomNavModel({
    required this.activeColor,
    required this.icon,
    required this.text,
    this.router,
  });
}
