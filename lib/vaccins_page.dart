import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class VaccinsPage extends StatefulWidget {
  const VaccinsPage({super.key});

  @override
  State<VaccinsPage> createState() => _VaccinsPageState();
}

class _VaccinsPageState extends State<VaccinsPage> {
  bool alerteRage = true;
  bool alerteDhppi = true;
  bool alerteLepto = true;

  Widget buildBandeau() {
    return PanneauArrondi(
      color: const Color(0xFFEAF8DA),
      child: const Row(
        children: [
          Icon(Icons.vaccines, color: Colors.green, size: 40),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Protégez votre animal", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Ne manquez aucun rappel de vaccin !"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitreVaccin(String nom, String date, String delai) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Vaccin $nom", style: const TextStyle(fontWeight: FontWeight.bold)),
        Text("Prochain rappel : $date"),
        Text(delai, style: const TextStyle(color: Colors.green)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Rappels de vaccins"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          buildBandeau(),
          const SizedBox(height: 10),
          PanneauArrondi(
            child: SwitchListTile(
              value: alerteRage,
              onChanged: (value) {
                setState(() {
                  alerteRage = value;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: buildTitreVaccin("Rage", "15/04/2027", "Dans 6 mois"),
            ),
          ),
          PanneauArrondi(
            child: SwitchListTile(
              value: alerteDhppi,
              onChanged: (value) {
                setState(() {
                  alerteDhppi = value;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: buildTitreVaccin("DHPPi", "10/01/2027", "Dans 3 mois"),
            ),
          ),
          PanneauArrondi(
            child: SwitchListTile(
              value: alerteLepto,
              onChanged: (value) {
                setState(() {
                  alerteLepto = value;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: buildTitreVaccin("Leptospirose", "10/07/2027", "Dans 9 mois"),
            ),
          ),
        ],
      ),
    );
  }
}
