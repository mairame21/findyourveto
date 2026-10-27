import 'package:flutter/material.dart';

class ChampTexte extends StatelessWidget {
  final String label;
  final IconData icone;
  final bool masque;
  final Widget? suffixe;
  final TextEditingController? controller;

  const ChampTexte({
    super.key,
    required this.label,
    required this.icone,
    this.masque = false,
    this.suffixe,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8DA),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        obscureText: masque,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          icon: Icon(icone, color: Colors.green),
          suffixIcon: suffixe,
        ),
      ),
    );
  }
}
