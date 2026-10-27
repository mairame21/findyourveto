import 'package:flutter/material.dart';

class BoutonColore extends StatelessWidget {
  final Color? couleur;
  final Color? couleurTexte;
  final String texteBouton;
  final double tailleTexte;
  final Function()? onPressed;

  const BoutonColore({
    super.key,
    this.couleur,
    this.couleurTexte,
    required this.texteBouton,
    this.tailleTexte = 20,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: couleur ?? Colors.green,
        foregroundColor: couleurTexte ?? Colors.white,
        minimumSize: const Size(150, 50),
      ),
      child: Text(texteBouton, style: TextStyle(fontSize: tailleTexte)),
    );
  }
}
