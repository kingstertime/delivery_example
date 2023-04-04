import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class CodeScreenController extends StatexController {
  CodeScreenController({AuthService? authService, ConfigService? configService})
      : authService = authService ?? Get.find(),
        configService = configService ?? Get.find();

  final timerCount = 60.obsDeco();

  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerCount.value--;
    });
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

  final AuthService authService;

  final ConfigService configService;

  final TextEditingController controller = TextEditingController();

  void generateApiKey(String pin) => authService.generateApiKey(
      phone: authService.currentPhone.value,
      code: int.tryParse(pin) ?? 0,
      cityId: configService.currentCity.value.id);

  void buttonTap() => authService.generateApiKey(
      phone: authService.currentPhone.value,
      code: int.tryParse(controller.text) ?? 0,
      cityId: configService.currentCity.value.id);

  void sendCode() {
    authService.sendCode(authService.currentPhone.value);
    timerCount.value = 60;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerCount.value--;
    });
  }
}
