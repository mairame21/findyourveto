import 'package:flutter/material.dart';

class VaccinsPage extends StatelessWidget {
  const VaccinsPage({super.key});

  List<String> get nomsVaccins => ["Rage", "Typhus"];
  List<String> get dates => ["Dans 5 jours", "Dans 30 jours"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Rappels de vaccins"),
      ),
      body: ListView.builder(
        itemCount: nomsVaccins.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
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
