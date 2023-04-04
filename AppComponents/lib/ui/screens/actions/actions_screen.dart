import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/actions/actions_screen_controller.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/stackable_progress_indicator.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold.dart';
import 'package:superdostavka/ui/shared/widgets/cart_button.dart';
import 'package:superdostavka/ui/shared/widgets/drawer/drawer.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class ActionsScreen extends StatexWidget<ActionsScreenController> {
  ActionsScreen({Key? key}) : super(() => ActionsScreenController(), key: key);

  @override
  Widget buildWidget(BuildContext context) {
    final tabs = List.generate(
        controller.actionStructure.settings.deliveryTabs.length,
        (index) => Tab(
              height: 28,
              text: controller.actionStructure.settings.deliveryTabs
                  .elementAt(index)
                  .name
                  .getOrElse(),
            ));

    return DefaultTabController(
      length: controller.actionStructure.settings.deliveryTabs.length,
      child: AppScaffold(
          showDefaultAppBar: false,
          appBar: AppBar(
              backgroundColor: AppColors.purple,
              title: Text(
                controller.actionStructure.name.getOrElse(),
              ),
              leading: Builder(
                builder: (ctx) => IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(ctx).openDrawer();
                  },
                ),
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
              bottom: TabBar(
                tabs: tabs,
              )),
          appBarText: controller.actionStructure.name.getOrElse(),
          navBarEnable: false,
          drawer: AppDrawer(),
          backgroundColor: AppColors.mainBackground,
          body: Stack(
            children: [
              TabBarView(children: controller.tabs(tabs)),
              if (controller.isLoading.value) ...[
                const StackableProgressIndicator()
              ]
            ],
          )),
    );
  }
}

class ActionsTab extends GetViewSim<ActionsScreenController> {
  const ActionsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:
            List.generate(controller.actions.value.actions.length, (index) {
          final currentAction =
              controller.actions.value.actions.elementAt(index);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                      '${AppConfig.apiEndpoint}${currentAction.image.getOrElse()}'),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        5.sbHeight,
                        Text(
                          currentAction.name.getOrElse(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 18),
                        ),
                        if (currentAction.shortDescription
                            .getOrElse()
                            .isNotEmpty) ...[
                          5.sbHeight,
                          Text(
                            currentAction.shortDescription.getOrElse(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (currentAction.description.getOrElse().isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ExpansionTile(
                        title: const Text(
                          'Подробнее',
                          style: TextStyle(color: Colors.grey),
                        ),
                        children: [
                          Text(
                            currentAction.description.getOrElse(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class PromocodeTab extends GetViewSim<ActionsScreenController> {
  const PromocodeTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Text('Promocodes');
  }
}
