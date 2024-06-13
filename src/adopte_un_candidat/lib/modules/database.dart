import 'dart:math';

import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("company").get();

      for (final QueryDocumentSnapshot doc in querySnapshot.docs) {
        userCard = doc.data() as Map<String, dynamic>?;
        userCard?['type'] = 'company';
        QuerySnapshot<Map<String, dynamic>> proposalList =
            await doc.reference.collection("proposal").get();
        int porposalIndex = proposalList.docs.length > 1
            ? Random().nextInt(proposalList.docs.length) - 1
            : 0;

        if (porposalIndex < 0) porposalIndex = 0;

        if (proposalList.docs.isNotEmpty) {
          userCard?['id'] = doc.id;
          userCard?['proposal'] = proposalList.docs[porposalIndex].data();
          userCard?['proposal']['id'] = proposalList.docs[porposalIndex].id;

          String proposalId = proposalList.docs[porposalIndex].id.toString();

          if (userData['card_liked']["${doc.id}-$proposalId"] != null) {
            DateTime currentTimestamp = DateTime.now();
            Timestamp savedTimestamp =
                userData['card_liked']["${doc.id}-$proposalId"];
            DateTime savedTimestampdate = savedTimestamp.toDate();

            if (savedTimestampdate
                .isBefore(currentTimestamp.subtract(const Duration(days: 7)))) {
              await FirebaseFirestore.instance
                  .collection("user")
                  .doc(user.uid)
                  .update({
                'card_liked.${doc.id}-$proposalId': FieldValue.delete(),
              });
              cardStack.add(userCard);
            }
          } else {
            cardStack.add(userCard);
          }
        }
        if (cardStack.length >= 20 ||
            cardStack.length >=
                querySnapshot.docs.length - userData['card_liked'].length) {
          return cardStack;
        }
      }
    } else if (typeAccount == 'company') {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("user").get();

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
          dynamic receiver;
          String secondaryUserId;

          if (message["uids"][0] == uid) {
            secondaryUserId = message["uids"][1];
            
          } else {
            secondaryUserId = message["uids"][0];
          }
          receiver = await getUser(secondaryUserId);

          messages[id] = {
            "userData": {
              "uid": secondaryUserId,
              "type": receiver["type"],
              "colors": receiver["colors"],
              "name": receiver["name"],
              "profile_picture": receiver["profile_picture"]
            },
            "messages": message["messages"]
          };
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

  void readMessage(String messagesId, String uid) {
    bool hasBeenUpdated = false;
    FirebaseFirestore.instance.collection("message").doc(messagesId).get().then((data){
      if (data.exists) {
        List<dynamic> messages = data.data()!["messages"];

        for (int i = 0; i < messages.length; i++) {
          if (messages[i]["receiver"] == uid) {
            messages[i]["seen"] = true;
            hasBeenUpdated = true;
          }
        }

        if (hasBeenUpdated) {
          FirebaseFirestore.instance.collection("message").doc(messagesId).update({
            "messages": messages
          });
        }
      }
    }
    );
  }

  void sendMessage(String messagesId, String uid, String receiverUid, String content) {
    
    FirebaseFirestore.instance.collection("message").doc(messagesId).update({
      "messages": FieldValue.arrayUnion([
      {
          "message": content,
          "date": Timestamp.now(),
          "receiver": receiverUid,
          "seen": false,
          "sender": uid
      }

      ])
    });
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

  Future<void> likeCard(String id, dynamic card) async {
    Map<dynamic, dynamic>? user = await getUser(id);
    if (user!["type"] == 'company') {
      // TODO: Add company liking logic
      return;
    } else if (user["type"] == 'user') {
      await FirebaseFirestore.instance.collection("user").doc(id).update({
        'card_liked.${card["id"]}-${card["proposal"]["id"]}':
            FieldValue.serverTimestamp(),
      });
    } else {
      return;
    }
  }

  Future<List?> getFavorites(String id) async {
    var favorites = [];
    final DocumentSnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection("user").doc(id).get();

    if (querySnapshot.exists) {
      favorites = querySnapshot.data()!['favorite'];
      return favorites;
    } else {
      if (kDebugMode) {
        print("No such document!");
      }
      return null;
    }
  }

  void addFavorite(String id, dynamic card) async {
    await FirebaseFirestore.instance.collection("user").doc(id).update({
      'favorite': FieldValue.arrayUnion([
        {"company": card["id"], "proposal": card["proposal"]["id"]}
      ]),
    });
  }

  Future<void> createUser(String uid) async {
    String? pictureLink = await getPicture(Random().nextInt(47));
    await FirebaseFirestore.instance.collection("user").doc(uid).set({
      'name': "Mossy Pebble",
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
      'profile_picture':
          'https://firebasestorage.googleapis.com/v0/b/adopte-un-candidat.appspot.com/o/company%2Fformule1.png?alt=media&token=daddbbaa-0d0d-4fda-9c8e-7cb718d1101c',
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

  Future<void> emailUpdate(
      BuildContext context, String id, String email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.verifyBeforeUpdateEmail(email);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Email changé avec succès. Un email de verification a été envoyé à $email.'),
            ),
          );
        }
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
        await FirebaseFirestore.instance.collection("user").doc(id).update({
          'email': email,
        });
        if (kDebugMode) {
          print('Email updated successfully to: ${user?.email}');
        }
      } else {
        if (kDebugMode) {
          print('No user is signed in.');
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Impossible de changer l\'email: $e'),
          ),
        );
      }
      if (kDebugMode) {
        print('Failed to update email: $e');
      }
    }
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
