import 'package:flutter/material.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  int indexActuel = 0;

  List<String> nomsVeterinaires = [
    "Dr. Fatou Sarr",
    "Dr. Moussa Ba",
    "Dr. Awa Ndiaye",
  ];

  List<String> specialitesVeterinaires = [
    "Animaux domestiques - Sanar",
    "Élevage bovin - Sor",
    "Chirurgie - Nord",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("findYourVeto")),
      body: indexActuel == 0
          ? ListView.builder(
              itemCount: nomsVeterinaires.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(nomsVeterinaires[index]),
                    subtitle: Text(specialitesVeterinaires[index]),
                  ),
                );
              },
            )
          : indexActuel == 1
              ? const Center(child: Text("Mes rendez-vous"))
              : const Center(child: Text("Mon profil")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexActuel,
        onTap: (index) {
          setState(() {
            indexActuel = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Recherche"),
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "RDV"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}