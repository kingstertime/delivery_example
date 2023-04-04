import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/menu/menu_screen.controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/stackable_progress_indicator.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:superdostavka/ui/shared/widgets/cart_button.dart';
import 'package:superdostavka/ui/shared/widgets/drawer/drawer.dart';
import 'package:superdostavka/ui/shared/widgets/plus_minus_buttons.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kTabHeight = 40.0;

class MenuScreen extends StatexWidget<MenuScreenController> {
  MenuScreen({Key? key}) : super(() => MenuScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        drawer: AppDrawer(),
        backgroundColor: AppColors.mainBackground,
        showDefaultAppBar: false,
        body: Builder(
          builder: (ctx) => Obx(
            () => Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: controller.onRefresh,
                        child: CustomScrollView(
                          scrollDirection: Axis.vertical,
                          controller: controller.scrollController,
                          slivers: [
                            _buildSliverAppBar(controller, ctx),
                            SliverPadding(
                              padding: const EdgeInsets.all(8),
                              sliver: SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  final currentCategory = controller
                                      .catalog.value.sections
                                      .elementAt(index);
                                  return AutoScrollTag(
                                    controller: controller.scrollController,
                                    key: ValueKey(index),
                                    index: index,
                                    child: VisibilityDetector(
                                      key: ValueKey(index),
                                      onVisibilityChanged:
                                          (VisibilityInfo info) {
                                        if (!controller
                                            .scrollItemVisibility.isClosed) {
                                          controller.scrollItemVisibility.add(
                                              VisibilityInfoWrapper(
                                                  index: index, info: info));
                                        }
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(currentCategory.name.getOrElse(),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18)),
                                          10.sbHeight,
                                          Obx(
                                            () => Column(
                                              children: List.generate(
                                                  currentCategory
                                                      .positions.length, (i) {
                                                final currentPosition =
                                                    currentCategory.positions
                                                        .elementAt(i);
                                                final inCart = controller
                                                    .cartPositions.value.map
                                                    .containsKey(
                                                        currentPosition.id);
                                                return Column(
                                                  children: [
                                                    Product(
                                                      cartPositions: controller
                                                          .cartPositions.value,
                                                      inCart: inCart,
                                                      positionWithCount:
                                                          controller
                                                                  .cartPositions
                                                                  .value
                                                                  .map[
                                                              currentPosition
                                                                  .id],
                                                      orderTap: () {
                                                        debugPrint(
                                                            'add: $currentPosition');
                                                        controller.addToCart(
                                                            currentPosition);
                                                      },
                                                      onModificationTap:
                                                          (index) {
                                                        debugPrint(
                                                            'addMod: ${currentPosition.modifications[index]}');
                                                        controller.addToCart(
                                                            currentPosition
                                                                    .modifications[
                                                                index]);
                                                      },
                                                      plusModTap: (index) =>
                                                          controller.addToCart(
                                                              currentPosition
                                                                      .modifications[
                                                                  index]),
                                                      minusModTap: (index) =>
                                                          controller.removeFromCart(
                                                              currentPosition
                                                                      .modifications[
                                                                  index]),
                                                      position: currentPosition,
                                                      isFavorite: controller
                                                          .isFavorite(
                                                              currentPosition)
                                                          .value,
                                                      onFavoriteTap: () =>
                                                          controller.onFavoriteTap(
                                                              currentPosition),
                                                      plusTap: () =>
                                                          controller.addToCart(
                                                              currentPosition),
                                                      minusTap: () => controller
                                                          .removeFromCart(
                                                              currentPosition),
                                                    ),
                                                    10.sbHeight,
                                                  ],
                                                );
                                              }),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                    childCount: controller
                                        .catalog.value.sections.length),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (controller.isLoading.value ||
                    controller.configLoading.value) ...[
                  const StackableProgressIndicator()
                ]
              ],
            ),
          ),
        ));
  }

  Widget _buildSliverAppBar(
      MenuScreenController controller, BuildContext context) {
    return Obx(
      () => SliverAppBar(
          title: const Text("Меню"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            CartButton(
                sum: controller.cartSum.value,
                onPressed: () {
                  if (controller.isAuthenticated.value) {
                    Get.toNamed(AppRoutes.cart);
                  } else {
                    Get.toNamed(AppRoutes.login);
                  }
                })
          ],
          floating: true,
          pinned: true,
          snap: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kTabHeight),
              child: Align(
                alignment: Alignment.centerLeft,
                child: DefaultTabController(
                    length: controller.catalog.value.sections.length,
                    child: Builder(builder: (BuildContext context) {
                      controller.tabController =
                          DefaultTabController.of(context)!;
                      return TabBar(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                          isScrollable: true,
                          tabs: List.generate(
                              controller.catalog.value.sections.length,
                              (index) => Tab(
                                  height: 28,
                                  text: controller.catalog.value.sections
                                      .elementAt(index)
                                      .name
                                      .getOrElse())),
                          onTap: (sectionIndex) async {
                            controller.tabPressScrollRunning.add(true);
                            await controller.scrollController.scrollToIndex(
                              sectionIndex,
                              preferPosition: AutoScrollPosition.begin,
                            );
                            controller.tabPressScrollRunning.add(false);
                          });
                    })),
              ))),
    );
  }
}

class Product extends StatelessWidget {
  const Product(
      {Key? key,
      required this.position,
      required this.isFavorite,
      required this.onFavoriteTap,
      required this.orderTap,
      this.positionWithCount,
      required this.plusTap,
      required this.minusTap,
      required this.inCart,
      required this.onModificationTap,
      required this.minusModTap,
      required this.plusModTap,
      required this.cartPositions,
      t})
      : super(key: key);

  final Position position;

  final bool isFavorite;

  final Function() onFavoriteTap;

  final Function() orderTap;

  final CartPositions cartPositions;

  final PositionWithCount? positionWithCount;

  final Function() plusTap;

  final Function() minusTap;

  final Function(int index) plusModTap;

  final Function(int index) minusModTap;

  final Function(int index) onModificationTap;

  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network('${AppConfig.apiEndpoint}${position.image.getOrElse()}'),
        5.sbHeight,
        Row(
          children: [
            Text(
              position.name.getOrElse(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            ...[
              MaterialButton(
                minWidth: 20,
                height: 20,
                onPressed: onFavoriteTap,
                child: isFavorite
                    ? Image.asset(
                        AppIcons.fillStar,
                        width: 20,
                        height: 20,
                      )
                    : Image.asset(
                        AppIcons.star,
                        width: 20,
                        height: 20,
                      ),
              ),
            ]
          ],
        ),
        if (position.info.value.isRight()) ...[
          5.sbHeight,
          Text(
            position.info.getOrElse(),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
        if (position.description.value.isRight()) ...[
          5.sbHeight,
          Text(
            position.description.getOrElse(),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
        if (position.modifications.isNotEmpty) ...[
          15.sbHeight,
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: position.modifications.length,
              itemBuilder: (context, index) {
                final currentModification =
                    position.modifications.elementAt(index);
                return Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: [
                            if (currentModification.oldPrice >
                                currentModification.price) ...[
                              Text(
                                '${currentModification.oldPrice.toInt()}',
                                style: TextStyle(
                                  color: Colors.black.withAlpha(90),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationThickness: 2,
                                  decorationColor: Colors.black,
                                ),
                              ),
                              5.sbWidth,
                            ],
                            Text(
                              '${currentModification.price} ₽',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            5.sbWidth,
                            Text(
                              currentModification.name.getOrElse(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                        const Spacer(),
                        (cartPositions.map
                                    .containsKey(currentModification.id) &&
                                cartPositions.map[currentModification.id] !=
                                    null)
                            ? PlusMinusButtons(
                                onMinusTap: () => minusModTap(index),
                                positionWithCount:
                                    cartPositions.map[currentModification.id]!,
                                onPlusTap: () => plusModTap(index))
                            : OrderButton(onTap: () => onModificationTap(index))
                      ],
                    ),
                    10.sbHeight
                  ],
                );
              }),
        ] else ...[
          5.sbHeight,
          Row(
            children: [
              if (position.oldPrice > position.price) ...[
                Text(
                  '${position.oldPrice.toInt()}',
                  style: TextStyle(
                    color: Colors.black.withAlpha(90),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                    decorationColor: Colors.black,
                  ),
                ),
                5.sbWidth,
              ],
              Text(
                '${position.price} ₽',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              (inCart && positionWithCount != null)
                  ? PlusMinusButtons(
                      onMinusTap: minusTap,
                      positionWithCount: positionWithCount!,
                      onPlusTap: plusTap)
                  : OrderButton(onTap: () => orderTap())
            ],
          )
        ]
      ],
    );
  }
}

class OrderButton extends StatelessWidget {
  const OrderButton({Key? key, this.onTap, this.buttonName}) : super(key: key);

  final Function()? onTap;

  final String? buttonName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 38,
      height: 30,
      width: 100,
      child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              disabledBackgroundColor: Colors.grey,
              backgroundColor: Colors.orange,
              enableFeedback: true),
          child: Text(
            buttonName ?? 'ЗАКАЗАТь',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          )),
    );
  }
}

class VisibilityInfoWrapper {
  final VisibilityInfo info;
  final int index;

  VisibilityInfoWrapper({required this.info, required this.index});
}
