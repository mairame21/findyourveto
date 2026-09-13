import 'package:flutter/material.dart';

class DossierMedicalPage extends StatelessWidget {
  const DossierMedicalPage({super.key});

  List<String> get dates => ["12/06/2026", "02/03/2026"];
  List<String> get comptesRendus => [
        "Contrôle de routine, animal en bonne santé.",
        "Blessure légère à la patte, soignée sur place.",
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Dossier médical"),
      ),
      body: ListView.builder(
        itemCount: dates.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
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
