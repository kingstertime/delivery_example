import 'package:flutter/material.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/cart/cart_bloc.dart';
import 'package:superdostavka/logic/catalog/catalog_bloc.dart';
import 'package:superdostavka/logic/config/config_bloc.dart';
import 'package:get/get.dart';
import 'package:superdostavka/routing.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class ConfigService extends GetxService with StreamSubscriberMixin {
  ConfigService(
      {ConfigBloc? bloc, CartService? cartService, CatalogBloc? catalogBloc})
      : configBloc = bloc ?? ConfigBloc.makeInstance(),
        cartService = cartService ?? Get.find(),
        catalogBloc = catalogBloc ?? CatalogBloc.makeInstance();

  final CatalogBloc catalogBloc;

  final ConfigBloc configBloc;

  final CartService cartService;

  final config = GetRxDecorator<Either<ExtendedErrors, Config>>(
      left(ExtendedErrors.empty()));

  late GetRxDecorator<Config> lateConfig;

  GetRxDecoratorBool isLoading = false.obsDeco();

  final currentCity = City.empty.obsDeco();

  @override
  void onInit() {
    super.onInit();
    fetchConfig();
    fetchCity();
    subscribeIt(configBloc.stream.listen(_processState));
  }

  void chooseCity(City city) {
    currentCity.value = city;
    configBloc.add(ConfigEvent.saveCity(city));
    cartService.cartBloc.add(CartEvent.saveCartMap(CartPositions(map: {})));
    catalogBloc.add(CatalogEvent.getCatalog(city.id));
    Get.toNamed(AppRoutes.menu);
  }

  void fetchCity() {
    configBloc.add(const ConfigEvent.getCity());
  }

  void fetchConfig() {
    configBloc.add(const ConfigEvent.getConfig());
  }

  void _processState(ConfigState state) {
    state.maybeWhen(
      gotConfig: (d) {
        isLoading(true);
        d.maybeWhen(
          result: (r) {
            isLoading(false);
            config(r);
            r.fold(
              (l) => debugPrint('error: $l'),
              (r) {
                lateConfig = r.obsDeco();
                if (lateConfig.value.cities.length == 1) {
                  currentCity.value = lateConfig.value.cities[0];
                  catalogBloc
                      .add(CatalogEvent.getCatalog(currentCity.value.id));
                }
              },
            );
          },
          orElse: () {},
        );
      },
      gotCity: (d) {
        isLoading(true);
        d.maybeWhen(
            result: (r) {
              isLoading(false);
              r.fold((l) => debugPrint('error: $l'), (r) {
                currentCity.value = r;
                catalogBloc.add(CatalogEvent.getCatalog(currentCity.value.id));
              });
            },
            orElse: () {});
      },
      orElse: () {},
    );
  }
}
