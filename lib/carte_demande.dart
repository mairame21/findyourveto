import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class CarteDemande extends StatefulWidget {
  final String client;
  final String animal;
  final String heure;

  const CarteDemande({
    super.key,
    required this.client,
    required this.animal,
    required this.heure,
  });

  @override
  State<CarteDemande> createState() => _CarteDemandeState();
}

class _CarteDemandeState extends State<CarteDemande> {
  String statut = "En attente";

  Row buildBoutons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                statut = "Accepté";
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            ),
            child: const Text("Accepter"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                statut = "Refusé";
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.green,
            ),
            child: const Text("Refuser"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PanneauArrondi(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.client} - ${widget.animal}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(widget.heure),
          const SizedBox(height: 10),
          statut == "En attente"
              ? buildBoutons()
              : Text(
                  "Statut : $statut",
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}
