import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class CreateOrderScreen extends StatexWidget<CreateOrderScreenController> {
  CreateOrderScreen({Key? key})
      : super(() => CreateOrderScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return Obx(
      () {
        controller.addressesList.value;
        return AppScaffold(
          showDefaultAppBar: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              iconSize: 20,
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              'Итого: ${controller.cartSum.value} ₽',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          navBarEnable: false,
          backgroundColor: AppColors.mainBackground,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  5.sbHeight,
                  const Text(
                    'Данные для оформления заказа',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  OrderItemArrow(
                      title: controller.currentAddress.value.isNotEmpty
                          ? controller.currentAddress.value
                          : 'Укажите адрес',
                      pngPath: AppIcons.mapPin,
                      onTap: () => Get.toNamed(AppRoutes.addresses)),
                  OrderItemArrow(
                      title: controller.now.value
                          ? 'Ближайшее время'
                          : DateFormat('d MMM y h:mm', 'ru')
                              .format(controller.currentDateTime.value),
                      pngPath: AppIcons.clock,
                      onTap: () => Get.toNamed(AppRoutes.time)),
                  OrderItemArrow(
                      title: controller.currentNameForPayment(),
                      pngPath: AppIcons.wallet,
                      onTap: () => Get.toNamed(AppRoutes.payment)),
                  OrderItemWithButtons(
                      onPlusTap: () {},
                      onMinusTap: () {},
                      title: 'Количество персон'),
                  OrderItemWithField(
                      controller: controller.nameController,
                      title: 'Имя',
                      pngPath: AppIcons.user),
                  OrderItemWithField(
                      controller: controller.phoneController,
                      title: '',
                      prefixText: '+7',
                      pngPath: AppIcons.phone),
                  OrderItemWithField(
                      controller: controller.commentController,
                      title: 'Комментарий к заказу',
                      pngPath: AppIcons.comment),
                  10.sbHeight,
                  Row(
                    children: [
                      const Text(
                        'Я указал все детали, оператору \n можно не звонить',
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: controller.switcher.value,
                        onChanged: (value) => controller.switcher.value = value,
                        activeColor: Colors.orange,
                      )
                    ],
                  ),
                  30.sbHeight,
                  TextButton(
                    onPressed: () => controller.sendOrder(),
                    child: Container(
                      width: Get.width - 30,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text(
                        'Оформить заказ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class OrderItemArrow extends StatelessWidget {
  const OrderItemArrow(
      {required this.title,
      this.pngPath,
      required this.onTap,
      this.icon,
      Key? key})
      : super(key: key);

  final String? pngPath;

  final IconData? icon;

  final String title;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          10.sbHeight,
          Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      size: 20,
                      color: Colors.red,
                    )
                  : Image.asset(
                      pngPath ?? '',
                      width: 20,
                      height: 20,
                      color: Colors.red,
                    ),
              10.sbWidth,
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right, color: Colors.grey)
            ],
          ),
          10.sbHeight,
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}

class OrderItemWithButtons extends GetViewSim<CreateOrderScreenController> {
  const OrderItemWithButtons(
      {required this.onPlusTap,
      required this.onMinusTap,
      required this.title,
      Key? key})
      : super(key: key);

  final Function() onPlusTap;

  final Function() onMinusTap;

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        5.sbHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppIcons.twoPeople,
              color: Colors.red,
              height: 20,
              width: 20,
            ),
            10.sbWidth,
            const Text(
              'Количество персон',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Obx(
              () => PlusMinusButtons(
                  onMinusTap: () => controller.minusButton(),
                  count: controller.countOfPeople.value,
                  onPlusTap: () => controller.plusButton()),
            )
          ],
        ),
        5.sbHeight,
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}

class PlusMinusButtons extends StatelessWidget {
  const PlusMinusButtons(
      {Key? key,
      required this.onMinusTap,
      required this.count,
      required this.onPlusTap})
      : super(key: key);

  final Function() onMinusTap;

  final int count;

  final Function() onPlusTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 38,
          height: 38,
          child: MaterialButton(
            color: Colors.orange,
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => onMinusTap(),
            child: Image.asset(
              AppIcons.minus,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ),
        10.sbWidth,
        Text(
          '$count',
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
        10.sbWidth,
        SizedBox(
          width: 38,
          height: 38,
          child: MaterialButton(
            color: Colors.orange,
            padding: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => onPlusTap(),
            child: Image.asset(
              AppIcons.plus,
              width: 30,
              height: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class OrderItemWithField extends StatelessWidget {
  const OrderItemWithField(
      {required this.title,
      required this.pngPath,
      this.prefixText,
      this.controller,
      Key? key})
      : super(key: key);

  final String title;

  final String pngPath;

  final String? prefixText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.sbHeight,
        Row(
          children: [
            Image.asset(
              pngPath,
              color: Colors.red,
              width: 20,
              height: 20,
            ),
            10.sbWidth,
            Flexible(
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintMaxLines: 1,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    constraints:
                        const BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 0, minHeight: 0),
                    prefixIcon: prefixText != null
                        ? Text(
                            prefixText ?? '',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          )
                        : null,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: prefixText != null ? null : title),
              ),
            )
          ],
        ),
        10.sbHeight,
        const Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
