import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/utils/position_with_count.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  static CartBloc makeInstance() {
    return _instance ??= CartBloc._();
  }

  static CartBloc? _instance;
  CartBloc._() : super(const CartState.initial()) {
    on<_CartEventGetCartMap>(_getCartMap);
    on<_CartEventSaveCartMap>(_saveCartMap);
  }

  Future _getCartMap(
      _CartEventGetCartMap event, Emitter<CartState> emit) async {
    emit(const CartState.gotCartMap(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getCartPositions();
    emit(CartState.gotCartMap(StateData.result(result)));
  }

  Future _saveCartMap(
      _CartEventSaveCartMap event, Emitter<CartState> emit) async {
    emit(const CartState.savedCartMap(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.postCartPositions(event.data);
    emit(CartState.savedCartMap(StateData.result(result)));
  }
}

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent() = _CartEvent;

  const factory CartEvent.getCartMap() = _CartEventGetCartMap;

  const factory CartEvent.saveCartMap(CartPositions data) =
      _CartEventSaveCartMap;
}

/// Передается внутреннее подсостояние типа [CartStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _CartStateInitial;

  const factory CartState.gotCartMap(
          StateData<Either<ExtendedErrors, CartPositions>> data) =
      _CartStateGotCartMap;

  const factory CartState.savedCartMap(
          StateData<Either<ExtendedErrors, CartPositions>> data) =
      _CartStateSaveCartMap;
}
