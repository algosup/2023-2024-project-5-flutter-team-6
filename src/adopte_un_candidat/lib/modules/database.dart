import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Database {
  
  Future<Map?> getCompany(int id) async {
    var company = {};
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("company").doc(id.toString()).get();
    
    if (querySnapshot.exists) {
      company = querySnapshot.data()!;
      return company;
    } else {
      if (kDebugMode) {
        print("No such document!");
      }
      return null;
    }
  }

  Future<Map?> getUser(int id) async {
    var user = {};
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("user").doc(id.toString()).get();
    
    if (querySnapshot.exists) {
      user = querySnapshot.data()!;
      return user;
    } else {
      if (kDebugMode) {
        print("No such document!");
      }
      return null;
    }
  }

  Future<Map?> softSkills() async {
    var softSkills = {};
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("soft_skill").doc("list").get();
    
    if (querySnapshot.exists) {
      softSkills = querySnapshot.data()!;
      return softSkills;
    } else {
      if (kDebugMode) {
        print("No such document!");
      }
      return null;
    }
  }

  Future<Map?> getMessages(int id) async {
    var messages = {};
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("message").doc(id.toString()).get();
    
    if (querySnapshot.exists) {
      messages = querySnapshot.data()!;
      return messages;
    } else {
      if (kDebugMode) {
        print("No such document!");
      }
      return null;
    }
  }
}