import 'package:flutter/material.dart';
import 'conseils_page.dart';
import 'messagerie_page.dart';

class VeterinaireHomePage extends StatefulWidget {
  const VeterinaireHomePage({super.key});

  @override
  State<VeterinaireHomePage> createState() => _VeterinaireHomePageState();
}

class _VeterinaireHomePageState extends State<VeterinaireHomePage> {
  int indexActuel = 0;

  List<String> demandes = ["Rex - Vaccination - 09:30", "Minou - Consultation générale - 13:00"];
  List<String> statuts = ["En attente", "En attente"];

  void accepter(int index) {
    setState(() {
      statuts[index] = "Accepté";
    });
  }

  void refuser(int index) {
    setState(() {
      statuts[index] = "Refusé";
    });
  }

  Widget buildDemandes() {
    return ListView.builder(
      itemCount: demandes.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(demandes[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              Text("Statut : ${statuts[index]}"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => accepter(index),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      child: const Text("Accepter", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => refuser(index),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
                      child: const Text("Refuser"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildProfil() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.message, color: Colors.green),
            title: const Text("Messagerie"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MessagerieePage()));
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: const Icon(Icons.article, color: Colors.green),
            title: const Text("Poster un conseil"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ConseilsPage()));
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("findYourVeto - Vétérinaire"),
      ),
      body: indexActuel == 0 ? buildDemandes() : buildProfil(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexActuel,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            indexActuel = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "Demandes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
