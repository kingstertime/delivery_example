import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/favorites/favorites_screen_controller.dart';
import 'package:superdostavka/ui/screens/menu/menu_screen.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:superdostavka/ui/shared/widgets/drawer/drawer.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class FavoritesScreen extends StatexWidget<FavoritesScreenController> {
  FavoritesScreen({Key? key})
      : super(() => FavoritesScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    return AppScaffold(
        navBarEnable: false,
        backgroundColor: AppColors.mainBackground,
        appBarText: controller.favoritesStructure.name.getOrElse(),
        /*
        appBar: AppBar(
            backgroundColor: AppColors.purple,
            title: Text(controller.favoritesStructure.name.getOrElse())),*/
        drawer: AppDrawer(),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    controller.favoritesService.favoritePositions.value.length,
                    (i) {
                  final currentPosition = controller
                      .favoritesService.favoritePositions.value
                      .elementAt(i);
                  final inCart = controller.cartPositions.value.map
                      .containsKey(currentPosition.id);
                  return Column(
                    children: [
                      Product(
                        inCart: inCart,
                        positionWithCount: controller
                            .cartPositions.value.map[currentPosition.id],
                        orderTap: () {},
                        position: currentPosition,
                        isFavorite:
                            controller.isFavorite(currentPosition).value,
                        onFavoriteTap: () =>
                            controller.onFavoriteTap(currentPosition),
                        plusTap: () => controller.addToCart(currentPosition),
                        minusTap: () =>
                            controller.removeFromCart(currentPosition),
                        onModificationTap: (index) => controller
                            .addToCart(currentPosition.modifications[index]),
                        minusModTap: (int index) {
                          controller.removeFromCart(
                              currentPosition.modifications[index]);
                        },
                        plusModTap: (int index) {
                          controller
                              .addToCart(currentPosition.modifications[index]);
                        },
                        cartPositions: controller.cartPositions.value,
                      ),
                      10.sbHeight,
                    ],
                  );
                }),
              ),
            ),
          ),
        ));
  }
}
