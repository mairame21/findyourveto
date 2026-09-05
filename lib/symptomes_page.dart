import 'package:flutter/material.dart';

class SymptomesPage extends StatefulWidget {
  const SymptomesPage({super.key});

  @override
  State<SymptomesPage> createState() => _SymptomesPageState();
}

class _SymptomesPageState extends State<SymptomesPage> {
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signaler des symptômes")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Décrivez les symptômes",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("Envoyé"),
                    content: const Text("Le formulaire a été envoyé au vétérinaire."),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Envoyer", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
