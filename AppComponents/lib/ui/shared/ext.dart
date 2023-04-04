import 'package:flutter/material.dart';

extension SizedBoxX on num {
  SizedBox get sbHeight => SizedBox(height: toDouble());

  SizedBox get sbWidth => SizedBox(width: toDouble());
}

extension StringLengthExtensions on String {
  String maxLen(int max) {
    assert(max > -1);
    return length < max ? this : substring(0, max);
  }
}
