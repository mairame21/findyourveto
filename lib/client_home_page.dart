import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';
import 'veto_tile.dart';
import 'veto_detail_page.dart';
import 'mes_animaux_page.dart';
import 'mes_rdv_page.dart';
import 'messagerie_page.dart';
import 'conseils_page.dart';
import 'notifications_page.dart';

class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  Widget buildBarreRecherche() {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Rechercher un vétérinaire, une ville...",
          icon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget buildBandeau() {
    return PanneauArrondi(
      color: const Color(0xFFEAF8DA),
      child: const Row(
        children: [
          Icon(Icons.location_on, color: Colors.green, size: 40),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Vétérinaires disponibles près de vous",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("4 vétérinaires dans un rayon de 10 km"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRaccourci(BuildContext context, IconData icone, String label, Widget page) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFEAF8DA),
          child: IconButton(
            icon: Icon(icone, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.green),
        ),
      ],
    );
  }

  Widget buildLigneRaccourcis(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildRaccourci(context, Icons.pets, "Animaux", const MesAnimauxPage()),
        buildRaccourci(context, Icons.event_note, "RDV", const MesRdvPage()),
        buildRaccourci(context, Icons.message, "Messages", const MessageriePage()),
        buildRaccourci(context, Icons.article, "Conseils", const ConseilsPage()),
        buildRaccourci(context, Icons.notifications, "Alertes", const NotificationsPage()),
      ],
    );
  }

  Widget buildVeto(BuildContext context, String nom, String specialite, String note, String distance) {
    return VetoTile(
      nom: nom,
      specialite: specialite,
      note: note,
      distance: distance,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VetoDetailPage(nom: nom, specialite: specialite),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text("findYourVeto"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildBarreRecherche(),
          const SizedBox(height: 15),
          buildBandeau(),
          const SizedBox(height: 10),
          buildLigneRaccourcis(context),
          const SizedBox(height: 15),
          const Text(
            "Les plus proches",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          buildVeto(context, "Dr. Diop", "Animaux domestiques", "4.8", "1.2 km"),
          buildVeto(context, "Dr. Fall", "Élevage bovin", "4.6", "2.4 km"),
          buildVeto(context, "Dr. Sow", "Chirurgie", "4.3", "3.1 km"),
          buildVeto(context, "Dr. Ndiaye", "Médecine générale", "4.7", "4.5 km"),
        ],
      ),
    );
  }
}
