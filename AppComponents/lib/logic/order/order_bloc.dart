import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/data/order/order_body.dart';
import 'package:superdostavka/data/validate_order/validate_order_body.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/order/order_response.dart';
import 'package:superdostavka/domain/validate_order/validate_order_response.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  static OrderBloc makeInstance() {
    return _instance ??= OrderBloc._();
  }

  static OrderBloc? _instance;
  OrderBloc._() : super(const OrderState.initial()) {
    on<_OrderEventSendOrder>(_sendOrder);
    on<_OrderEventValidatedOrder>(_validateOrder);
  }

  Future _sendOrder(
      _OrderEventSendOrder event, Emitter<OrderState> emit) async {
    emit(const OrderState.sentOrder(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.sendOrder(event.body);
    emit(OrderState.sentOrder(StateData.result(result)));
  }

  Future _validateOrder(
      _OrderEventValidatedOrder event, Emitter<OrderState> emit) async {
    emit(const OrderState.validated(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.sendValidateOrder(event.body);
    emit(OrderState.validated(StateData.result(result)));
  }
}

@freezed
class OrderEvent with _$OrderEvent {
  const factory OrderEvent() = _OrderEvent;

  const factory OrderEvent.sendOrder(OrderBody body) = _OrderEventSendOrder;

  const factory OrderEvent.validateOrder(ValidateOrderBody body)  = _OrderEventValidatedOrder;
}

/// Передается внутреннее подсостояние типа [OrderStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _OrderStateInitial;

  const factory OrderState.sentOrder(
          StateData<Either<ExtendedErrors, OrderResponse>> data) =
      _OrderStateSentOrder;

  const factory OrderState.validated(
      StateData<Either<ExtendedErrors, ValidateOrderResponse>> data
      ) = _OrderStateValidate;
}
