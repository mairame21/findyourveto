import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import "loginpage.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FindYourVeto());
}class FindYourVeto extends StatelessWidget {
  const FindYourVeto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'findyourveto',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoginPage(),
    );
  }
}