import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold_service.dart';
import 'package:superdostavka/ui/shared/widgets/colored_safearea.dart';
import 'package:superdostavka/ui/shared/widgets/drawer/drawer.dart';

class AppScaffold extends GetView<AppScaffoldService> {
  const AppScaffold(
      {Key? key,
      required this.body,
      this.appBar,
      this.tabBarEnable = true,
      this.navBarEnable = true,
      this.backgroundColor = AppColors.mainBackground,
      this.resizeToAvoidBottomInset,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.drawer,
      this.scaffoldKey,
      this.showDefaultAppBar = true,
      this.appBarText,
      this.drawerEnableOpenDragGesture = true,
      this.extendBodyBehindAppBar = false,
      this.backButton = false})
      : super(key: key);

  final Widget body;
  final Color backgroundColor;
  final bool tabBarEnable;
  final bool navBarEnable;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final String? appBarText;
  final bool showDefaultAppBar;
  final bool drawerEnableOpenDragGesture;
  final bool extendBodyBehindAppBar;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    final service = controller;
    if (navBarEnable) {
      return ColoredSafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          key: scaffoldKey,
          drawer: backButton ? null : AppDrawer(),
          appBar: showDefaultAppBar
              ? AppBar(
                  backgroundColor: AppColors.purple,
                  title: Text(
                    appBarText ?? '',
                  ),
                  leading: backButton
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        )
                      : null,
                  actions: [
                      Obx(
                        () => MaterialButton(
                          onPressed: () {
                            if (controller.isAuthenticated.value) {
                              Get.toNamed(AppRoutes.cart);
                            } else {
                              Get.toNamed(AppRoutes.login);
                            }
                          },
                          child: Row(children: [
                            Image.asset(
                              AppIcons.cart,
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                            5.sbWidth,
                            Text(
                              '${controller.cartSum.value.toInt()} ₽',
                              style: const TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                    ])
              : appBar,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: body,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            items: <BottomNavigationBarItem>[
              for (var nav in service.listBottomNav.value)
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: AppIcons.img(
                      nav.icon,
                      width: 24,
                      height: 21,
                    ),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: AppIcons.img(
                      nav.icon,
                      width: 24,
                      height: 21,
                      color: nav.activeColor,
                    ),
                  ),
                  label: nav.text.tr,
                ),
            ],
            currentIndex: service.currentNavIndex$,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: service.goToPage,
            backgroundColor: AppColors.purple,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      );
    } else {
      return ColoredSafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawer: backButton ? null : AppDrawer(),
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButton: floatingActionButton,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          key: scaffoldKey,
          appBar: showDefaultAppBar
              ? AppBar(
                  backgroundColor: AppColors.purple,
                  title: Text(
                    appBarText ?? '',
                  ),
                  leading: backButton
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.back();
                          },
                        )
                      : null,
                  actions: [
                      Obx(
                        () => MaterialButton(
                          onPressed: () {
                            if (controller.isAuthenticated.value) {
                              Get.toNamed(AppRoutes.cart);
                            } else {
                              Get.toNamed(AppRoutes.login);
                            }
                          },
                          child: Row(children: [
                            Image.asset(
                              AppIcons.cart,
                              color: Colors.white,
                              height: 20,
                              width: 20,
                            ),
                            5.sbWidth,
                            Text(
                              '${controller.cartSum.value.toInt()} ₽',
                              style: const TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ),
                    ])
              : appBar,
          backgroundColor: backgroundColor,
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: body,
          ),
        ),
      );
    }
  }
}
