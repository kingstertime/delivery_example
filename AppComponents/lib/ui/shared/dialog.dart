import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(
      {super.key,
      required this.title,
      required this.desc,
      required this.cancelButton,
      required this.submitButton,
      this.onCancel,
      this.onSubmit});

  final String title;

  final String desc;

  final String cancelButton;

  final String submitButton;

  final Function()? onCancel;

  final Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(desc),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            if (onCancel != null) {
              onCancel!();
            } else {
              Get.back();
            }
          },
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.red)),
          child: Text(cancelButton),
        ),
        TextButton(
          //style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () {
            if (onSubmit != null) {
              onSubmit!();
            } else {
              Get.back();
            }
          },
          child: Text(submitButton),
        ),
      ],
    );
  }
}
