import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'failures.dart';

/// Валидирование строки, как EMail
Either<ValueFailure<String>, String> validatePhone(String input,
    {String? failureTag}) {
  return right(input);
}

///
Either<ValueFailure<String>, String> validateCode(String input,
    {required String failureTag}) {
  const length = 4;

  if (input.length == length) {
    return right(input);
  } else {
    return left(
        ValueFailure.invalidCode(failedValue: input, failureTag: failureTag));
  }
}

Either<ValueFailure<String>, String> parseLengthNotEqual(
    String input, int length,
    {required String failureTag}) {
  if (input.length == length) {
    return right(input);
  }
  return left(ValueFailure.lengthNotEqual(
      failedValue: input, length: length, failureTag: failureTag));
}

Either<ValueFailure<String>, String> parseTooShort(String input, int minLength,
    {required String failureTag}) {
  if (input.length >= minLength) {
    return right(input);
  }
  return left(ValueFailure.tooShort(
      failedValue: input, minLength: minLength, failureTag: failureTag));
}

/// Проверка на то, что строка непустая
Either<ValueFailure<String>, String> parseIsNotEmpty(String input,
    {String? failureTag}) {
  if (input.isNotEmpty) {
    return right(input);
  }
  return left(ValueFailure.empty(failedValue: '', failureTag: failureTag));
}
