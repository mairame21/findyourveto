import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'prise_rdv_page.dart';

class VetoDetailPage extends StatelessWidget {
  final String nom;
  final String specialite;

  const VetoDetailPage({super.key, required this.nom, required this.specialite});

  Widget buildEntete() {
    return Column(
      children: [
        Container(
          height: 110,
          width: 110,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF8DA),
            borderRadius: BorderRadius.circular(55),
          ),
          child: const Icon(Icons.medical_services, size: 55, color: Colors.green),
        ),
        const SizedBox(height: 15),
        Text(nom, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text(specialite, style: const TextStyle(color: Colors.black54)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.green[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("Disponible aujourd'hui", style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  Widget buildListeSpecialites() {
    var specialites = <String>[
      "Médecine générale",
      "Petits animaux",
      "Grands animaux",
    ];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(specialites[index]),
          );
        },
      ),
    );
  }

  Widget buildHoraire(String jour, String horaire) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(jour, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(horaire, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Profil du vétérinaire"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          buildEntete(),
          const SizedBox(height: 25),
          const Text("Spécialités", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          buildListeSpecialites(),
          const SizedBox(height: 25),
          const Text("Horaires disponibles", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              buildHoraire("Lun", "08:00 - 16:00"),
              buildHoraire("Mar", "08:00 - 16:00"),
              buildHoraire("Mer", "08:00 - 12:00"),
            ],
          ),
          const SizedBox(height: 30),
          BoutonColore(
            texteBouton: "Prendre rendez-vous",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PriseRdvPage(nom: nom)),
              );
            },
          ),
        ],
      ),
    );
  }
}
