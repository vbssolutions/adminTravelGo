import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

// Connexion de l'utilisateur

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());

      final User? user = authResult.user;

      return user;
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  //Deconnexion de l'utilisateur connecté

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}

class DatabaseService {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //List des collections de donnees
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference departures =
      FirebaseFirestore.instance.collection('departures');
}
