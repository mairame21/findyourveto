import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';
import 'profil_animal_page.dart';

class MesAnimauxPage extends StatelessWidget {
  const MesAnimauxPage({super.key});

  Widget buildLigneAnimal(
    BuildContext context,
    String nom,
    String description,
    String race,
    String poids,
    String taille,
    String couleur,
  ) {
    return PanneauArrondi(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green,
          child: Icon(Icons.pets, color: Colors.white),
        ),
        title: Text(nom, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilAnimalPage(
                  nom: nom,
                  description: description,
                  race: race,
                  poids: poids,
                  taille: taille,
                  couleur: couleur,
                ),
              ),
            );
          },
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
        title: const Text("Mes animaux"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildLigneAnimal(context, "Rex", "Chien • Mâle • 3 ans", "Berger allemand", "25 kg", "Grande", "Noir et feu"),
          buildLigneAnimal(context, "Minou", "Chat • Mâle • 1 an", "Européen", "4 kg", "Petite", "Gris"),
        ],
      ),
    );
  }
}
