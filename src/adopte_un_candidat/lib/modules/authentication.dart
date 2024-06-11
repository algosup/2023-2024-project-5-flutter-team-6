import 'package:adopte_un_candidat/modules/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Authentication {

  Future<bool> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (kDebugMode) {
        print('Sign-In Successful');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Unknown error');
      }
      return false;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (kDebugMode) {
        print('Sign-Up Successful');
      }
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print(e.message ?? 'Unknown error');
      }
    }
  }

  Future<bool> isUserAuthenticated() async {
    User? user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  Future<User?> getCurrentUser() async {
    return FirebaseAuth.instance.currentUser;
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}