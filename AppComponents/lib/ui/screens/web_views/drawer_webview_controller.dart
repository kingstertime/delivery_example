import 'package:get/get.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class DrawerWebViewController extends StatexController {
  List<String> arguments = [];

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments.runtimeType == List<String>) {
      arguments = Get.arguments;
    } else {
      arguments = ['', ''];
    }
  }
}
