import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/navigation_bar.dart';
import './login.dart';
import './widgets/profile_row.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        
      ),
      body: ListView(
        children:  [
          const ProfileRowCategory(title: 'Personnel'),
          const ProfileRowUser(name: 'River' , lastName: 'Stone',),
          const ProfileRowCommon(title: 'Nom', content: 'John', type: TextInputType.name,),
          const ProfileRowCommon(title: 'Prénom', content: 'Doe', type: TextInputType.name),
          const ProfileRowCommon(title: 'Adresse E-Mail', content: 'mail@mail.com', type: TextInputType.emailAddress,),
          const ProfileRowCommon(title: 'Numéro de téléphone', content: '06 00 00 00 00', type: TextInputType.phone,),
          const ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none,),
          const ProfileRowCategory(title: 'Paramètres'),
          const ProfileRowPage(title: 'Modifier les paramètres'),
          const ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none,),
          const ProfileRowCategory(title: 'Légal'),
          const ProfileRowPage(title: 'Politique de confidentialité'),
          const ProfileRowPage(title: 'License'),
          const ProfileRowPage(title: 'Conditions générales d\'utilisitation'),
          FloatingActionButton(
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            onPressed: () {
              Authentication().signOutUser();
              context.replaceNamed('login');
            },
            child: const Text('Déconnexion',style: TextStyle(fontSize: 16, color: Colors.red),),
          ),
          FloatingActionButton(
            
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            onPressed: () {
              // Add the remove this.user on the database here
              Authentication().signOutUser();
              context.replaceNamed('login');
            },
            child: const Text('Supprimer mon compte',style: TextStyle(fontSize: 16, color: Colors.black),),
          ),
          ],
      ),

      bottomNavigationBar: const SuperNavigationBar(index: 2),
    );
  }
}
