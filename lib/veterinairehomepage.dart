import 'package:flutter/material.dart';

class VeterinaireHomePage extends StatefulWidget {
  const VeterinaireHomePage({super.key});

  @override
  State<VeterinaireHomePage> createState() => _VeterinaireHomePageState();
}

class _VeterinaireHomePageState extends State<VeterinaireHomePage> {
  int indexActuel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("findYourVeto - Vétérinaire")),
      body: indexActuel == 0
          ? const Center(child: Text("Demandes de rendez-vous"))
          : const Center(child: Text("Mon profil")),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexActuel,
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