import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class ConseilsPage extends StatelessWidget {
  const ConseilsPage({super.key});

  Widget buildListeConseils() {
    var titres = <String>[
      "Prévenir la parvovirose chez le chiot",
      "Chaleur et hydratation du bétail",
      "Les vaccins essentiels du chat",
    ];
    var auteurs = <String>[
      "Dr. Ndiaye",
      "Dr. Fall",
      "Dr. Diop",
    ];
    var contenus = <String>[
      "La parvovirose est évitable par la vaccination dès 6 à 8 semaines.",
      "En période de forte chaleur, assurez un accès permanent à l'eau propre.",
      "Typhus et coryza : respectez le calendrier vaccinal dès l'âge de 2 mois.",
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return PanneauArrondi(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titres[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(auteurs[index], style: const TextStyle(color: Colors.green)),
              const SizedBox(height: 8),
              Text(contenus[index]),
            ],
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
        title: const Text("Conseils & actualités"),
      ),
      body: buildListeConseils(),
    );
  }
}
