import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class BonusScreenController extends StatexController {
  BonusScreenController({ConfigService? configService,
  UserInfoService? userInfoService,
  CartService? cartService})
  : configService = configService ?? Get.find(),
    userInfoService = userInfoService ?? Get.find(),
    cartService = cartService ?? Get.find();

  final ConfigService configService;

  final UserInfoService userInfoService;

  final CartService cartService;

  GetRxDecoratorBool get bonusesIsActive => configService.lateConfig.value.deliverySettings.bonuses.enabled.obsDeco();

  GetRxDecoratorDouble get countOfBonuses => userInfoService.userInfo.value.bonuses.obsDeco();

  final TextEditingController controller = TextEditingController();

  void onChanged(String value) {
    if (int.parse(value) > countOfBonuses.value) {
      controller.text = countOfBonuses.value.toInt().toString();
    }
  }

  void saveButton() {
    cartService.bonusesToPay.value = int.tryParse(controller.text);
    cartService.bonusesToPay.refresh();
    Get.back();
  }
}