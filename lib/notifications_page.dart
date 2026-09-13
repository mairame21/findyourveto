import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  List<String> get titres => ["Alerte épidémie", "Rappel vaccin"];
  List<String> get descriptions => [
        "Cas de grippe aviaire signalés dans la région de Saint-Louis.",
        "Le vaccin Rage de Rex arrive à échéance dans 5 jours.",
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Notifications"),
      ),
      body: ListView.builder(
        itemCount: titres.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Colors.green),
            title: Text(titres[index]),
            subtitle: Text(descriptions[index]),
          );
        },
      ),
    );
  }
}
