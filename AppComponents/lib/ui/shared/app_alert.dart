import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vfx_flutter_common/vfx_flutter_common.dart';

Future appAlert({
  required String value,
  required Color color,
}) async {
  await delayMilli(250).then(
    (_) => Fluttertoast.showToast(
      msg: value,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    ),
  );
}
