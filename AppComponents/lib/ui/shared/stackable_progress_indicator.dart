import 'package:flutter/material.dart';

class StackableProgressIndicator extends StatelessWidget {
  const StackableProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        color: Colors.grey[200],
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
