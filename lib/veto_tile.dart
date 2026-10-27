import 'package:flutter/material.dart';
import 'panneau_arrondi.dart';

class VetoTile extends StatelessWidget {
  final String? nom;
  final String? specialite;
  final String? note;
  final String? distance;
  final Function()? onPressed;

  const VetoTile({
    super.key,
    this.nom,
    this.specialite,
    this.note,
    this.distance,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PanneauArrondi(
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundColor: Colors.green,
          child: Icon(Icons.medical_services, color: Colors.white),
        ),
        title: Text(nom ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialite ?? ""),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                Text(" ${note ?? ""}  •  ${distance ?? ""}"),
              ],
            ),
            const Text("Disponible", style: TextStyle(color: Colors.green, fontSize: 12)),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
