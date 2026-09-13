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

  List<String> nomsVeterinaires = ["Dr. Fatou Sarr", "Dr. Moussa Ba", "Dr. Awa Ndiaye"];
  List<String> specialitesVeterinaires = ["Animaux domestiques - Sanar", "Élevage bovin - Sor", "Chirurgie - Nord"];

  List<String> rendezVous = [
    "Rex - Dr. Fatou Sarr - 09:30 - En attente",
    "Minou - Dr. Awa Ndiaye - 13:00 - Accepté",
  ];

  Widget buildLigneMenu(IconData icon, String texte, Widget page) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(texte),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => page));
        },
      ),
    );
  }

  Widget buildRecherche() {
    return ListView.builder(
      itemCount: nomsVeterinaires.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.medical_services, color: Colors.white),
            ),
            title: Text(nomsVeterinaires[index]),
            subtitle: Text(specialitesVeterinaires[index]),
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
    );
  }

  Widget buildRdv() {
    return ListView.builder(
      itemCount: rendezVous.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(title: Text(rendezVous[index])),
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
          child: const ListTile(title: Text("Rex"), subtitle: Text("Chien - Berger - 3 ans")),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
          child: const ListTile(title: Text("Minou"), subtitle: Text("Chat - Européen - 1 an")),
        ),
        buildLigneMenu(Icons.folder_shared, "Dossier médical", const DossierMedicalPage()),
        buildLigneMenu(Icons.vaccines, "Rappels de vaccins", const VaccinsPage()),
        buildLigneMenu(Icons.sick, "Signaler des symptômes", const SymptomesPage()),
        buildLigneMenu(Icons.message, "Messagerie", const MessagerieePage()),
        buildLigneMenu(Icons.article, "Conseils & actualités", const ConseilsPage()),
      ],
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("findYourVeto"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsPage()));
            },
          ),
        ],
      ),
      body: indexActuel == 0
          ? buildRecherche()
          : indexActuel == 1
              ? buildRdv()
              : buildProfil(),
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
