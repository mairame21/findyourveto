import 'package:flutter/material.dart';

class DossierMedicalPage extends StatelessWidget {
  const DossierMedicalPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dates = ["12/06/2026", "02/03/2026"];
    List<String> comptesRendus = [
      "Contrôle de routine, animal en bonne santé.",
      "Blessure légère à la patte, soignée sur place.",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Dossier médical")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              title: Text(dates[index]),
              subtitle: Text(comptesRendus[index]),
            ),
          );
        },
      ),
    );
  }
}
