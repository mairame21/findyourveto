import 'package:flutter/material.dart';
import 'loginpage.dart';
import 'client_home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.pets, size: 100, color: Colors.green),
        const Text(
          "Inscription",
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
              labelText: "Prenom",
              icon: Icon(Icons.person, color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 25),
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
              labelText: "Nom",
              icon: Icon(Icons.person, color: Colors.green),
            ),
          ),
        ),
        const SizedBox(height: 25),
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
        const SizedBox(height: 25),
        Container(
          padding: const EdgeInsets.only(left: 25),
          margin: const EdgeInsets.symmetric(horizontal: 40),
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
        const SizedBox(height: 40),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
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
            child: const Text("S'inscrire", style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          height: 50,
          width: double.infinity ,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.green),
            child: const Text("Deja un compte ? Connectez-vous", style: TextStyle(fontSize: 15)),
          ),
        ),
      ],
      ),
    ),
   );
  }
}
