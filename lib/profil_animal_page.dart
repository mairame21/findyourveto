import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'panneau_arrondi.dart';
import 'dossier_medical_page.dart';
import 'vaccins_page.dart';
import 'symptomes_page.dart';

class ProfilAnimalPage extends StatelessWidget {
  final String nom;
  final String description;
  final String race;
  final String poids;
  final String taille;
  final String couleur;

  const ProfilAnimalPage({
    super.key,
    required this.nom,
    required this.description,
    required this.race,
    required this.poids,
    required this.taille,
    required this.couleur,
  });

  Widget buildEntete() {
    return Column(
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF8DA),
            borderRadius: BorderRadius.circular(60),
          ),
          child: const Icon(Icons.pets, size: 60, color: Colors.green),
        ),
        const SizedBox(height: 15),
        Text(nom, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        Text(description, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }

  Widget buildLigneInfo(String label, String valeur) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black54)),
        Text(valeur, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget buildInformations() {
    return PanneauArrondi(
      child: Column(
        children: [
          buildLigneInfo("Race", race),
          const SizedBox(height: 12),
          buildLigneInfo("Poids", poids),
          const SizedBox(height: 12),
          buildLigneInfo("Taille", taille),
          const SizedBox(height: 12),
          buildLigneInfo("Couleur", couleur),
        ],
      ),
    );
  }

  Widget buildBouton(BuildContext context, String texte, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: BoutonColore(
        texteBouton: texte,
        tailleTexte: 16,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Profil de l'animal"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          buildEntete(),
          const SizedBox(height: 25),
          const Text("Informations générales", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          buildInformations(),
          const SizedBox(height: 20),
          buildBouton(context, "Historique médical", const DossierMedicalPage()),
          buildBouton(context, "Vaccins et rappels", const VaccinsPage()),
          buildBouton(context, "Signaler des symptômes", const SymptomesPage()),
        ],
      ),
    );
  }
}
