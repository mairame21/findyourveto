import 'package:flutter/material.dart';

class MessageriePage extends StatefulWidget {
  const MessageriePage({super.key});

  @override
  State<MessageriePage> createState() => _MessageriePageState();
}

class _MessageriePageState extends State<MessageriePage> {
  TextEditingController controllerMessage = TextEditingController();
  String messagesEnvoyes = "";

  void envoyerMessage() {
    if (controllerMessage.text != "") {
      setState(() {
        messagesEnvoyes = messagesEnvoyes == ""
            ? controllerMessage.text
            : "$messagesEnvoyes\n${controllerMessage.text}";
        controllerMessage.text = "";
      });
    }
  }

  Widget buildBulle(String texte, bool moi) {
    return Align(
      alignment: moi ? Alignment.centerRight : Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: moi ? 60.0 : 0.0,
          right: moi ? 0.0 : 60.0,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: moi ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          texte,
          style: TextStyle(color: moi ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget buildListeMessages() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        buildBulle("Bonjour docteur, mon chien ne mange plus depuis hier. Est-ce grave ?", true),
        buildBulle("Bonjour, avez-vous remarqué de la fièvre ou des vomissements ?", false),
        buildBulle("Non, juste une perte d'appétit et il est un peu fatigué.", true),
        buildBulle("D'accord, je vous conseille de venir en consultation dès que possible.", false),
        messagesEnvoyes == "" ? const SizedBox() : buildBulle(messagesEnvoyes, true),
      ],
    );
  }

  Widget buildZoneEnvoi() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: controllerMessage,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Écrivez un message...",
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundColor: Colors.green,
          child: IconButton(
            icon: const Icon(Icons.send, color: Colors.white),
            onPressed: envoyerMessage,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text("Dr. Diop"),
      ),
      body: Column(
        children: [
          Expanded(child: buildListeMessages()),
          Padding(
            padding: const EdgeInsets.all(10),
            child: buildZoneEnvoi(),
          ),
        ],
      ),
    );
  }
}
