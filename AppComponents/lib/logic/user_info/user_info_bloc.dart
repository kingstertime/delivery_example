import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/domain/core/extended_errors.dart';
import 'package:superdostavka/domain/user_info/user_info.dart';
import 'package:superdostavka/logic/core/state_data.dart';
import 'package:superdostavka/logic/repository.dart';

part 'user_info_bloc.freezed.dart';

class UserInfoBloc extends Bloc<UserInfoEvent, UserInfoState> {
  static UserInfoBloc makeInstance() {
    return _instance ??= UserInfoBloc._();
  }

  static UserInfoBloc? _instance;
  UserInfoBloc._() : super(const UserInfoState.initial()) {
    on<_UserInfoEventGetUserInfo>(_getUserInfo);
  }
  Future _getUserInfo(
      _UserInfoEventGetUserInfo event, Emitter<UserInfoState> emit) async {
    emit(const UserInfoState.gotUserInfo(StateData.loading()));
    final repo = Repository.makeInstance();
    final result = await repo.getUserInfo(event.cityId);
    emit(UserInfoState.gotUserInfo(StateData.result(result)));
  }
}

@freezed
class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent() = _UserInfoEvent;

  const factory UserInfoEvent.getUserInfo(int cityId) =
      _UserInfoEventGetUserInfo;
}

/// Передается внутреннее подсостояние типа [UserInfoStateData<T>],
/// каждое из которых
/// может содержать динамику.
@freezed
class UserInfoState with _$UserInfoState {
  const factory UserInfoState.initial() = _UserInfoStateInitial;

  const factory UserInfoState.gotUserInfo(
          StateData<Either<ExtendedErrors, UserInfo>> data) =
      _UserInfoStateGotUserInfo;
}
