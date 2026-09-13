import 'package:flutter/material.dart';

class ConseilsPage extends StatelessWidget {
  const ConseilsPage({super.key});

  List<String> get titres => ["Prévenir la parvovirose chez le chiot", "Chaleur et hydratation du bétail"];
  List<String> get contenus => [
        "La parvovirose est évitable par la vaccination dès 6 à 8 semaines.",
        "En période de forte chaleur, assurez un accès permanent à l'eau propre.",
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Conseils & actualités"),
      ),
      body: ListView.builder(
        itemCount: titres.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titres[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 8),
                Text(contenus[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
