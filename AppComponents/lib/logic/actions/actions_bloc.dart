import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/action/action.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'actions_bloc.freezed.dart';

class ActionsBloc extends Bloc<ActionsEvent, ActionsState> {
  static ActionsBloc makeInstance() {
    return _instance ??= ActionsBloc._();
  }

  static ActionsBloc? _instance;
  ActionsBloc._() : super(const ActionsState.initial()) {
    on<_ActionsEventGetActions>(_getActions);
  }

  Future _getActions(
      _ActionsEventGetActions event, Emitter<ActionsState> emit) async {
    emit(const ActionsState.gotActions(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getAction();
    emit(ActionsState.gotActions(StateData.result(result)));
  }
}

@freezed
class ActionsEvent with _$ActionsEvent {
  const factory ActionsEvent() = _ActionsEvent;

  const factory ActionsEvent.getActions() = _ActionsEventGetActions;
}

/// Передается внутреннее подсостояние типа [ActionsStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class ActionsState with _$ActionsState {
  const factory ActionsState.initial() = _ActionsStateInitial;

  const factory ActionsState.gotActions(
          StateData<Either<ExtendedErrors, Actions>> data) =
      _ActionsStateGotActions;
}
