import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/config/config.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'config_bloc.freezed.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static ConfigBloc makeInstance() {
    return _instance ??= ConfigBloc._();
  }

  static ConfigBloc? _instance;
  ConfigBloc._() : super(const ConfigState.initial()) {
    on<_ConfigEventGetConfig>(_getConfig);
    on<_ConfigEventGetCity>(_getCity);
    on<_ConfigEventSaveCity>(_saveCity);
  }

  Future _getConfig(
      _ConfigEventGetConfig event, Emitter<ConfigState> emit) async {
    emit(const ConfigState.gotConfig(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getConfig();
    emit(ConfigState.gotConfig(StateData.result(result)));
  }

  Future _getCity(_ConfigEventGetCity event, Emitter<ConfigState> emit) async {
    emit(const ConfigState.gotCity(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getCity();
    emit(ConfigState.gotCity(StateData.result(result)));
    emit(const ConfigState.alreadyGotCity());
  }

  Future _saveCity(
      _ConfigEventSaveCity event, Emitter<ConfigState> emit) async {
    emit(const ConfigState.savedCity(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.saveCity(event.city);
    emit(ConfigState.savedCity(StateData.result(result)));
  }
}

@freezed
class ConfigEvent with _$ConfigEvent {
  const factory ConfigEvent() = _ConfigEvent;

  const factory ConfigEvent.getConfig() = _ConfigEventGetConfig;

  const factory ConfigEvent.saveCity(City city) = _ConfigEventSaveCity;

  const factory ConfigEvent.getCity() = _ConfigEventGetCity;
}

/// Передается внутреннее подсостояние типа [ConfigStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class ConfigState with _$ConfigState {
  const factory ConfigState.initial() = _ConfigStateInitial;

  const factory ConfigState.gotConfig(
      StateData<Either<ExtendedErrors, Config>> data) = _ConfigStateGotConfig;

  const factory ConfigState.savedCity(
      StateData<Either<ExtendedErrors, City>> data) = _ConfigStateSavedCity;

  const factory ConfigState.gotCity(
      StateData<Either<ExtendedErrors, City>> data) = _ConfigStateGotCity;

  const factory ConfigState.alreadyGotCity() = _ConfigStateAlreadyGotCity;
}
