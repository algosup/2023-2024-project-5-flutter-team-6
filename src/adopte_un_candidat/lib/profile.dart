import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/navigation_bar.dart';
import './login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        child: FloatingActionButton(
          onPressed: () {
            Authentication().signOutUser();
            context.replaceNamed('login');
          },
          child: const Text('Déco'),
        ),
      ),
      bottomNavigationBar: const SuperNavigationBar(index: 2),
    );
  }
}
