import 'package:get/get.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/create_order/create_order_service.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AddressScreenController extends StatexController {
  AddressScreenController(
      {CreateOrderService? orderService,
      ConfigService? configService,
      UserInfoService? userInfoService})
      : orderService = orderService ?? Get.find(),
        configService = configService ?? Get.find(),
        userInfoService = userInfoService ?? Get.find();

  final ConfigService configService;

  final CreateOrderService orderService;

  final UserInfoService userInfoService;

  GetRxDecorator<List<PickupAddress>> get pickupAddresses =>
      userInfoService.userInfo.value.pickupAddresses.obsDeco();

  GetRxDecorator<List<String>> get addressesList => orderService.addressesList;

  GetRxDecoratorString get currentAddress => orderService.currentAddress;

  GetRxDecorator<Config> get config => configService.lateConfig;

  void setCurrentAddress(int index) {
    currentAddress.value = addressesList.value.elementAt(index);
  }

  void removeAddress(int index) {
    if (addressesList.value[index] == currentAddress.value) {
      currentAddress.value = '';
      currentAddress.refresh();
    }
    addressesList.value.removeAt(index);
    addressesList.refresh();
  }

  void tapOnAddress(PickupAddress pickupAddress) {
    orderService.pickupAddressId.value = pickupAddress.id;
    orderService.currentAddress.value = pickupAddress.name.getOrElse();
    Get.back();
  }
}
