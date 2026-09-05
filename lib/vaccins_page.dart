import 'package:flutter/material.dart';

class VaccinsPage extends StatelessWidget {
  const VaccinsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> nomsVaccins = ["Rage", "Typhus"];
    List<String> dates = ["Dans 5 jours", "Dans 30 jours"];

    return Scaffold(
      appBar: AppBar(title: const Text("Rappels de vaccins")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: nomsVaccins.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.vaccines, color: Colors.green),
              title: Text(nomsVaccins[index]),
              subtitle: Text(dates[index]),
            ),
          );
        },
      ),
    );
  }
}
