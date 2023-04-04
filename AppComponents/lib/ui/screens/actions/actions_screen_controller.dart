import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/domain/action/action.dart' as domain;
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/value_objects.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/actions/actions_screen.dart';
import 'package:superdostavka/ui/screens/actions/actions_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class ActionsScreenController extends StatexController {
  ActionsScreenController(
      {ConfigService? configService,
      ActionsService? actionsService,
      AuthService? authService})
      : configService = configService ?? Get.find(),
        actionsService = actionsService ?? Get.find(),
        authService = authService ?? Get.find();

  final AuthService authService;

  final ActionsService actionsService;

  final ConfigService configService;

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  GetRxDecorator<Config> get config => configService.lateConfig;

  Structure get actionStructure =>
      config.value.deliverySettings.structure.firstWhereOrNull(
          (element) => element.slug.getOrElse() == 'action') ??
      Structure.empty;

  GetRxDecorator<domain.Actions> get actions => actionsService.actions;

  GetRxDecoratorBool get isLoading => actionsService.isLoading;

  GetRxDecoratorInt get cartSum => actionsService.sum;

  List<Widget> tabs(List<Tab> tabs) {
    final widgets = <Widget>[];

    final actionTab = actionStructure.settings.deliveryTabs.firstWhereOrNull(
            (element) => element.slug.getOrElse() == 'actions') ??
        DeliveryTabs(name: ''.nonEmpty, slug: ''.nonEmpty);
    for (var e in tabs) {
      if (actionTab.name.getOrElse() == e.text) {
        widgets.add(const ActionsTab());
      } else {
        widgets.add(const PromocodeTab());
      }
    }
    return widgets;
  }

  @override
  void onReady() {
    super.onReady();
    actionsService.getActions();
  }
}
