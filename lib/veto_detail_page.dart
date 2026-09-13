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
  int indexChoisi = -1;

  Widget buildBoutonCreneau(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            indexChoisi = index;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: indexChoisi == index ? Colors.green : Colors.grey[200],
          foregroundColor: indexChoisi == index ? Colors.white : Colors.black,
        ),
        child: Text(creneaux[index]),
      ),
    );
  }

  Row buildLigneCreneaux() {
    return Row(
      children: [
        for (int i = 0; i < creneaux.length; i++) buildBoutonCreneau(i),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text(widget.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.specialite, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Choisir un créneau", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            buildLigneCreneaux(),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (indexChoisi != -1) {
                    Navigator.pop(context);
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
