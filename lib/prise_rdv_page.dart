import 'package:flutter/material.dart';
import 'bouton_colore.dart';

class PriseRdvPage extends StatefulWidget {
  final String nom;

  const PriseRdvPage({super.key, required this.nom});

  @override
  State<PriseRdvPage> createState() => _PriseRdvPageState();
}

class _PriseRdvPageState extends State<PriseRdvPage> {
  String jourChoisi = "";
  String creneauChoisi = "";
  String motifChoisi = "Consultation générale";
  bool confirme = false;

  ElevatedButton buildBoutonJour(String texte) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          jourChoisi = texte;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: jourChoisi == texte ? Colors.green : Colors.grey[200],
        foregroundColor: jourChoisi == texte ? Colors.white : Colors.black,
        padding: const EdgeInsets.all(5),
      ),
      child: Text(texte, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget buildCelluleJour(String texte) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: buildBoutonJour(texte),
      ),
    );
  }

  ElevatedButton buildBoutonCreneau(String texte) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          creneauChoisi = texte;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: creneauChoisi == texte ? Colors.green : Colors.grey[200],
        foregroundColor: creneauChoisi == texte ? Colors.white : Colors.black,
      ),
      child: Text(texte),
    );
  }

  Widget buildCelluleCreneau(String texte) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 8),
        child: buildBoutonCreneau(texte),
      ),
    );
  }

  Widget buildBoutonMotif(String texte) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            motifChoisi = texte;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: motifChoisi == texte ? Colors.green : Colors.grey[200],
          foregroundColor: motifChoisi == texte ? Colors.white : Colors.black,
        ),
        child: Text(texte),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Prendre rendez-vous"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Choisir une date", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              buildCelluleJour("Lun 26"),
              buildCelluleJour("Mar 27"),
              buildCelluleJour("Mer 28"),
              buildCelluleJour("Jeu 29"),
              buildCelluleJour("Ven 30"),
            ],
          ),
          const SizedBox(height: 25),
          const Text("Choisir un créneau", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              buildCelluleCreneau("08:00 - 09:00"),
              buildCelluleCreneau("09:00 - 10:00"),
            ],
          ),
          Row(
            children: [
              buildCelluleCreneau("10:00 - 11:00"),
              buildCelluleCreneau("11:00 - 12:00"),
            ],
          ),
          Row(
            children: [
              buildCelluleCreneau("14:00 - 15:00"),
              buildCelluleCreneau("15:00 - 16:00"),
            ],
          ),
          const SizedBox(height: 17),
          const Text("Motif de la visite", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          buildBoutonMotif("Consultation générale"),
          buildBoutonMotif("Vaccination"),
          buildBoutonMotif("Urgence"),
          const SizedBox(height: 20),
          BoutonColore(
            texteBouton: "Confirmer",
            onPressed: () {
              if (jourChoisi != "") {
                if (creneauChoisi != "") {
                  setState(() {
                    confirme = true;
                  });
                }
              }
            },
          ),
          const SizedBox(height: 15),
          confirme
              ? Text(
                  "Demande envoyée à ${widget.nom} : $jourChoisi oct., $creneauChoisi ($motifChoisi)",
                  style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
