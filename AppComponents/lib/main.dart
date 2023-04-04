import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:superdostavka/app_config.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/logic/repository.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/actions/actions_service.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/screens/city/city_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:superdostavka/ui/screens/login/user_info_service.dart';
import 'package:superdostavka/ui/shared/colors.dart';
import 'package:superdostavka/ui/shared/widgets/app_scaffold/src/app_scaffold_service.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

import 'ui/screens/create_order/create_order_service.dart';
import 'ui/screens/favorites/favorites_service.dart';
import 'ui/screens/menu/menu_service.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await AppConfig().load();

  debugPrint('$now: main: AppConfig.IS_PRODUCTION = ${AppConfig.isProduction}');

  await _initServices();

  final repository = Repository.makeInstance();

  final config = await repository.getConfig();

  var severalCities = config.fold((l) => false, (r) => r.cities.length > 1);

  final cityWithErrors = await repository.getCity();

  final cityNotChosen = cityWithErrors.fold((l) => true, (r) => false);

  var showCityScreen = false;

  if (severalCities && cityNotChosen) {
    showCityScreen = true;
  }

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).whenComplete(() async {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.purple,
        statusBarIconBrightness: Brightness.light, // цвет иконок
        systemNavigationBarColor: AppColors.purple,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  });
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ru'), Locale('en')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ru'),
      child: App(
        showCityScreen: showCityScreen,
      )));
}

class App extends StatelessWidget {
  const App({Key? key, required this.showCityScreen}) : super(key: key);

  final bool showCityScreen;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          initialRoute: showCityScreen ? AppRoutes.city : AppRoutes.menu,
          getPages: AppRoutes().routes,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: const Locale('ru'),
          themeMode: ThemeMode.light,
          theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: AppColors.purple,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              colorScheme: ColorScheme.fromSeed(
                  seedColor: AppColors.purple, primary: AppColors.purple),
              dividerColor: Colors.transparent
              // primarySwatch: AppColors.primary
              ),
        );
      },
    );
  }
}

Future _initServices() async {
  Get
    ..lazyPut(() => UserInfoService())
    ..lazyPut(() => AuthService())
    ..put(CartService())
    ..lazyPut(() => ConfigService())
    ..lazyPut(() => AppScaffoldService())
    ..lazyPut(() => MenuService())
    ..lazyPut(() => FavoritesService())
    ..lazyPut(() => ActionsService())
    ..lazyPut(() => CityService())
    ..lazyPut(() => CreateOrderService());
}
