import 'package:flutter/material.dart';
import 'carte_rdv.dart';

class MesRdvPage extends StatelessWidget {
  const MesRdvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Mes rendez-vous"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CarteRdv(
            animal: "Rex",
            veterinaire: "Dr. Diop",
            creneau: "Lun 26 oct. • 09:00 - 10:00",
            statut: "En attente",
          ),
          const CarteRdv(
            animal: "Minou",
            veterinaire: "Dr. Ndiaye",
            creneau: "Mar 27 oct. • 14:00 - 15:00",
            statut: "Accepté",
          ),
        ],
      ),
    );
  }
}
