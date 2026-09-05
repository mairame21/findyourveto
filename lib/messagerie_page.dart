import 'package:flutter/material.dart';

class MessagerieePage extends StatefulWidget {
  const MessagerieePage({super.key});

  @override
  State<MessagerieePage> createState() => _MessagerieePageState();
}

class _MessagerieePageState extends State<MessagerieePage> {
  final messageController = TextEditingController();

  List<String> messages = [
    "Bonjour, Rex tousse un peu depuis hier.",
    "Merci, surveillez sa température et envoyez une photo si ça persiste.",
  ];

  void envoyerMessage() {
    if (messageController.text != "") {
      setState(() {
        messages.add(messageController.text);
        messageController.clear();
      });
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dr. Fatou Sarr")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Écrire un message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: envoyerMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
