import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'registerpage.dart';
import 'client_home_page.dart';
import 'veterinaire_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> seConnecter() async {
    setState(() => isLoading = true);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();

      final type = userDoc.data()?['type'];

      if (!mounted) return;
      if (type == 'veterinaire') {
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
    } on FirebaseAuthException catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Erreur lors de la connexion")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.pets,
            size: 100,
            color: Colors.green,
          ),
          const Text(
            "Connexion",
            style: TextStyle(
              fontWeight: FontWeight(700),
              fontSize: 30,
              color: Colors.black,
              ),
          ),
          const SizedBox(
            height: 50,
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.email_outlined),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 25,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 234, 248, 218),
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: "Mot de passe",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
                icon: Icon(Icons.lock_clock_outlined),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isLoading ? null : seConnecter,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,elevation: 10
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                "Se connecter",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
            ),
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
                  MaterialPageRoute(builder: (context) =>const RegisterPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 10,
                foregroundColor: Colors.green,
              ) ,
              child: const Text(
                "S'inscrire",
                style: TextStyle(fontSize: 20),)),
          )
      ],
      ),
    );
  }
}
