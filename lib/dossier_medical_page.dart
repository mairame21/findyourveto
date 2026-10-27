import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class DossierMedicalPage extends StatelessWidget {
  const DossierMedicalPage({super.key});

  Widget buildListeHistorique() {
    var titres = <String>[
      "Consultation générale",
      "Vaccin rage",
      "Analyse sanguine",
      "Consultation (toux)",
    ];
    var dates = <String>[
      "15 oct. 2025",
      "02 août 2025",
      "12 avr. 2025",
      "05 janv. 2025",
    ];
    var veterinaires = <String>[
      "Dr. Diop",
      "Dr. Diop",
      "Laboratoire VetPlus",
      "Dr. Fall",
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) {
        return PanneauArrondi(
          child: ListTile(
            leading: const Icon(Icons.folder_shared, color: Colors.green),
            title: Text(titres[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text("${dates[index]} • ${veterinaires[index]}"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Historique médical"),
      ),
      body: buildListeHistorique(),
    );
  }
}
