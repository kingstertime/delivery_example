import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/ui/screens/favorites/favorites_service.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:superdostavka/ui/screens/menu/menu_screen.dart';
import 'package:superdostavka/ui/screens/menu/menu_service.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';
import 'package:vfx_flutter_common/getx_helpers.dart';

class PositionMock {
  PositionMock(
      {required this.name,
      required this.description,
      required this.price,
      required this.modifications,
      required this.info,
      required this.imgPath,
      required this.id});

  final int id;
  final String name;
  final String description;
  final int price;
  final String info;
  final String imgPath;
  final List<Modification> modifications;
}

class Modification {
  Modification(
      {required this.name, required this.description, required this.price});

  final String name;
  final String description;
  final int price;
}

class MenuScreenController extends StatexController with StreamSubscriberMixin {
  MenuScreenController({
    MenuService? menuService,
    FavoritesService? favoritesService,
    AuthService? authService,
  })  : service = menuService ?? Get.find(),
        favoritesService = favoritesService ?? Get.find(),
        authService = authService ?? Get.find();

  final AuthService authService;

  final FavoritesService favoritesService;

  final MenuService service;

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  GetRxDecoratorInt get cartSum => service.cartService.sum;

  GetRxDecorator<CartPositions> get cartPositions =>
      service.cartService.positions;

  GetRxDecorator<Catalog> get catalog => service.catalog;

  GetRxDecoratorBool get isLoading => service.isLoading;

  GetRxDecoratorBool get configLoading => service.configLoading;

  GetRxDecorator<Config> get config => service.config;

  final tabPressScrollRunning = BehaviorSubject<bool>.seeded(false);

  var scrollController = AutoScrollController();

  final scrollItemVisibility = PublishSubject<VisibilityInfoWrapper>();

  late TabController tabController;

  void addToCart(Position position) {
    service.cartService.addToCart(position);
  }

  void removeFromCart(Position position) =>
      service.cartService.removeFromCart(position);

  @override
  void onReady() {
    super.onReady();
    // service.getCatalog();
  }

  GetRxDecoratorBool isFavorite(Position position) {
    return favoritesService.isFavorite(position);
  }

  void onFavoriteTap(Position position) {
    favoritesService.favoriteTap(position);
    catalog.refresh();
  }

  Future<void> onRefresh() async {
    service.onRefresh();
  }

  @override
  void onWidgetInitState() {
    super.onWidgetInitState();
    scrollController = AutoScrollController();
    subscribeIt(tabPressScrollRunning
        .delay(const Duration(milliseconds: 500))
        .switchMap<VisibilityInfoWrapper>(
            (isRunning) => isRunning ? NeverStream() : scrollItemVisibility)
        .listen((infoWrapper) {
      final currentOffset = scrollController.offset;
      final ctx = scrollController.tagMap[infoWrapper.index]?.context;
      if (ctx != null) {
        final revealedOffset = _offsetToRevealInViewport(ctx, 0.0);
        final localTabController = tabController;
        final shiftedCurrentOffset = currentOffset + 80;
        if (shiftedCurrentOffset > revealedOffset.offset &&
            shiftedCurrentOffset <
                revealedOffset.offset + infoWrapper.info.size.height &&
            localTabController.index != infoWrapper.index) {
          localTabController.animateTo(infoWrapper.index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut);
        }
      }
    }));
  }

  RevealedOffset _offsetToRevealInViewport(BuildContext ctx, double alignment) {
    final renderBox = ctx.findRenderObject()!;
    assert(Scrollable.of(ctx) != null);
    final RenderAbstractViewport viewport =
        RenderAbstractViewport.of(renderBox)!;
    final revealedOffset = viewport.getOffsetToReveal(renderBox, alignment);
    return revealedOffset;
  }

  @override
  void onClose() {
    debugPrint('tut)');
    scrollController.dispose();
    scrollItemVisibility.close();
    super.onClose();
  }
}
