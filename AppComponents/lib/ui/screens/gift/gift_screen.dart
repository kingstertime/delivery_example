import 'package:flutter/material.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/ui/screens/gift/gift_screen_controller.dart';
import 'package:superdostavka/ui/screens/menu/menu_screen.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class GiftScreen extends StatexWidget<GiftScreenController> {
  GiftScreen({Key? key}) : super(() => GiftScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
      navBarEnable: false,
      backButton: true,
      appBarText: 'Подарок от шефа',
      backgroundColor: AppColors.mainBackground,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.getMaxGiftSum(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              20.sbHeight,
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.giftMap.value.keys.length,
                  itemBuilder: (context, index) {
                    final giftPrice =
                        controller.giftMap.value.keys.elementAt(index);
                    final currentGiftList = controller.giftMap.value[giftPrice];
                    if (currentGiftList == null) {
                      return const Center(
                        child: Text(
                          'На данный момент нет подарков от шефа',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Подарок от $giftPrice₽',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          10.sbHeight,
                          Column(
                            children:
                                List.generate(currentGiftList.length, (index) {
                              final currentGift = currentGiftList[index];
                              return Gift(
                                  buttonName: controller.currentGift.value.id ==
                                          currentGift.id
                                      ? 'Отменить выбор'
                                      : 'Выбрать',
                                  giftPosition: currentGift,
                                  onTap: controller.cartSum.value >=
                                          (int.tryParse(currentGift.value
                                                  .getOrElse()) ??
                                              0)
                                      ? () => controller.onGiftTap(currentGift)
                                      : null);
                            }),
                          ),
                        ],
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Gift extends StatelessWidget {
  const Gift({
    Key? key,
    required this.giftPosition,
    this.onTap,
    required this.buttonName,
  }) : super(key: key);

  final GiftPosition giftPosition;

  final String buttonName;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
            '${AppConfig.apiEndpoint}${giftPosition.image.getOrElse()}'),
        15.sbHeight,
        Text(
          giftPosition.name.getOrElse(),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        5.sbHeight,
        if (giftPosition.info.value.isRight()) ...[
          5.sbHeight,
          Text(
            giftPosition.info.getOrElse(),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
        if (giftPosition.description.value.isRight()) ...[
          5.sbHeight,
          Text(
            giftPosition.description.getOrElse(),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
        10.sbHeight,
        Align(
          alignment: Alignment.centerRight,
          child: OrderButton(
            buttonName: buttonName,
            onTap: onTap,
          ),
        ),
        10.sbHeight,
      ],
    );
  }
}
