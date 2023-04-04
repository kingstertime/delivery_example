import 'package:get/get.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/logic/core/config_service.dart';
import 'package:superdostavka/ui/screens/favorites/favorites_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class FavoritesScreenController extends StatexController {
  FavoritesScreenController({
    ConfigService? configService,
    FavoritesService? favoritesService,
  })  : configService = configService ?? Get.find(),
        favoritesService = favoritesService ?? Get.find();

  final FavoritesService favoritesService;

  final ConfigService configService;

  GetRxDecoratorInt get cartSum => favoritesService.cartService.sum;

  GetRxDecorator<CartPositions> get cartPositions =>
      favoritesService.cartService.positions;

  void addToCart(Position position) {
    favoritesService.cartService.addToCart(position);
  }

  void removeFromCart(Position position) =>
      favoritesService.cartService.removeFromCart(position);

  GetRxDecorator<Config> get config => configService.lateConfig;

  Structure get favoritesStructure =>
      config.value.deliverySettings.structure.firstWhereOrNull(
          (element) => element.slug.getOrElse() == 'favorites') ??
      Structure.empty;

  GetRxDecorator<List<Position>> get favoritesPositions =>
      favoritesService.favoritePositions;

  GetRxDecoratorBool isFavorite(Position position) =>
      favoritesService.isFavorite(position);

  void onFavoriteTap(Position position) =>
      favoritesService.favoriteTap(position);
}
