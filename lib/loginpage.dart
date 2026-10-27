import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'champ_texte.dart';
import 'registerpage.dart';
import 'client_home_page.dart';
import 'veterinaire_home_page.dart';
import 'service_firebase.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerMotDePasse = TextEditingController();
  String erreur = "";
  bool enCours = false;

  Future<void> seConnecter() async {
    if (enCours == false) {
      setState(() {
        enCours = true;
        erreur = "";
      });
      var message = await ServiceFirebase.connecter(controllerEmail.text, controllerMotDePasse.text);
      var type = "";
      if (message == "") {
        type = await ServiceFirebase.lireType();
      }
      if (mounted) {
        setState(() {
          enCours = false;
          erreur = message;
        });
        if (message == "") {
          if (type == "veterinaire") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VeterinaireHomePage()),
            );
          } else if (type == "client") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ClientHomePage()),
            );
          } else {
            setState(() {
              erreur = "Profil introuvable pour ce compte";
            });
          }
        }
      }
    }
  }

  Column buildColumnForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(Icons.pets, size: 100, color: Colors.green),
        const Center(
          child: Text(
            "Connexion",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(height: 40),
        ChampTexte(
          label: "Email",
          icone: Icons.email_outlined,
          controller: controllerEmail,
        ),
        ChampTexte(
          label: "Mot de passe",
          icone: Icons.lock_clock_outlined,
          masque: true,
          suffixe: const Icon(Icons.visibility_off),
          controller: controllerMotDePasse,
        ),
        erreur == ""
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: Text(erreur, style: const TextStyle(color: Colors.red)),
              ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: BoutonColore(
            texteBouton: enCours ? "Connexion..." : "Se connecter",
            onPressed: seConnecter,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: BoutonColore(
            couleur: Colors.white,
            couleurTexte: Colors.green,
            texteBouton: "S'inscrire",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.only(top: 60, bottom: 30),
        children: [buildColumnForm()],
      ),
    );
  }
}
