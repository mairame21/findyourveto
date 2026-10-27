import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class CarteRdv extends StatefulWidget {
  final String animal;
  final String veterinaire;
  final String creneau;
  final String statut;

  const CarteRdv({
    super.key,
    required this.animal,
    required this.veterinaire,
    required this.creneau,
    required this.statut,
  });

  @override
  State<CarteRdv> createState() => _CarteRdvState();
}

class _CarteRdvState extends State<CarteRdv> {
  bool annule = false;

  @override
  Widget build(BuildContext context) {
    return PanneauArrondi(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.event_note, color: Colors.white),
        ),
        title: Text(
          "${widget.animal} - ${widget.veterinaire}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.creneau),
            Text(
              annule ? "Annulé" : widget.statut,
              style: const TextStyle(color: Colors.green),
            ),
          ],
        ),
        trailing: annule
            ? const SizedBox()
            : IconButton(
                icon: const Icon(Icons.cancel_outlined, color: Colors.red),
                onPressed: () {
                  setState(() {
                    annule = true;
                  });
                },
              ),
      ),
    );
  }
}
