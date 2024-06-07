import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  Future<List?> getStack() async {
    var cardStack = [];
    Map<String, dynamic>? company;
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("company").get();
      for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
        company = doc.data() as Map<String, dynamic>?;
        QuerySnapshot<Map<String, dynamic>> proposalList = await doc.reference.collection("proposal").get();
        int porposalIndex = proposalList.docs.length > 1 ? Random().nextInt(proposalList.docs.length) - 1 : 0;

        company?['proposal'] = proposalList.docs[porposalIndex].data();
        //
        String proposalId = proposalList.docs[porposalIndex].id.toString();
        // TODO: check if the user has already liked this card

        cardStack.add(company);
        if (cardStack.length >= 20 || cardStack.length >= querySnapshot.docs.length) {
          return cardStack;
        }
      }
    return cardStack;
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

  Future<String?> getPicture(int id) async {
    final Reference storageRef = FirebaseStorage.instance.ref().child('users/$id.png');

    try {
      final String downloadURL = await storageRef.getDownloadURL();
      return downloadURL;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting picture: $e");
      }
      return null;
    }
  }

  Future<void> createUser(String uid) async {
    String? pictureLink = await getPicture(Random().nextInt(47));
    await FirebaseFirestore.instance.collection("user").doc(uid).set({
      'activity_sector': 'Restauration',
      'card_liked': {},//{'0-0': FieldValue.serverTimestamp()},
      'email': "email",
      'experience': ['Cuisinier', 'Hacker'],
      'favorite': [],
      'first_name': 'Tom',
      'last_name': 'Hanks',
      'location': 'Paris',
      'professional_status': 'Etudiant',
      'profile_picture': pictureLink != null ? pictureLink : '',
      'soft_skills': {
        "Analytical": [],
        "Interpersonal": [],
        "Self-management": [],
        "Social": [],
      }
    });
  }
}