import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titres = ["Alerte épidémie", "Rappel vaccin"];
    List<String> descriptions = [
      "Cas de grippe aviaire signalés dans la région de Saint-Louis.",
      "Le vaccin Rage de Rex arrive à échéance dans 5 jours.",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
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
