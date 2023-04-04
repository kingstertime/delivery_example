import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/create_order/payment/payment_screen_controller.dart';
import 'package:superdostavka/ui/screens/create_order/time/choose_time_screen.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class PaymentScreen extends StatexWidget<PaymentScreenController> {
  PaymentScreen({Key? key}) : super(() => PaymentScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        showDefaultAppBar: false,
        navBarEnable: false,
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Способ оплаты',
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
                    'Выберите способ оплаты',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                5.sbHeight,
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        ItemWithCheck(
                            isActive: controller.cash.value,
                            onTap: () {
                              controller.disableAll();
                              controller.cash.value = true;
                              Get.toNamed(AppRoutes.change);
                            },
                            title: 'Наличными'),
                        5.sbHeight,
                        ItemWithCheck(
                            isActive: controller.byCardCourier.value,
                            onTap: () {
                              controller.disableAll();
                              controller.byCardCourier.value = true;
                            },
                            title: 'Картой курьеру/кассиру'),
                        ItemWithCheck(
                            isActive: controller.byCardInApp.value,
                            onTap: () {
                              controller.disableAll();
                              controller.byCardInApp.value = true;
                            },
                            title: 'Картой в приложении'),
                        5.sbHeight,
                      ],
                    )),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    onPressed: () => Get.back(),
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
