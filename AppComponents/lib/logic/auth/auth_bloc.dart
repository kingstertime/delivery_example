import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/api_key/api_key.dart';
import 'package:superdostavka/domain/code/code.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  static AuthBloc makeInstance() {
    return _instance ??= AuthBloc._();
  }

  static AuthBloc? _instance;
  AuthBloc._() : super(const AuthState.initial()) {
    on<_AuthEventGenerateApiKey>(_generateApiKey);
    on<_AuthEventSendCode>(_sendCode);
    on<_AuthEventSaveApiKey>(_saveApiKey);
    on<_AuthEventGetApiKey>(_getApiKey);
  }

  Future _sendCode(_AuthEventSendCode event, Emitter<AuthState> emit) async {
    emit(const AuthState.sentCode(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.sendCode(event.phone);
    emit(AuthState.sentCode(StateData.result(result)));
  }

  Future _generateApiKey(
      _AuthEventGenerateApiKey event, Emitter<AuthState> emit) async {
    emit(const AuthState.generatedApiKey(StateData.loading()));
    final repo = Repository.makeInstance();
    final result =
        await repo.generateApiKey(event.phone, event.code, event.cityId);
    emit(AuthState.generatedApiKey(StateData.result(result)));
  }

  Future _saveApiKey(
      _AuthEventSaveApiKey event, Emitter<AuthState> emit) async {
    emit(const AuthState.savedApiKey(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.saveApiKey(event.apiKey);
    emit(AuthState.savedApiKey(StateData.result(result)));
  }

  Future _getApiKey(_AuthEventGetApiKey event, Emitter<AuthState> emit) async {
    emit(const AuthState.gotApiKey(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getApiKey();
    emit(AuthState.gotApiKey(StateData.result(result)));
  }
}

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent() = _AuthEvent;

  const factory AuthEvent.sendCode(int phone) = _AuthEventSendCode;

  const factory AuthEvent.generateApiKey(int phone, int code, int cityId) =
      _AuthEventGenerateApiKey;

  const factory AuthEvent.saveApiKey(ApiKey apiKey) = _AuthEventSaveApiKey;

  const factory AuthEvent.getApiKey() = _AuthEventGetApiKey;
}

/// Передается внутреннее подсостояние типа [AuthStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthStateInitial;

  const factory AuthState.sentCode(
      StateData<Either<ExtendedErrors, Code>> data) = _AuthStateSentCode;

  const factory AuthState.generatedApiKey(
          StateData<Either<ExtendedErrors, ApiKey>> data) =
      _AuthStateGenerateApiKey;

  const factory AuthState.savedApiKey(
      StateData<Either<ExtendedErrors, ApiKey>> data) = _AuthStateSavedApiKey;

  const factory AuthState.gotApiKey(
      StateData<Either<ExtendedErrors, ApiKey>> data) = _AuthStateGotApiKey;
}
