import 'package:flutter/material.dart';
import 'bouton_colore.dart';
import 'loginpage.dart';

class PageDemarrage extends StatelessWidget {
  const PageDemarrage({super.key});

  Widget buildLogo() {
    return Container(
      height: 160,
      width: 160,
      decoration: BoxDecoration(
        color: const Color(0xFFEAF8DA),
        borderRadius: BorderRadius.circular(80),
      ),
      child: const Icon(Icons.pets, size: 90, color: Colors.green),
    );
  }

  Widget buildPresentation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildLogo(),
        const SizedBox(height: 30),
        const Text(
          "findYourVeto",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34, color: Colors.green),
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            "Des soins vétérinaires plus proches de vous et de vos animaux",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(child: buildPresentation()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                width: double.infinity,
                child: BoutonColore(
                  texteBouton: "Commencer",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
