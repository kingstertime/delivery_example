import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AddAddressScreenController extends StatexController {
  AddAddressScreenController({CreateOrderService? orderService})
      : orderService = orderService ?? Get.find();

  final CreateOrderService orderService;

  GetRxDecorator<List<String>> get addressesList => orderService.addressesList;

  final addressController = TextEditingController();

  GetRxDecoratorString get currentAddress => orderService.currentAddress;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(55.764770297654195, 37.60739211183487),
    zoom: 10.4746,
  );

  final isTapped = false.obsDeco();

  void addAddress() {
    addressesList.value.add(addressController.text);
    addressesList.refresh();
  }
}
