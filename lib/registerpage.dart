import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'champ_texte.dart';
import 'client_home_page.dart';
import 'veterinaire_home_page.dart';
import 'service_firebase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerNom = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerMotDePasse = TextEditingController();
  TextEditingController controllerSpecialite = TextEditingController();
  TextEditingController controllerAdresse = TextEditingController();
  String type = "client";
  String erreur = "";
  bool enCours = false;

  Future<void> sInscrire() async {
    if (enCours == false) {
      setState(() {
        enCours = true;
        erreur = "";
      });
      var message = await ServiceFirebase.inscrire(
        controllerNom.text,
        controllerEmail.text,
        controllerMotDePasse.text,
        type,
        controllerSpecialite.text,
        controllerAdresse.text,
      );
      if (mounted) {
        setState(() {
          enCours = false;
          erreur = message;
        });
        if (message == "") {
          if (type == "veterinaire") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const VeterinaireHomePage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ClientHomePage()),
            );
          }
        }
      }
    }
  }

  Widget buildBoutonType(String texte, String valeur) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              type = valeur;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: type == valeur ? Colors.green : Colors.grey[200],
            foregroundColor: type == valeur ? Colors.white : Colors.black,
          ),
          child: Text(texte),
        ),
      ),
    );
  }

  Widget buildChoixType() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      child: Row(
        children: [
          buildBoutonType("Client", "client"),
          buildBoutonType("Vétérinaire", "veterinaire"),
        ],
      ),
    );
  }

  Widget buildChampsVeterinaire() {
    return Column(
      children: [
        ChampTexte(
          label: "Spécialité",
          icone: Icons.medical_services,
          controller: controllerSpecialite,
        ),
        ChampTexte(
          label: "Adresse du cabinet",
          icone: Icons.location_on,
          controller: controllerAdresse,
        ),
      ],
    );
  }

  Column buildColumnForm() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Icon(Icons.pets, size: 100, color: Colors.green),
        const Center(
          child: Text(
            "Inscription",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(height: 40),
        ChampTexte(label: "Nom", icone: Icons.person, controller: controllerNom),
        ChampTexte(label: "Email", icone: Icons.email_outlined, controller: controllerEmail),
        ChampTexte(
          label: "Mot de passe",
          icone: Icons.lock_clock_outlined,
          masque: true,
          suffixe: const Icon(Icons.visibility_off),
          controller: controllerMotDePasse,
        ),
        buildChoixType(),
        type == "veterinaire" ? buildChampsVeterinaire() : const SizedBox(),
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
            texteBouton: enCours ? "Inscription..." : "S'inscrire",
            onPressed: sInscrire,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
          child: BoutonColore(
            couleur: Colors.white,
            couleurTexte: Colors.green,
            tailleTexte: 15,
            texteBouton: "Déjà un compte ? Connectez-vous",
            onPressed: () {
              Navigator.pop(context);
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
