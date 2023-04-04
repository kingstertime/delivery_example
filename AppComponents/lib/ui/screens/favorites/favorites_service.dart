import 'package:get/get.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class FavoritesService extends GetxService {
  FavoritesService({CartService? cartService})
      : cartService = cartService ?? Get.find();

  final CartService cartService;

  final GetRxDecorator<List<Position>> favoritePositions =
      <Position>[].obsDeco();

  void addToFavorite(Position position) {
    favoritePositions.value.add(position);
  }

  GetRxDecoratorBool isFavorite(Position position) =>
      favoritePositions.value.contains(position).obsDeco();

  void removeFromFavorite(Position position) {
    favoritePositions.value.remove(position);
  }

  void favoriteTap(Position position) {
    if (isFavorite(position).value) {
      removeFromFavorite(position);
      favoritePositions.refresh();
    } else {
      addToFavorite(position);
      favoritePositions.refresh();
    }
  }
}
