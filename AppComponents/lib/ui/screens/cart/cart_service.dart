import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/core/utils/stream_subscriber.dart';
import 'package:superdostavka/domain/catalog/catalog.dart';
import 'package:superdostavka/logic/cart/cart_bloc.dart';
import 'package:superdostavka/ui/screens/login/auth_service.dart';
import 'package:superdostavka/ui/shared/app_alert.dart';
import 'package:vfx_flutter_common/get_rx_decorator.dart';

class CartService extends GetxService with StreamSubscriberMixin {
  CartService({CartBloc? cartBloc, AuthService? authService})
      : cartBloc = cartBloc ?? CartBloc.makeInstance(),
        authService = authService ?? Get.find();

  final AuthService authService;

  final sum = 0.obsDeco();

  final positions = CartPositions(map: <int, PositionWithCount>{}).obsDeco();

  final CartBloc cartBloc;

  final isLoading = false.obsDeco();

  final currentGift = GiftPosition.empty.obsDeco();

  final bonusesToPay = 0.obsDeco();

  GetRxDecoratorBool get isAuthenticated => authService.isAuthenticated;

  @override
  void onInit() {
    super.onInit();
    cartBloc.stream.listen(_processState);
    cartBloc.add(const CartEvent.getCartMap());
    subscribeIt(positions.stream.listen((event) {
      sum.value = 0;
      for (var entry in event.map.entries) {
        sum.value =
            sum() + (entry.value.position.price.toInt() * entry.value.count);
      }
      if (sum.value <
          (int.tryParse(currentGift.value.value.getOrElse()) ?? 0)) {
        appAlert(
            value: 'Подарок от шефа теперь не доступен', color: Colors.red);
        currentGift.value = GiftPosition.empty;
      }
    }));
  }

  void addToCart(Position position) {
    if (positions.value.map.containsKey(position.id)) {
      final positionWithCount = positions.value.map[position.id];
      positionWithCount?.count = positionWithCount.count + 1;
      if (positionWithCount != null) {
        positions.value.map[position.id] = positionWithCount;
        sum.value = sum() + (positionWithCount.position.price).toInt();
      }
    } else {
      positions.value.map[position.id] =
          PositionWithCount(position: position, count: 1);
      sum.value = sum() + position.price.toInt();
    }
    cartBloc.add(CartEvent.saveCartMap(positions.value));
    positions.refresh();
  }

  void removeFromCart(Position position) {
    if (positions.value.map.containsKey(position.id)) {
      final positionWithCount = positions.value.map[position.id];
      positionWithCount?.count = positionWithCount.count - 1;
      if (positionWithCount != null) {
        if (positionWithCount.count > 0) {
          positions.value.map[position.id] = positionWithCount;
          sum.value = sum() - positionWithCount.position.price.toInt();
        } else {
          positions.value.map.remove(position.id);
          sum.value = sum() - position.price.toInt();
        }
      }
    }
    cartBloc.add(CartEvent.saveCartMap(positions.value));
    positions.refresh();
  }

  void removeAllPositions() {
    positions.value.map.clear();
    cartBloc.add(CartEvent.saveCartMap(positions.value));
    positions.refresh();
  }

  void _processState(CartState state) {
    state.maybeWhen(
        gotCartMap: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold((l) {
                  debugPrint('ERROR: $l');
                }, (r) {
                  positions.value = r;
                  debugPrint('tut: $r');
                  positions.refresh();
                });
              },
              orElse: () {});
        },
        savedCartMap: (d) {
          d.maybeWhen(
              loading: () => isLoading.value = true,
              result: (r) {
                isLoading.value = false;
                r.fold((l) {
                  debugPrint('ERROR: $l');
                }, (r) {
                  positions.value = r;
                  positions.refresh();
                });
              },
              orElse: () {});
        },
        orElse: () {});
  }
}
