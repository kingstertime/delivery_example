import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class PaymentScreenController extends StatexController {
  PaymentScreenController({CreateOrderService? orderService})
      : orderService = orderService ?? Get.find();

  final CreateOrderService orderService;

  GetRxDecoratorBool get cash => orderService.cash;

  GetRxDecoratorBool get byCardInApp => orderService.byCardInApp;

  GetRxDecoratorBool get byCardCourier => orderService.byCardCourier;

  void disableAll() {
    cash.value = false;
    byCardInApp.value = false;
    byCardCourier.value = false;
  }
}
