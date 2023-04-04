import 'package:freezed_annotation/freezed_annotation.dart';

part 'code.freezed.dart';

@freezed
class Code with _$Code {
  const factory Code({required bool isSent}) = _Code;
}
