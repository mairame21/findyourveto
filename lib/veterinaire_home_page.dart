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

  List<String> demandes = [
    "Rex - Vaccination - 09:30",
    "Minou - Consultation générale - 13:00",
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("findYourVeto - Vétérinaire")),
      body: indexActuel == 0
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: demandes.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(demandes[index], style: const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
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
                              child: OutlinedButton(
                                onPressed: () => refuser(index),
                                child: const Text("Refuser"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
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
                  title: const Text("Poster un conseil"),
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
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "Demandes"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
