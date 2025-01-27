import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  // const factory ValueFailure.empty2({
  //   required T failedValue,
  //   @Default('no_tag') String failureTag,
  // }) = ValueFailureEmpty2<T>;
  const factory ValueFailure.empty({
    required T failedValue,
    String? failureTag,
  }) = ValueFailureEmpty<T>;
  const factory ValueFailure.invalidPhone({
    required T failedValue,
    String? failureTag,
  }) = ValueFailureInvalidEmail<T>;
  const factory ValueFailure.invalidCode({
    required T failedValue,
    String? failureTag,
  }) = ValueFailureInvalidCode<T>;
  const factory ValueFailure.invalidPassword({
    required T failedValue,
    String? failureTag,
  }) = ValueFailureInvalidPassword<T>;
  const factory ValueFailure.tooShort({
    required T failedValue,
    String? failureTag,
    required int minLength,
  }) = ValueFailureTooShort<T>;
  const factory ValueFailure.tooLong({
    required T failedValue,
    String? failureTag,
    required int maxLength,
  }) = ValueFailureTooLong<T>;

  /// Когда значение точно не равно ожидаемой длине
  const factory ValueFailure.lengthNotEqual({
    required T failedValue,
    String? failureTag,
    required int length,
  }) = ValueFailureLengthNotEqual<T>;

  // TODO(vvk): надо проверить
  /// Когда значение точно не равно ожидаемому
  const factory ValueFailure.notMatch({
    required T failedValue,
    String? failureTag,
    required T matcher,
  }) = ValueFailureNotMatch<T>;
}
