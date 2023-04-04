import 'package:get/get.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class ChooseTimeScreenController extends StatexController {
  ChooseTimeScreenController({CreateOrderService? orderService})
      : orderService = orderService ?? Get.find();

  final CreateOrderService orderService;

  GetRxDecoratorBool get now => orderService.now;

  GetRxDecorator<DateTime> get currentDateTime => orderService.currentDateTime;
}
