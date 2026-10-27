import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  Widget buildListeNotifications() {
    var titres = <String>[
      "Rappel de vaccin",
      "Alerte épidémie",
      "Nouveau message",
      "Conseil santé",
    ];
    var descriptions = <String>[
      "Le rappel du vaccin rage de Rex est dans 6 mois.",
      "Cas de fièvre aphteuse signalés dans votre région.",
      "Vous avez reçu un message de Dr. Diop.",
      "Découvrez nos conseils pour prévenir les maladies courantes.",
    ];
    var temps = <String>[
      "Il y a 2 h",
      "Il y a 5 h",
      "Hier",
      "Il y a 2 jours",
    ];
    var icones = <IconData>[
      Icons.vaccines,
      Icons.warning,
      Icons.message,
      Icons.favorite,
    ];
    var couleurs = <Color>[
      Colors.green,
      Colors.red,
      Colors.green,
      Colors.green,
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) {
        return PanneauArrondi(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: couleurs[index],
              child: Icon(icones[index], color: Colors.white),
            ),
            title: Text(titres[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(descriptions[index]),
            trailing: SizedBox(
              width: 70,
              child: Text(temps[index], style: const TextStyle(fontSize: 11, color: Colors.grey)),
            ),
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
        title: const Text("Notifications"),
      ),
      body: buildListeNotifications(),
    );
  }
}
