import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:superdostavka/ui/screens/login/code_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class CodeScreen extends StatexWidget<CodeScreenController> {
  CodeScreen({Key? key}) : super(() => CodeScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        backgroundColor: AppColors.mainBackground,
        showDefaultAppBar: false,
        appBar: AppBar(
          title: const Text(
            'Вход',
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  40.sbHeight,
                  SvgPicture.asset(
                    AppIcons.ringing,
                    color: Colors.grey,
                    width: 100,
                    height: 200,
                  ),
                  100.sbHeight,
                  const Text(
                    'Введите код, отправленный по SMS',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  25.sbHeight,
                  Pinput(
                    controller: controller.controller,
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(30, 60, 87, 1),
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onCompleted: (pin) => controller.generateApiKey(pin),
                  ),
                  15.sbHeight,
                  MaterialButton(
                    enableFeedback: true,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      controller.buttonTap();
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.purple,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Center(
                          child: Text(
                        'Далее',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
                  20.sbHeight,
                  if (controller.timerCount.value > 0) ...[
                    Text(
                      'Код не пришел?\n'
                      'Получить новый можно через: ${controller.timerCount.value} с.',
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ] else ...[
                    GestureDetector(
                        onTap: () => controller.sendCode(),
                        child: const Text(
                          'ПОЛУЧИТЬ НОВЫЙ КОД ПО СМС',
                          style: TextStyle(color: AppColors.purple),
                        ))
                  ],
                ],
              ),
            ),
          ),
        ));
  }
}
