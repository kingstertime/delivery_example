import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/domain/core/value_objects.dart';

part 'action.freezed.dart';

@freezed
class Actions with _$Actions {
  const factory Actions({
    required NonEmptyString modified,
    required List<Action> actions,
  }) = _Actions;

  static Actions empty = Actions(modified: ''.nonEmpty, actions: []);
}

@freezed
class Action with _$Action {
  const factory Action({
    required NonEmptyString name,
    required NonEmptyString shortDescription,
    required NonEmptyString description,
    required NonEmptyString image,
  }) = _Action;
}
