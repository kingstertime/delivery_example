import 'package:get/get.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class AppDrawerController extends StatexController {
  AppDrawerController(
      {ConfigService? configService,
      UserInfoService? userInfoService,
      AuthService? authService})
      : configService = configService ?? Get.find(),
        userInfoService = userInfoService ?? Get.find(),
        authService = authService ?? Get.find();

  final AuthService authService;

  final ConfigService configService;

  final UserInfoService userInfoService;

  GetRxDecorator<UserInfo> get userInfo => userInfoService.userInfo;

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  GetRxDecorator<Config> get config => configService.lateConfig;

  GetRxDecorator<City> get currentCity => configService.currentCity;

  static const deliverestUrl = "https://deliverest.io";

  void logout() {
    authService.logout();
  }

  Future<void> openDeliverestLink() async {
    if (!await launchUrl(Uri.parse(deliverestUrl),
        mode: LaunchMode.externalApplication)) {
      throw 'Проблема с открытием ссылки $deliverestUrl';
    }
  }
}
