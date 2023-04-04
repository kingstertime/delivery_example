import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/web_views/drawer_webview.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/drawer/drawer_controller.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AppDrawer extends StatexWidget<AppDrawerController> {
  AppDrawer({Key? key}) : super(() => AppDrawerController(), key: key);
  @override
  Widget buildWidget(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.purple,
      child: Obx(
        () => ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          '${AppConfig.apiEndpoint}${controller.config.value.deliverySettings.logoUrl.getOrElse()}',
                        ),
                        fit: BoxFit.cover)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (controller.isAuthenticated.value) ...[
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.userInfo.value.name.getOrElse(),
                                style: const TextStyle(color: Colors.white),
                              ),
                              5.sbHeight,
                              Text(
                                controller.userInfo.value.phone.getOrElse(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ))
                    ],
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        if (controller.isAuthenticated.value) {
                          controller.logout();
                        } else {
                          Get.toNamed(AppRoutes.login);
                        }
                      },
                      child: Text(
                        controller.isAuthenticated.value ? 'ВЫЙТИ' : 'ВОЙТИ',
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            /*controller.isAuthenticated.value
                ? MenuItem(
                    isLocalImage: true,
                    iconPath: AppIcons.profile,
                    text: controller.userInfo.value.phone.getOrElse(),
                    onTap: () {
                      controller.logout();
                    })
                : MenuItem(
                    isLocalImage: true,
                    iconPath: AppIcons.profile,
                    text: 'Войти',
                    onTap: () => Get.toNamed(AppRoutes.login)),*/
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    controller.config.value.deliverySettings.structure.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final currentItem = controller
                      .config.value.deliverySettings.structure
                      .elementAt(index);
                  return MenuItem(
                      iconPath:
                          '${AppConfig.apiEndpoint}${currentItem.img.getOrElse()}',
                      text: currentItem.name.getOrElse(),
                      onTap: () {
                        final pageRoute = '/${currentItem.slug.getOrElse()}';
                        if (AppRoutes.routeList.contains(pageRoute)) {
                          Get.toNamed(pageRoute);
                        } else {
                          Get.to(() => DrawerWebView(), arguments: [
                            '${AppConfig.apiEndpoint}/mobile$pageRoute',
                            currentItem.name.getOrElse()
                          ]);
                        }
                      });
                }),
            10.sbHeight,
            if (controller.config.value.cities.length > 1) ...[
              Column(
                children: [
                  const CityBlock(),
                  10.sbHeight,
                ],
              )
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GestureDetector(
                  onTap: () => controller.openDeliverestLink(),
                  child: const Text(
                    "Работает на платформе Deliverest",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        decoration: TextDecoration.underline),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem(
      {Key? key,
      required this.iconPath,
      required this.text,
      required this.onTap,
      this.isLocalImage = false})
      : super(key: key);

  final String iconPath;
  final String text;
  final Function() onTap;
  final bool isLocalImage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 250,
        child: Row(
          children: [
            isLocalImage
                ? Image.asset(
                    iconPath,
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  )
                : Image.network(
                    iconPath,
                    errorBuilder: (context, url, error) => Image.asset(
                      AppIcons.delivery,
                      width: 30,
                      height: 30,
                      color: Colors.white,
                    ),
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
            5.sbWidth,
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      onTap: onTap,
      selectedColor: Colors.blue,
    );
  }
}

class CityBlock extends GetViewSim<AppDrawerController> {
  const CityBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.city, arguments: true),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            5.sbHeight,
            Row(
              children: [
                const Text(
                  'Город доставки',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Spacer(),
                Text(
                  controller.currentCity.value.name.getOrElse(),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                5.sbWidth,
                const Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            ),
            5.sbHeight,
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
