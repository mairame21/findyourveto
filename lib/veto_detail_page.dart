import 'package:flutter/material.dart';

class VetoDetailPage extends StatefulWidget {
  final String nom;
  final String specialite;

  const VetoDetailPage({super.key, required this.nom, required this.specialite});

  @override
  State<VetoDetailPage> createState() => _VetoDetailPageState();
}

class _VetoDetailPageState extends State<VetoDetailPage> {
  List<String> creneaux = ["08:00", "09:30", "14:00"];
  String creneauChoisi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.nom)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.specialite, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Choisir un créneau", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Row(
              children: creneaux.map((c) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ChoiceChip(
                    label: Text(c),
                    selected: creneauChoisi == c,
                    onSelected: (selectionne) {
                      setState(() {
                        creneauChoisi = selectionne ? c : "";
                      });
                    },
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (creneauChoisi == "") {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Choisissez un créneau")),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Demande envoyée"),
                        content: Text("RDV avec ${widget.nom} à $creneauChoisi"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Demander un rendez-vous", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
