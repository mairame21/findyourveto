import 'package:flutter/material.dart';
import 'veto_detail_page.dart';
import 'dossier_medical_page.dart';
import 'vaccins_page.dart';
import 'symptomes_page.dart';
import 'messagerie_page.dart';
import 'conseils_page.dart';
import 'notifications_page.dart';

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

  List<String> rendezVous = [
    "Rex - Dr. Fatou Sarr - 09:30 - En attente",
    "Minou - Dr. Awa Ndiaye - 13:00 - Accepté",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("findYourVeto"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: indexActuel == 0
          ? ListView.builder(
              itemCount: nomsVeterinaires.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(nomsVeterinaires[index]),
                    subtitle: Text(specialitesVeterinaires[index]),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VetoDetailPage(
                            nom: nomsVeterinaires[index],
                            specialite: specialitesVeterinaires[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : indexActuel == 1
              ? ListView.builder(
                  itemCount: rendezVous.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(rendezVous[index]),
                      ),
                    );
                  },
                )
              : ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Card(
                      child: ListTile(
                        title: const Text("Rex"),
                        subtitle: const Text("Chien - Berger - 3 ans"),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        title: const Text("Minou"),
                        subtitle: const Text("Chat - Européen - 1 an"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(Icons.folder_shared),
                      title: const Text("Dossier médical"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DossierMedicalPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(Icons.vaccines),
                      title: const Text("Rappels de vaccins"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const VaccinsPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(Icons.sick),
                      title: const Text("Signaler des symptômes"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SymptomesPage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(Icons.message),
                      title: const Text("Messagerie"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MessagerieePage()),
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      tileColor: Colors.grey[200],
                      leading: const Icon(Icons.article),
                      title: const Text("Conseils & actualités"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ConseilsPage()),
                        );
                      },
                    ),
                  ],
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexActuel,
        selectedItemColor: Colors.green,
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
