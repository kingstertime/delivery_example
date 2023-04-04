import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/cart/bonuses/bonus_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class BonusScreen extends StatexWidget<BonusScreenController> {
  BonusScreen({Key? key}) : super(() => BonusScreenController(), key: key);


  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        backgroundColor: AppColors.mainBackground,
        appBarText: 'Оплата бонусами',
        showDefaultAppBar: false,
        appBar: AppBar(
          backgroundColor: AppColors.purple,
          title: const Text('Корзина'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(
          ()=> SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Text('Бонусов на вашем счету: ${controller.countOfBonuses.value.toInt()}, вы можете оплатить ими до 100% от суммы заказа.'),
                const Divider(color: Colors.grey, thickness: 1,),
                TextField(
                  onChanged: (value) => controller.onChanged(value),
                  controller: controller.controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Количество бонусов: ${controller.countOfBonuses.value.toInt()}'
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1,),
                30.sbHeight,
                TextButton(
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
              ],),
            ),
          ),
        ));
  }

}