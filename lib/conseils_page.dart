import 'package:flutter/material.dart';

class ConseilsPage extends StatelessWidget {
  const ConseilsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titres = [
      "Prévenir la parvovirose chez le chiot",
      "Chaleur et hydratation du bétail",
    ];
    List<String> contenus = [
      "La parvovirose est évitable par la vaccination dès 6 à 8 semaines.",
      "En période de forte chaleur, assurez un accès permanent à l'eau propre.",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Conseils & actualités")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: titres.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titres[index], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text(contenus[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
