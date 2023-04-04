import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/create_order/payment/payment_change/payment_change_screen_controller.dart';
import 'package:superdostavka/ui/screens/create_order/time/choose_time_screen.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class PaymentChangeScreen extends StatexWidget<PaymentChangeScreenController> {
  PaymentChangeScreen({Key? key})
      : super(() => PaymentChangeScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        showDefaultAppBar: false,
        navBarEnable: false,
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Время доставки',
              style: TextStyle(color: Colors.white),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
              onPressed: () {
                Get.back();
              },
            )),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sbHeight,
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Выберите время',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                10.sbHeight,
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ItemWithCheck(
                            isActive: !controller.needChange.value,
                            onTap: () => controller.needChange.value = false,
                            title: 'Нет, сдача не нужна'),
                        5.sbHeight,
                        ItemWithCheck(
                            isActive: controller.needChange.value,
                            onTap: () => controller.needChange.value = true,
                            title: 'Да, сдача нужна'),
                        10.sbHeight,
                        if (controller.needChange.value) ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('С каком суммы подготовить сдачу?',
                                  style: TextStyle(
                                    fontSize: 12,
                                  )),
                              3.sbHeight,
                              const Divider(
                                color: Colors.grey,
                                height: 1,
                              ),
                              TextField(
                                keyboardType: TextInputType.number,
                                controller: controller.changeController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hintText: 'Введите число'),
                              )
                            ],
                          )
                        ]
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () => controller.saveButton(),
                    child: Container(
                      width: Get.width - 30,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Сохранить',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
