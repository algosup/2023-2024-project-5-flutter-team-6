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
   
    String typeAccount = 'company';  // look the root name of the db to get user OR company 
    List<Widget> widgets = [];

    if(typeAccount == 'user') {
      widgets.add(const ProfileRowCategory(title: 'Personnel'),);
      widgets.add(const ProfileRowUser(name: 'River' , lastName: 'Stone',),);
      widgets.add(const ProfileRowCommon(title: 'Nom', content: 'John', type: TextInputType.name,),);
      widgets.add(const ProfileRowCommon(title: 'Prénom', content: 'Doe', type: TextInputType.name),);
      widgets.add(const ProfileRowCommon(title: 'Adresse E-Mail', content: 'mail@mail.com', type: TextInputType.emailAddress,),);
      widgets.add(const ProfileRowCommon(title: 'Numéro de téléphone', content: '06 00 00 00 00', type: TextInputType.phone,),);          
      widgets.add(const ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none,),);
      widgets.add(const ProfileRowPage(title: 'Cartes enregistrées'),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(const ProfileRowPage(title: 'Modifier les paramètres'),);
      widgets.add(const ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none,),);
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(const ProfileRowPage(title: 'Politique de confidentialité'),);
      widgets.add(const ProfileRowPage(title: 'License'),);
      widgets.add(const ProfileRowPage(title: 'Conditions générales d\'utilisitation'),);
    }
    else{
      widgets.add(const ProfileRowCategory(title: 'Entreprise'),);
      widgets.add(const ProfileRowCompany(name: 'ALGOSUP',),);
      widgets.add(const ProfileRowCommon(title: 'Slogan', content: 'Lorem ispum', type: TextInputType.name,),);
      widgets.add(const ProfileRowCommon(title: 'Description', content: 'Lorem ispum', type: TextInputType.name),);
      widgets.add(const ProfileRowCommon(title: 'Adresse', content: '3 rue du poin 18100 Vierzon, France', type: TextInputType.streetAddress,),);
      widgets.add(const ProfileRowCommon(title: 'Adresse E-Mail', content: 'mail@mail.com', type: TextInputType.emailAddress,),);
      widgets.add(const ProfileRowCommon(title: 'Numéro de téléphone', content: '06 00 00 00 00', type: TextInputType.phone,),);          
      widgets.add(const ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none,),);
      widgets.add(const ProfileRowPage(title: 'Vos offres'),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(const ProfileRowPage(title: 'Modifier les paramètres'),);
      widgets.add(const ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none,),);
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(const ProfileRowPage(title: 'Politique de confidentialité'),);
      widgets.add(const ProfileRowPage(title: 'License'),);
      widgets.add(const ProfileRowPage(title: 'Conditions générales d\'utilisitation'),);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profil'),
        
      ),
      body: ListView(
        children:  [
          ...widgets,
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
