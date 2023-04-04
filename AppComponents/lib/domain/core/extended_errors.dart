import 'package:freezed_annotation/freezed_annotation.dart';

part 'extended_errors.freezed.dart';

part 'extended_errors.g.dart';

/// Класс отображающий сложную структуру ошибок,
/// которые могут придти с бэка.
///
@freezed
class ExtendedErrors with _$ExtendedErrors {
  const factory ExtendedErrors({
    required String error,
    required Map<String, List> errors,
    @Default({}) Map<String, List> onlyUserFieldsErrors,
  }) = _ExtendedErrors;

  const ExtendedErrors._();

  factory ExtendedErrors.simple(String error) =>
      ExtendedErrors(error: error, errors: {
        'errors': [error]
      });

  factory ExtendedErrors.empty() => const ExtendedErrors(error: '', errors: {
        'errors': ['']
      });

  factory ExtendedErrors.fromJson(Map<String, dynamic> json) =>
      _$ExtendedErrorsFromJson(json);
}

extension ExtendedErrorsX on ExtendedErrors {
  static const isDioKey = 'is_dio';

  static const dioErrorKey = 'dio_error';

  static const dioStatusCodeKey = 'dio_status_code';

  static const dioApiKey = 'dio_api';

  static const dio = 'dio';

  static const errorKey = 'error';

  static const errorsKey = 'errors';

  static const userErrorsKey = 'only_user_fields';

  bool get hasErrors => error.isNotEmpty;

  /// Основная ошибка
  String get mainErrorValue {
    return error;
  }

  /// Ошибки из листов [ExtendedErrors.errors]
  List get errorsValue {
    return errors.values.expand((e) => e).toList();
  }

  /// Ошибки из листов [ExtendedErrors.onlyUserFieldsErrors]
  List get onlyUserFieldsErrorsValue {
    return onlyUserFieldsErrors.values.expand((e) => e).toList();
  }

  /// Выборка ошибок по приоритету.
  ///
  List get smartErrorsValue {
    if (onlyUserFieldsErrorsValue.isNotEmpty) {
      return onlyUserFieldsErrorsValue;
    }
    if (errorsValue.isNotEmpty) {
      return errorsValue;
    }
    return [mainErrorValue];
  }

  bool get isDioError {
    final list = (errors[isDioKey] as List<bool>?) ?? [false];
    return list.isNotEmpty ? list.first : false;
  }

  int get dioStatusCode {
    final list = (errors[dioStatusCodeKey] as List<int>?) ?? [0];
    return list.isNotEmpty ? list.first : 0;
  }

  String get dioApi {
    final list = (errors[dioApiKey] as List<String>?) ?? [];
    return list.isNotEmpty ? list.first : '';
  }

  /// Выборка ошибок по приоритету + отладочные сообщения
  List get debugErrorsValue {
    return [...smartErrorsValue, dioApi, dioStatusCode];
  }
}

/// Парсит поле error из ответа
ExtendedErrors parseError(Map<String, dynamic> errorsMap) {
  try {
    final error = errorsMap[ExtendedErrorsX.errorKey] ?? '';
    // final error = errorsMap.containsKey(ExtendedErrorsX.errorKey) ? errorsMap[ExtendedErrorsX.errorKey] : '';

    final errorsDynamic =
        errorsMap[ExtendedErrorsX.errorsKey] as Map<String, dynamic>? ??
            <String, List>{};
    // final errorsDynamic = errorsMap.containsKey(ExtendedErrorsX.errorsKey)
    //     ? errorsMap[ExtendedErrorsX.errorsKey] as Map<String, dynamic>
    //     : <String, List>{};

    ///Если поле only_user_fields отсутствует, то собираю ошибки по полям вручную
    ///Отсеиваю ошибки, которые начинаются с dio и оставшиеся кладу в отдельную мапу onlyUserFields
    final onlyUserFields = errorsMap[ExtendedErrorsX.userErrorsKey];
    var userErrorsDynamic = <String, dynamic>{};
    if (onlyUserFields == null) {
      for (var element in errorsDynamic.entries) {
        if (!element.key.contains(ExtendedErrorsX.dio)) {
          userErrorsDynamic[element.key] = element.value;
        }
      }
    } else {
      if (onlyUserFields is List && onlyUserFields.isEmpty) {
        userErrorsDynamic = <String, List<List>>{};
      } else {
        if (onlyUserFields is Map<String, dynamic>) {
          userErrorsDynamic = onlyUserFields;
        } else {
          userErrorsDynamic = <String, List<List>>{};
        }
      }
    }
    /*final userErrorsDynamic = onlyUserFields == null
        ? errorsMap.entries.forEach((element) {
      if (!element.key.contains('dio')) {
        userErrorsDynamic[element.key] = element.value;
      }
    })
        : onlyUserFields is List && onlyUserFields.isEmpty
            ? <String, List<List>>{}
            : onlyUserFields is Map<String, dynamic>
                ? onlyUserFields
                : <String, List<List>>{};*/

    // final userErrorsDynamic = errorsMap.containsKey(ExtendedErrorsX.userErrorsKey)
    //     ? errorsMap[ExtendedErrorsX.userErrorsKey] as Map<String, dynamic>
    //     : <String, List<List>>{};

    // loggerSimple.i('parseError.1: errorsDynamic=$errorsDynamic');

    final errorsAsLists =
        errorsDynamic.map((key, value) => MapEntry(key, [value]));

    final userErrorsAsLists =
        userErrorsDynamic.map((key, value) => MapEntry(key, [value]));

    ///Данный участок кода пришлось закомментировать, так как сейчас это избыточно
    /* final expanded = userErrorsAsLists
        .map((key, value) => MapEntry(key, value.expand((e) => e).toList()));*/

    return ExtendedErrors(
        error: error,
        errors: errorsAsLists,
        onlyUserFieldsErrors: userErrorsAsLists);
  } on Exception catch (e) {
    return ExtendedErrors.simple(e.toString());
  }
}
