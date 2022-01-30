import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth {
  Future<User?> signInWithEmailAndPassword(String email, String password);
  Future<User?> createUserWithEmailAndPassword(String email, String password);
  Future<String?> currentUser();
  Future<void> signOut();
}

class Authentification implements BaseAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      user = userCredential.user;
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  @override
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  @override
  Future<String?> currentUser() async {
    User? user = auth.currentUser;
    return user?.uid;
  }

  @override
  Future<void> signOut() async {
    return auth.signOut();
  }
}
