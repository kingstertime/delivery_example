import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/action/action.dart' as domain;
import 'package:superdostavka/logic/actions/actions_bloc.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class ActionsService extends GetxService with StreamSubscriberMixin {
  ActionsService({ActionsBloc? actionsBloc, CartService? cartService})
      : actionsBloc = actionsBloc ?? ActionsBloc.makeInstance(),
        cartService = cartService ?? Get.find();

  final CartService cartService;

  final ActionsBloc actionsBloc;

  final isLoading = false.obsDeco();

  final GetRxDecorator<domain.Actions> actions = domain.Actions.empty.obsDeco();

  GetRxDecoratorInt get sum => cartService.sum;

  @override
  void onInit() {
    super.onInit();
    actionsBloc.stream.listen(_processState);
  }

  void getActions() {
    actionsBloc.add(const ActionsEvent.getActions());
  }

  void _processState(ActionsState state) {
    state.maybeWhen(
        gotActions: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold((l) => debugPrint('ERROR: $l'), (r) {
                  actions.value = r;
                  actions.refresh();
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
