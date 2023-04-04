import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:superdostavka/core/safe_coding/src/either.dart';
import 'package:superdostavka/core/safe_coding/src/unit.dart';
import 'package:superdostavka/domain/core/value_validators.dart';

import 'common_interfaces.dart';
import 'failures.dart';

/// Базовый класс TypeDD
@immutable
abstract class ValueObject<T> implements IValidatable {
  const ValueObject(this.failureTag);

  final String? failureTag;

  Either<ValueFailure<T>, T> get value;

  /// Для упрощения возврата дефолтного значения в наследниках
  /// можно переопределить
  T getOrElse(T defValue) {
    return value.getOrElse(() => defValue);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool isValid() {
    return value.isRight();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

////////////////////////////////////////////////////////////////////////////////

/// Просто непустая строка, сверка только на наличие
class NonEmptyString extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory NonEmptyString(String input, {String? failureTag}) {
    return NonEmptyString._(
      parseIsNotEmpty(input, failureTag: failureTag),
      failureTag,
    );
  }

  @override
  String getOrElse([String defValue = '']) {
    return super.getOrElse(defValue);
  }

  factory NonEmptyString.empty() {
    const tag = '';
    return NonEmptyString._(
        parseIsNotEmpty('', failureTag: 'Empty NonEmptyString'), tag);
  }

  factory NonEmptyString.asMessage(String input) {
    const tag = 'message';
    return NonEmptyString._(parseIsNotEmpty(input, failureTag: tag), tag);
  }

  factory NonEmptyString.asLanguage(String input) {
    const tag = 'language';
    return NonEmptyString._(parseIsNotEmpty(input, failureTag: tag), tag);
  }

  const NonEmptyString._(this.value, String? failureTag) : super(failureTag);
}

/// Упрощение для [NonEmptyString]
/// Вместо `NonEmptyString('string')` -> 'string'.nonEmpty
extension NonEmptyStringX on String {
  NonEmptyString get nonEmpty => NonEmptyString(this);
}

/// DDD-Объект для номера телефона.
class Phone extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Phone(String input, {String? failureTag}) {
    return Phone._(_parse(input, failureTag: failureTag), failureTag);
  }

  /// Валидирование строки, как [Phone]
  static Either<ValueFailure<String>, String> _parse(String input,
      {String? failureTag}) {
    // const phoneRegex = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    const phoneRegex = r'^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$';
    if (input.isNotEmpty && RegExp(phoneRegex).hasMatch(input)) {
      return right(input);
    } else {
      return left(ValueFailure.invalidPhone(
          failedValue: input, failureTag: failureTag));
    }
  }

  const Phone._(this.value, String? failureTag) : super(failureTag);
}

/// DDD-Объект для пароля.
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input, {String? failureTag}) {
    return Password._(_parse(input, failureTag: failureTag), failureTag);
  }

  /// Валидирование строки, как [Phone]
  static Either<ValueFailure<String>, String> _parse(String input,
      {String? failureTag}) {
    // const passwordRegex = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    if (input.isNotEmpty && input.length > 5) {
      return right(input);
    } else {
      return left(ValueFailure.invalidPassword(
          failedValue: input, failureTag: failureTag));
    }
  }

  const Password._(this.value, String? failureTag) : super(failureTag);
}

/// Просто непустая строка, сверка только на наличие
class NonEmptyList<T> extends ValueObject<List<T>> {
  @override
  final Either<ValueFailure<List<T>>, List<T>> value;

  factory NonEmptyList(List<T> input, {String? failureTag}) {
    return NonEmptyList._(
      _parseIsNotEmpty(input, failureTag: failureTag),
      failureTag,
    );
  }

  /// дефолтный пустой лист по умолчанию object.getOrElse()
  @override
  List<T> getOrElse([List<T> defValue = const []]) {
    return super.getOrElse(defValue);
  }

  static const NonEmptyList empty = NonEmptyList._(
    Left(ValueFailure.empty(failedValue: [], failureTag: '')),
    '',
  );

  const NonEmptyList._(this.value, String? failureTag) : super(failureTag);

  /// Проверка на то, что строка непустая
  static Either<ValueFailure<List<T>>, List<T>> _parseIsNotEmpty<T>(
      List<T> input,
      {String? failureTag}) {
    if (input.isNotEmpty) {
      return right(input);
    }
    return left(ValueFailure.empty(failedValue: [], failureTag: failureTag));
  }
}

extension ListX<T> on List<T> {
  NonEmptyList<T> get nonEmpty => NonEmptyList<T>(this);
}

extension NonEmptyListX<T> on NonEmptyList<T> {
  List<T> get asList => value.fold((l) => [], (r) => r.map((e) => e).toList());
}

/// Просто непустая карта, сверка только на наличие
class NonEmptyMap<K, V> extends ValueObject<Map<K, V>> {
  @override
  final Either<ValueFailure<Map<K, V>>, Map<K, V>> value;

  factory NonEmptyMap(Map<K, V> input, {String? failureTag}) {
    return NonEmptyMap._(
      _parseIsNotEmpty(input, failureTag: failureTag),
      failureTag,
    );
  }

  @override
  Map<K, V> getOrElse([Map<K, V> defValue = const {}]) {
    return super.getOrElse(defValue);
  }

  const NonEmptyMap._(this.value, String? failureTag) : super(failureTag);

  /// Проверка на то, что строка непустая
  static Either<ValueFailure<Map<K, V>>, Map<K, V>> _parseIsNotEmpty<K, V>(
      Map<K, V> input,
      {String? failureTag}) {
    if (input.isNotEmpty) {
      return right(input);
    }
    return left(ValueFailure.empty(failedValue: {}, failureTag: failureTag));
  }
}

extension NonEmptyMapX<K, V> on Map<K, V> {
  NonEmptyMap<K, V> get nonEmpty => NonEmptyMap<K, V>(this);
}
