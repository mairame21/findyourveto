import 'package:findyourveto/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'client_home_page.dart';
import 'veterinaire_home_page.dart';
enum TypeProfile{client,veterinaire}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TypeProfile _selectedProfile = TypeProfile.client;
  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final telephoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final specialiteController = TextEditingController();
  final adresseCabinetController = TextEditingController();

  bool isLoading = false;
  Future<void> sInscrire() async {
  if (passwordController.text != confirmPasswordController.text) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Les mots de passe ne correspondent pas")),
    );
    return;
  }

  setState(() => isLoading = true);

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    final userData = {
      'prenom': prenomController.text.trim(),
      'nom': nomController.text.trim(),
      'email': emailController.text.trim(),
      'telephone': telephoneController.text.trim(),
      'type': _selectedProfile.name,
    };

    if (_selectedProfile == TypeProfile.veterinaire) {
      userData['specialite'] = specialiteController.text.trim();
      userData['adresseCabinet'] = adresseCabinetController.text.trim();
    }

    await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(userData);

    if (!mounted) return;
    if (_selectedProfile == TypeProfile.client) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ClientHomePage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const VeterinaireHomePage()));
    }
  } on FirebaseAuthException catch (e) {
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.message ?? "Erreur lors de l'inscription")),
    );
  } catch (e) {
    setState(() => isLoading = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Erreur lors de l'inscription : $e")),
    );
  }
}
  @override
    void dispose() {
      prenomController.dispose();
      nomController.dispose();
      emailController.dispose();
      telephoneController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
      specialiteController.dispose();
      adresseCabinetController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
          const Icon(
            Icons.pets,
            size: 40,
            color: Colors.green,
          ),
          const Text(
            "Inscription",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight(700),
              fontSize: 30,
              color: Colors.black,
              ),
          ),
        ]
        ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child:  TextField(
              controller: prenomController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Prenom",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.person),
              ),
            ),         
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: nomController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Nom",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.person),
              ),
            ),         
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.email_outlined),
              ),
            ),         
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: telephoneController,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Numero de telephone",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.phone),
              ),
            ),         
          ),
                    const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Choisir mot de passe",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.lock_clock_outlined),
                suffixIcon: Icon(Icons.visibility_off)
              ),
            ),         
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color:Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Confirmer le mot de passe",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.lock_clock_outlined),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),         
          ),

          const Text(
  "Type de profil",
  style: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
),
const SizedBox(height: 8),
SegmentedButton<TypeProfile>(
  segments: const <ButtonSegment<TypeProfile>>[
    ButtonSegment<TypeProfile>(
      value: TypeProfile.client,
      label: Text('Client'),
      icon: Icon(Icons.person),
    ),
    ButtonSegment<TypeProfile>(
      value: TypeProfile.veterinaire,
      label: Text('Vétérinaire'),
      icon: Icon(Icons.badge),
    ),
  ],
  selected: <TypeProfile>{_selectedProfile},
  onSelectionChanged: (Set<TypeProfile> newSelection) {
    setState(() {
      _selectedProfile = newSelection.first;
    });
  },
  style: ButtonStyle(
    backgroundColor:  WidgetStateProperty.resolveWith<Color?>((states){
     if (states.contains(WidgetState.selected)) {
        return Colors.green;
      }
      return Colors.grey[200];
    }),
  ),),
if (_selectedProfile == TypeProfile.veterinaire) ...[
  const SizedBox(height: 20),
  Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      controller: specialiteController,
      decoration: const InputDecoration(
        labelText: "Spécialité",
        icon: Icon(Icons.medical_services),
      ),
    ),
  ),
  const SizedBox(height: 20),
  Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      controller: adresseCabinetController,
      decoration: const InputDecoration(
        labelText: "Adresse du cabinet",
        icon: Icon(Icons.location_on),
      ),
    ),
  ),
],
            Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: isLoading ? null : sInscrire,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,elevation: 10
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("S'Inscrire",                 style: TextStyle(fontSize: 20,color: Colors.white),
)),       
          ),
                    Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 10,
                foregroundColor: Colors.green,
              ) ,
              child: const Text(
                "Vous avez deja un compte ? Connectez-vous",
                style: TextStyle(fontSize: 13),)),
          ),
        ]
      ),
    )
    );
  }
}