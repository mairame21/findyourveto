import 'package:flutter/material.dart';

class SymptomesPage extends StatefulWidget {
  const SymptomesPage({super.key});

  @override
  State<SymptomesPage> createState() => _SymptomesPageState();
}

class _SymptomesPageState extends State<SymptomesPage> {
  bool envoye = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Signaler des symptômes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Décrivez les symptômes",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  envoye = true;
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Envoyer", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            if (envoye)
              const Text(
                "Formulaire envoyé au vétérinaire.",
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
