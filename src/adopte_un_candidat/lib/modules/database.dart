import 'dart:math';

import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class Database {
  Future<List?> getStack() async {
    var cardStack = [];
    User? user;
    Map? userData;
    String typeAccount;

    user = await Authentication().getCurrentUser();
    userData = await getUser(user!.uid);
    typeAccount = userData!['type'];

    Map<String, dynamic>? userCard;
    if (typeAccount == 'user') {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("company").get();

      for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
        userCard = doc.data() as Map<String, dynamic>?;
        userCard?['type'] = 'company';
        QuerySnapshot<Map<String, dynamic>> proposalList = await doc.reference.collection("proposal").get();
        int porposalIndex = proposalList.docs.length > 1 ? Random().nextInt(proposalList.docs.length) - 1 : 0;

        if (porposalIndex < 0) porposalIndex = 0;

        if (proposalList.docs.isNotEmpty) {
          userCard?['proposal'] = proposalList.docs[porposalIndex].data();

          String proposalId = proposalList.docs[porposalIndex].id.toString();

          if (userData['card_liked']["${doc.id}-$proposalId"] != null) {
            DateTime currentTimestamp = DateTime.now();
            Timestamp savedTimestamp = userData['card_liked']["${doc.id}-$proposalId"];
            DateTime savedTimestampdate = savedTimestamp.toDate();

            if (savedTimestampdate.isBefore(currentTimestamp.subtract(const Duration(days: 7)))) {
              await FirebaseFirestore.instance.collection("user").doc(user.uid).update({
                'card_liked.${doc.id}-$proposalId': FieldValue.delete(),
              });
              cardStack.add(userCard);
            }
          } else {
            cardStack.add(userCard);
          }
        }
        if (cardStack.length >= 20 ||
            cardStack.length >= querySnapshot.docs.length) {
          return cardStack;
        }
      }
    } else if (typeAccount == 'company') {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection("user").get();

      for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
        userCard = doc.data() as Map<String, dynamic>?;

        userCard?['type'] = 'user';

        cardStack.add(userCard);
        if (cardStack.length >= 20 ||
            cardStack.length >= querySnapshot.docs.length) {
          return cardStack;
        }
      }
    } else {
      return null;
    }
    return null;
  }

  Future<Map?> getUser(String id) async {
    var user = {};
    final DocumentSnapshot<Map<String, dynamic>> queryCandidatSnapshot =
        await FirebaseFirestore.instance.collection("user").doc(id).get();
    final DocumentSnapshot<Map<String, dynamic>> queryCompanySnapshot =
        await FirebaseFirestore.instance.collection("company").doc(id).get();

    if (queryCandidatSnapshot.exists) {
      user = queryCandidatSnapshot.data()!;
      user['type'] = 'user';
      return user;
    } else if (queryCompanySnapshot.exists) {
      user = queryCompanySnapshot.data()!;
      user['type'] = 'company';
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
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("soft_skill")
            .doc("list")
            .get();

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

  Future<Map?> getMessages(String uid) async {
    Map<dynamic, dynamic>? user = await getUser(uid);

    if (user != null) {

      var conversationsids = user['messages'];

      var messages = {};
      for (var id in conversationsids) {
        final DocumentSnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance
                .collection("message")
                .doc(id.toString())
                .get();

        if (querySnapshot.exists) {
          var message = querySnapshot.data()!;
          messages.addAll({id: message});
        } else {
          if (kDebugMode) {
            print("No such document!");
          }
        }
      }
      return messages;
    }
    return null;
  }

  Future<String?> getPicture(int id) async {
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('users/$id.png');

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
      'username': "Mossy Pebble",
      'activity_sector': 'Restauration',
      'card_liked': {}, //{'0-0': FieldValue.serverTimestamp()},
      'email': "email",
      'experience': ['Cuisinier', 'Hacker'],
      'favorite': [],
      'first_name': 'Tom',
      'last_name': 'Hanks',
      'location': 'Paris',
      'phone': '0123456789',
      'colors': ["#FF0000", "#00FF00"],
      'professional_status': 'Etudiant',
      'profile_picture': pictureLink ?? '',
      'soft_skills': {
        "Analytical": [],
        "Interpersonal": [],
        "Self-management": [],
        "Social": [],
      }
    });
  }

  Future<void> createCompany(String uid) async {
    await FirebaseFirestore.instance.collection("company").doc(uid).set({
      'colors': ["#FF0000", "#00FF00"],
      'description': {
        'en': "",
        'fr': "MONEY MONEY MONEY",
      },
      'email': "ledger@mail.com",
      'location': {
        'address': "3 rue du poin",
        'country': "France",
        'town': 'Paris',
        'zip': '75000',
      },
      'motto': "On aime l'argent !",
      'name': 'Ledger',
      'picture_profile': 'https://firebasestorage.googleapis.com/v0/b/adopte-un-candidat.appspot.com/o/company%2Fformule1.png?alt=media&token=daddbbaa-0d0d-4fda-9c8e-7cb718d1101c',
      'website': 'www.ledger.com',
    });
  }

  // ------------------------------------------------
  // ----------------- User Actions -----------------
  // ------------------------------------------------

  Future<void> lastNameUpdate(String id, String lastName) async {
    await FirebaseFirestore.instance.collection("user").doc(id).update({
      'last_name': lastName,
    });
  }

  Future<void> firstNameUpdate(String id, String firstName) async {
    await FirebaseFirestore.instance.collection("user").doc(id).update({
      'first_name': firstName,
    });
  }

  Future<void> emailUpdate(String id, String email) async {
    await FirebaseFirestore.instance.collection("user").doc(id).update({
      'email': email,
    });
  }

  Future<void> phoneUpdate(String id, String phone) async {
    await FirebaseFirestore.instance.collection("user").doc(id).update({
      'phone': phone,
    });
  }

  // Future<void> softSkillsUpdate(String id, Map softSkills) async {
  //   await FirebaseFirestore.instance.collection("user").doc(id).update({
  //     'soft_skills': softSkills,
  //   });
  // }
}
