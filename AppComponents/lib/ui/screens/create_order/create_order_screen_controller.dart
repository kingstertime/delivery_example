import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class CreateOrderScreenController extends StatexController {
  CreateOrderScreenController(
      {CartService? cartService,
      CreateOrderService? orderService,
      ConfigService? configService,
      UserInfoService? userInfoService})
      : cartService = cartService ?? Get.find(),
        orderService = orderService ?? Get.find(),
        configService = configService ?? Get.find(),
        userInfoService = userInfoService ?? Get.find();

  final CreateOrderService orderService;

  final ConfigService configService;

  final UserInfoService userInfoService;

  final CartService cartService;

  GetRxDecoratorInt get cartSum => cartService.sum;

  final countOfPeople = 0.obsDeco();

  final switcher = false.obsDeco();

  GetRxDecorator<List<String>> get addressesList => orderService.addressesList;

  GetRxDecoratorBool get now => orderService.now;

  GetRxDecorator<DateTime> get currentDateTime => orderService.currentDateTime;

  GetRxDecoratorString get currentAddress => orderService.currentAddress;

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final commentController = TextEditingController();

  void sendOrder() {
    final positionsBody = <PositionsBody>[];

    cartService.positions.value.map.forEach((key, value) {
      positionsBody.add(PositionsBody(
          id: '${value.position.id}', quantity: '${value.count}'));
    });

    var paymentType = 0;

    if (orderService.needChange.value) {
      paymentType = 0;
    }
    if (orderService.byCardCourier.value) {
      paymentType = 1;
    }
    if (orderService.byCardInApp.value) {
      paymentType = 2;
    }

    orderService.sendOrder(OrderBody(
        order: Order(
            date: DateBody(type: now.value ? 0 : 1),
            positionsBody: positionsBody,
            bonuses: cartService.bonusesToPay.value,
            contactBody: ContactBody(
                phone: phoneController.text, name: nameController.text),
            comment: commentController.text,
            cityId: configService.currentCity.value.id,
            addressId: userInfoService.userInfo.value.addresses.isNotEmpty
                ? userInfoService.userInfo.value.addresses.first.id
                : 0,
            persons: countOfPeople.value,
            deliveryType: now.value ? 0 : 1,
            isPickup: orderService.pickupAddressId.value != 0 ? true : false,
            payment: PaymentBody(
              payType: paymentType,
              cashPaid: orderService.needChange.value
                  ? orderService.changeSum.value
                  : null,
              payMethod: (paymentType == 2) ? 0 : null,
              cardId: null,
              paymentData: null,
            ),
            workshopId: orderService.pickupAddressId.value != 0
                ? orderService.pickupAddressId.value
                : null)), cartService);
  }

  void plusButton() {
    countOfPeople.value = countOfPeople.value + 1;
  }

  void minusButton() {
    if (countOfPeople.value > 0) {
      countOfPeople.value = countOfPeople.value - 1;
    }
  }

  String currentNameForPayment() {
    if (orderService.cash.value) {
      if (orderService.needChange.value) {
        return 'Наличными (сдача с ${orderService.changeSum})';
      } else {
        return 'Наличными (без сдачи)';
      }
    } else if (orderService.byCardCourier.value) {
      return 'Картой курьеру/кассиру';
    } else {
      'Картой в приложении';
    }
    return 'Картой в приложении';
  }
}
