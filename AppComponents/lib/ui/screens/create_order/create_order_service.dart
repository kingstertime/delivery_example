import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/logic/order/order_bloc.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/shared/app_alert.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class CreateOrderService extends GetxService with StreamSubscriberMixin {
  CreateOrderService({OrderBloc? orderBloc,})
      : orderBloc = orderBloc ?? OrderBloc.makeInstance();

  final OrderBloc orderBloc;

  final isLoading = false.obsDeco();

  final addressesList = <String>[].obsDeco();

  final currentAddress = ''.obsDeco();

  final currentDateTime = DateTime.now().obsDeco();

  final now = true.obsDeco();

  final cash = false.obsDeco();

  final byCardInApp = false.obsDeco();

  final byCardCourier = false.obsDeco();

  final needChange = false.obsDeco();

  final changeSum = 0.obsDeco();

  final pickupAddressId = 0.obsDeco();

  final tempOrder = OrderBody().obsDeco();

  @override
  void onInit() {
    super.onInit();
    orderBloc.stream.listen(_processOrder);
  }

  void sendOrder(OrderBody orderBody, CartService cartService) {
    orderBloc.add(OrderEvent.validateOrder(ValidateOrderBody(
        order: OrderDto(
            cityId: orderBody.order?.cityId,
            promocode: null,
            positions: cartService.positions.value.map.values
                .map((e) => PositionsBodyDto(
                    id: e.position.id,
                    quantity: e.count,
                    price: e.position.price))
                .toList(),
            giftId: cartService.currentGift.value.giftId))));
    tempOrder.value = orderBody;
  }

  void _processOrder(OrderState state) {
    state.maybeWhen(
        validated: (d) {
          d.maybeWhen(
            loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold((l) => appAlert(value: l.error, color: Colors.red), (r) {
                  if (r.errorMessage.isNotEmpty) {
                    appAlert(value: r.errorMessage, color: Colors.red);
                  } else {

                    orderBloc.add(OrderEvent.sendOrder(tempOrder.value));
                  }
                });
              },
              orElse: () {});
        },
        sentOrder: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold(
                    (l) => appAlert(
                        value: 'Неуспешная отправка заказа: $l',
                        color: CupertinoColors.systemRed), (r) {
                  Get.toNamed(AppRoutes.menu);
                  Get.clearRouteTree();
                  appAlert(
                      value: 'Заказ успешно отправлен',
                      color: CupertinoColors.systemGreen);
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
