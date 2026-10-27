import 'package:flutter/material.dart';

class PanneauArrondi extends StatelessWidget {
  final Widget? child;
  final Color? color;

  const PanneauArrondi({super.key, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: child ?? const Center(),
    );
  }
}
