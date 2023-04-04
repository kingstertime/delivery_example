import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class PaymentChangeScreenController extends StatexController {
  PaymentChangeScreenController({CreateOrderService? orderService})
      : orderService = orderService ?? Get.find();

  final CreateOrderService orderService;

  GetRxDecoratorBool get needChange => orderService.needChange;

  final changeController = TextEditingController();

  GetRxDecoratorInt get changeSum => orderService.changeSum;

  void saveButton() {
    if (needChange.value) {
      changeSum.value = int.tryParse(changeController.text);
    }
    Get.back();
  }
}
