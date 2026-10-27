import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceFirebase {
  static String traduire(String code) {
    if (code == 'email-already-in-use') {
      return "Cet email est déjà utilisé";
    }
    if (code == 'weak-password') {
      return "Mot de passe trop court (6 caractères minimum)";
    }
    if (code == 'invalid-email') {
      return "Email invalide";
    }
    if (code == 'invalid-credential' || code == 'wrong-password' || code == 'user-not-found') {
      return "Email ou mot de passe incorrect";
    }
    if (code == 'network-request-failed') {
      return "Pas de connexion internet";
    }
    return "Une erreur est survenue ($code)";
  }

  static Future<String> inscrire(
    String nom,
    String email,
    String motDePasse,
    String type,
    String specialite,
    String adresse,
  ) async {
    if (nom.trim() == "") {
      return "Entrez votre nom";
    }
    try {
      var compte = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: motDePasse,
      );
      await FirebaseFirestore.instance.collection('users').doc(compte.user!.uid).set({
        'nom': nom.trim(),
        'email': email.trim(),
        'type': type,
        'specialite': specialite.trim(),
        'adresse': adresse.trim(),
      });
      return "";
    } on FirebaseAuthException catch (e) {
      return traduire(e.code);
    } catch (e) {
      return "Erreur : $e";
    }
  }

  static Future<String> connecter(String email, String motDePasse) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: motDePasse,
      );
      return "";
    } on FirebaseAuthException catch (e) {
      return traduire(e.code);
    } catch (e) {
      return "Erreur : $e";
    }
  }

  static Future<String> lireType() async {
    try {
      var utilisateur = FirebaseAuth.instance.currentUser;
      if (utilisateur == null) {
        return "";
      }
      var doc = await FirebaseFirestore.instance.collection('users').doc(utilisateur.uid).get();
      return (doc.data()?['type'] ?? "").toString();
    } catch (e) {
      return "";
    }
  }
}
