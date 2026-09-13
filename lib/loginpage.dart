import 'package:flutter/material.dart';
import 'registerpage.dart';
import 'client_home_page.dart';
import 'veterinaire_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.pets, size: 100, color: Colors.green),
        const Text(
          "Connexion",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30, color: Colors.black),
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.only(left: 25),
          margin: const EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 248, 218),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Email",
              icon: Icon(Icons.email_outlined, color: Colors.green),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 25),
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 248, 218),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Mot de passe",
              icon: Icon(Icons.lock_clock_outlined, color: Colors.green),
              suffixIcon: Icon(Icons.visibility_off),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClientHomePage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text("Se connecter", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterPage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
            child: const Text("S'inscrire", style: TextStyle(fontSize: 20)),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VeterinaireHomePage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
            child: const Text("Se connecter en tant que vétérinaire", style: TextStyle(fontSize: 15)),
          ),
        ),
      ],
    ),
  );
 }
}  

