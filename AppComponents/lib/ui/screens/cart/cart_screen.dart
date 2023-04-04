import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/cart/cart_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:superdostavka/ui/shared/widgets/plus_minus_buttons.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class CartScreen extends StatexWidget<CartScreenController> {
  CartScreen({Key? key}) : super(() => CartScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
      navBarEnable: false,
      backgroundColor: AppColors.mainBackground,
      appBarText: 'Корзина',
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
        actions: [
          TextButton(
            onPressed: () => controller.removeAllPositions(),
            child: SvgPicture.asset(
              AppIcons.trash,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                if (controller.positions.value.map.isNotEmpty) ...[
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.positions.value.map.values.length,
                      itemBuilder: (context, index) {
                        final currentItem = controller
                            .positions.value.map.values
                            .elementAt(index);
                        return PositionItem(
                          positionWithCount: currentItem,
                          onMinusTap: () =>
                              controller.removeFromCart(currentItem.position),
                          onPlusTap: () =>
                              controller.addToCart(currentItem.position),
                        );
                      }),
                  Row(
                    children: [
                      const Text(
                        'Итого',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      const Spacer(),
                      Text(
                        '${controller.cartSum.value}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  30.sbHeight,
                  const CartSections(),
                  10.sbHeight,
                  Align(
                    child: TextButton(
                      onPressed: () => Get.toNamed(AppRoutes.createOrder),
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
                    ),
                  ),
                ] else ...[
                  100.sbHeight,
                  Center(child: SvgPicture.asset(AppIcons.illustrationCart)),
                  25.sbHeight,
                  const Text(
                    'Ваша корзина пуста.\n Добавьте в нее что-нибудь :)',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  )
                ]
              ]),
            ),
          );
        },
      ),
    );
  }
}

class PositionItem extends StatelessWidget {
  const PositionItem(
      {Key? key,
      required this.positionWithCount,
      required this.onPlusTap,
      required this.onMinusTap})
      : super(key: key);

  final PositionWithCount positionWithCount;

  final Function() onPlusTap;

  final Function() onMinusTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(positionWithCount.position.name.getOrElse()),
            Row(
              children: [
                PlusMinusButtons(
                    onMinusTap: onMinusTap,
                    positionWithCount: positionWithCount,
                    onPlusTap: onPlusTap),
                15.sbWidth,
                Text(
                  '${(positionWithCount.position.price.toInt() * positionWithCount.count)} ₽',
                  style: const TextStyle(color: Colors.black),
                )
              ],
            )
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}

class CartSections extends GetViewSim<CartScreenController> {
  const CartSections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('test: ${controller.bonusesToPay.value}');
    return Obx(
      () => Column(children: [
        const Divider(
          color: Colors.grey,
        ),
        10.sbHeight,
        CartSection(
          imgPath: AppIcons.gift,
          text: c.currentGift.value.id == 0
              ? 'Подарок от шефа'
              : c.currentGift.value.name.getOrElse(),
          onTap: () => Get.toNamed(AppRoutes.gifts),
        ),
        CartSection(
          isSvg: true,
            imgPath: AppIcons.bonusPay, text: controller.bonusesToPay.value > 0 ? '${controller.bonusesToPay.value}' : 'Оплата бонусами', onTap: () {
            Get.toNamed(AppRoutes.bonuse);
        }),
      ]),
    );
  }
}

class CartSection extends StatelessWidget {
  const CartSection(
      {Key? key,
      required this.imgPath,
      required this.text,
      required this.onTap,
      this.isSvg = false})
      : super(key: key);

  final String imgPath;

  final String text;

  final bool isSvg;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Row(
            children: [
              isSvg ? SvgPicture.asset(imgPath, width: 20, height: 20, color: Colors.red,) : Image.asset(
                imgPath,
                width: 20,
                height: 20,
                color: Colors.red,
              ),
              5.sbWidth,
              Text(
                text,
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
