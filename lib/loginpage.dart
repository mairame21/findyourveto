import 'package:flutter/material.dart';
import 'registerpage.dart';
//import 'client_home_page.dart';
//import 'veterinaire_home_page.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //E1
          const Icon(
            Icons.pets,
            size: 100,
            color: Colors.green,
          ),
          //E2
          const Text(
            "Connexion",
            style: TextStyle(
              fontWeight: FontWeight(700),
              fontSize: 30,
              color: Colors.black,
              ),
          ),
          //E3
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
            child: const TextField(
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
          //E4
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
            child: const TextField(
              decoration: InputDecoration(
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
          //E5
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
        onPressed: () {},              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,elevation: 10
              ),
              child: const Text(
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