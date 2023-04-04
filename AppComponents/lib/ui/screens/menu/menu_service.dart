import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/catalog/catalog_bloc.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class MenuService extends GetxService with StreamSubscriberMixin {
  MenuService(
      {CatalogBloc? bloc,
      ConfigService? configService,
      CartService? cartService})
      : _bloc = bloc ?? CatalogBloc.makeInstance(),
        configService = configService ?? Get.find(),
        cartService = cartService ?? Get.find();

  final CartService cartService;

  final ConfigService configService;

  final CatalogBloc _bloc;

  final catalog = Catalog.emptyCatalog.obsDeco();

  final isLoading = false.obsDeco();

  GetRxDecoratorBool get configLoading => configService.isLoading;

  GetRxDecorator<Either<ExtendedErrors, Config>> get configWithError =>
      configService.config;

  GetRxDecorator<Config> get config => configService.lateConfig;

  @override
  void onInit() async {
    super.onInit();
    /*SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();*/
    _bloc.stream.listen(_processCatalog);
  }

  void getCatalog() {
    _bloc.add(CatalogEvent.getCatalog(configService.currentCity.value.id));
  }

  Future onRefresh() async {
    getCatalog();
  }

  void _processCatalog(CatalogState state) {
    state.maybeWhen(
        gotCatalog: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (result) {
                isLoading.value = false;
                result.fold((l) {
                  debugPrint('ERROR: $l');
                }, (r) {
                  catalog.value = r;
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
