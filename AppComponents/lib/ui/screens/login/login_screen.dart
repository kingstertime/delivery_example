import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/login/login_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class LoginScreen extends StatexWidget<LoginScreenController> {
  LoginScreen({Key? key}) : super(() => LoginScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        showDefaultAppBar: false,
        backgroundColor: AppColors.mainBackground,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Укажите ваш номер телефона',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              20.sbHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1.5))),
                      child: const Text(
                        '+7',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  10.sbWidth,
                  Flexible(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 1.5))),
                      child: TextField(
                        inputFormatters: [controller.maskFormatter],
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                        controller: controller.controller,
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: '999 999 9999',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 24,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets
                              .zero, /*border: UnderlineInputBorder()*/
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              50.sbHeight,
              MaterialButton(
                enableFeedback: true,
                padding: EdgeInsets.zero,
                onPressed: () {
                  controller.sendCode();
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
              )
            ],
          ),
        ));
  }
}
