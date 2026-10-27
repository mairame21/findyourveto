import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'panneau_arrondi.dart';
import 'carte_demande.dart';
import 'messagerie_page.dart';
import 'conseils_page.dart';

class VeterinaireHomePage extends StatelessWidget {
  const VeterinaireHomePage({super.key});

  Widget buildEntete() {
    return const Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bonjour, Dr. Diop", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("Vos rendez-vous du jour", style: TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  Widget buildCompteur(String valeur, String texte) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              valeur,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(texte, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget buildDernierMessage(BuildContext context) {
    return PanneauArrondi(
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: const Text("M. Diallo", style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: const Text("Merci docteur !"),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MessageriePage()),
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
        centerTitle: true,
        title: const Text("Espace vétérinaire"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildEntete(),
          const SizedBox(height: 20),
          Row(
            children: [
              buildCompteur("3", "Rendez-vous"),
              buildCompteur("5", "Messages"),
              buildCompteur("2", "En attente"),
            ],
          ),
          const SizedBox(height: 25),
          const Text("Demandes de rendez-vous", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const CarteDemande(client: "M. Diallo", animal: "Chien", heure: "Aujourd'hui • 10:00"),
          const CarteDemande(client: "Mme Sow", animal: "Chat", heure: "Aujourd'hui • 11:30"),
          const SizedBox(height: 15),
          const Text("Derniers messages", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          buildDernierMessage(context),
          const SizedBox(height: 20),
          BoutonColore(
            texteBouton: "Voir les conseils",
            tailleTexte: 16,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ConseilsPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
