import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';

part 'state_data.freezed.dart';

@freezed
class StateData<T extends Either> with _$StateData<T> {
  const factory StateData.initial() = _StateDataInitial<T>;

  const factory StateData.loading() = _StateDataLoading<T>;

  const factory StateData.result(T data) = _StateDataResult<T>;
}
