import 'package:flutter/material.dart';

/// В iOS SafeArea дает черную область на месте системного миню сверху экрана
/// Этот виджет закрашивает эту облать цветом бэкграунда
class ColoredSafeArea extends StatelessWidget {
  const ColoredSafeArea({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Colors.black,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
