import 'package:flutter/material.dart';
import 'package:superdostavka/ui/shared/ext.dart';
import 'package:superdostavka/ui/shared/icons.dart';

class CartButton extends StatelessWidget {
  const CartButton({required this.sum, required this.onPressed, Key? key})
      : super(key: key);

  final int sum;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Row(children: [
        Image.asset(
          AppIcons.cart,
          color: Colors.white,
          width: 20,
          height: 20,
        ),
        5.sbWidth,
        Text(
          '$sum ₽',
          style: const TextStyle(color: Colors.white),
        )
      ]),
    );
  }
}
