import 'package:get/get.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class CartScreenController extends StatexController {
  CartScreenController({CartService? cartService})
      : cartService = cartService ?? Get.find();

  final CartService cartService;

  GetRxDecorator<CartPositions> get positions => cartService.positions;

  GetRxDecoratorInt get cartSum => cartService.sum;

  GetRxDecorator<GiftPosition> get currentGift => cartService.currentGift;

  GetRxDecoratorInt get bonusesToPay => cartService.bonusesToPay;

  void addToCart(Position position) => cartService.addToCart(position);

  void removeFromCart(Position position) =>
      cartService.removeFromCart(position);

  void removeAllPositions() => cartService.removeAllPositions();
}
