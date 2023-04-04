import 'package:get/get.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/ui/screens/cart/cart_service.dart';
import 'package:superdostavka/ui/screens/menu/menu_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

class GiftScreenController extends StatexController with StreamSubscriberMixin {
  GiftScreenController({
    MenuService? menuService,
    CartService? cartService,
  })  : menuService = menuService ?? Get.find(),
        cartService = cartService ?? Get.find();

  final CartService cartService;

  final MenuService menuService;

  GetRxDecoratorInt get cartSum => cartService.sum;

  final giftMap = <String, List<GiftPosition>>{}.obsDeco();

  GetRxDecorator<GiftPosition> get currentGift => cartService.currentGift;

  GetRxDecorator<Catalog> get catalog => menuService.catalog;

  @override
  void onInit() {
    super.onInit();
    fillGiftMap(catalog.value);
    subscribeIt(catalog.stream.listen((catalog) {
      fillGiftMap(catalog);
    }));
  }

  void fillGiftMap(Catalog catalog) {
    giftMap.value.clear();
    for (var element in catalog.giftPositions) {
      final value = element.value.getOrElse();
      if (!giftMap.value.containsKey(value)) {
        giftMap.value[value] = [element];
      } else {
        final giftList = giftMap.value[value] as List<GiftPosition>;
        giftList.add(element);
        giftMap.value[value] = giftList;
      }
    }
    giftMap.refresh();
  }

  void onGiftTap(GiftPosition position) {
    if (currentGift.value.id == position.id) {
      currentGift.value = GiftPosition.empty;
    } else {
      currentGift.value = position;
    }
    Get.back();
  }

  String getMaxGiftSum() {
    for (int i = 0; i < giftMap.value.keys.length; i++) {
      final currentElem = giftMap.value.keys.elementAt(i);
      if (cartSum.value < int.parse(currentElem)) {
        if (i == 0) {
          return 'Вам не хватает ${int.parse(currentElem) - cartSum.value} рублей до получения подарка';
        }
        return 'Вы можете выбрать подарок от суммы ${int.parse(giftMap.value.keys.elementAt(i - 1))} рублей';
      }
    }
    return 'Вы можете выбрать подарок от суммы ${int.parse(giftMap.value.keys.last)} рублей';
  }
}
