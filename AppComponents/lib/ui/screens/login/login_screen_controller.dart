import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class LoginScreenController extends StatexController {
  LoginScreenController({AuthService? authService})
      : authService = authService ?? Get.find();

  final AuthService authService;

  final TextEditingController controller = TextEditingController();

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  final maskFormatter = MaskTextInputFormatter(
      mask: '### ### ####',
      filter: {"#": RegExp(r'\d')},
      type: MaskAutoCompletionType.lazy);

  void sendCode() {
    authService.currentPhone.value =
        int.tryParse(maskFormatter.getUnmaskedText()) ?? 0;
    authService.sendCode(int.tryParse(maskFormatter.getUnmaskedText()) ?? 0);
  }

  void generateApiKey(
          {required int phone, required int code, required int cityId}) =>
      authService.generateApiKey(phone: phone, code: code, cityId: cityId);
}
