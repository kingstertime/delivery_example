import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/create_order/time/choose_time_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class ChooseTimeScreen extends StatexWidget<ChooseTimeScreenController> {
  ChooseTimeScreen({Key? key})
      : super(() => ChooseTimeScreenController(), key: key);

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
                            isActive: controller.now.value,
                            onTap: () => controller.now.toggle(),
                            title: 'На ближайшее'),
                        5.sbHeight,
                        ItemWithCheck(
                            isActive: !controller.now.value,
                            onTap: () => controller.now.toggle(),
                            title: 'Точно ко времени'),
                        5.sbHeight,
                        if (!controller.now.value) ...[
                          SizedBox(
                              height: 200,
                              child: CupertinoDatePicker(
                                onDateTimeChanged: (dateTime) {
                                  controller.currentDateTime.value = dateTime;
                                  controller.currentDateTime.refresh();
                                },
                                use24hFormat: true,
                              ))
                        ]
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

class ItemWithCheck extends StatelessWidget {
  const ItemWithCheck(
      {super.key,
      required this.isActive,
      required this.onTap,
      required this.title});

  final bool isActive;

  final Function() onTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          20.sbHeight,
          Row(
            children: [
              Text(title),
              const Spacer(),
              if (isActive) ...[
                const Icon(
                  Icons.check,
                  color: AppColors.purple,
                  size: 20,
                )
              ]
            ],
          ),
          20.sbHeight,
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}
