import 'package:flutter/material.dart';
import 'bouton_colore.dart';

class SymptomesPage extends StatefulWidget {
  const SymptomesPage({super.key});

  @override
  State<SymptomesPage> createState() => _SymptomesPageState();
}

class _SymptomesPageState extends State<SymptomesPage> {
  String urgence = "Faible";
  bool envoye = false;

  Widget buildBoutonUrgence(String texte) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              urgence = texte;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: urgence == texte ? Colors.green : Colors.grey[200],
            foregroundColor: urgence == texte ? Colors.white : Colors.black,
            padding: const EdgeInsets.all(5),
          ),
          child: Text(texte),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Signaler des symptômes"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Niveau d'urgence", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              buildBoutonUrgence("Faible"),
              buildBoutonUrgence("Modérée"),
              buildBoutonUrgence("Urgente"),
            ],
          ),
          const SizedBox(height: 25),
          const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Décrivez les symptômes",
                icon: Icon(Icons.sick, color: Colors.green),
              ),
            ),
          ),
          const SizedBox(height: 25),
          BoutonColore(
            texteBouton: "Envoyer",
            onPressed: () {
              setState(() {
                envoye = true;
              });
            },
          ),
          const SizedBox(height: 15),
          envoye
              ? const Text(
                  "Formulaire envoyé au vétérinaire.",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
