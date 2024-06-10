import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:adopte_un_candidat/modules/database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './widgets/navigation_bar.dart';
import './widgets/profile_row.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {

  Database database = Database();
  var user;
  var userData;
  String typeAccount = 'none';

  @override
  void initState() {
    super.initState();
    Authentication().getCurrentUser().then(
      (value) {
        setState(() {
          user = value;
        });
        database.getUser(user.uid).then(
          (data) {
            setState(() {
              userData = data;
              typeAccount = userData['type'];
            });
          },
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    if(typeAccount == 'user') {
      widgets.add(const ProfileRowCategory(title: 'Personnel'),);
      widgets.add(ProfileRowUser(username: userData["username"], colors: userData["colors"], image: userData["profile_picture"],),);
      widgets.add( ProfileRowCommon(title: 'Nom', content: userData["last_name"], type: TextInputType.name,  uid: user.uid, functiontype: "lastname",),);
      widgets.add( ProfileRowCommon(title: 'Prénom', content: userData["first_name"], type: TextInputType.name,  uid: user.uid, functiontype: "firstname",),);
      widgets.add( ProfileRowCommon(title: 'Adresse E-Mail', content: userData["email"], type: TextInputType.emailAddress,  uid: user.uid, functiontype: "email",),);
      widgets.add( ProfileRowCommon(title: 'Numéro de téléphone', content: userData["phone"], type: TextInputType.phone,  uid: user.uid, functiontype: "phone",),);          
      widgets.add(ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none,  uid: user.uid, functiontype: "",),);
      widgets.add(const ProfileRowPage(title: 'Cartes enregistrées'),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(const ProfileRowPage(title: 'Modifier les paramètres'),);
      widgets.add(ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none,  uid: user.uid, functiontype: "",),);
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(const ProfileRowPage(title: 'Politique de confidentialité'),);
      widgets.add(const ProfileRowPage(title: 'License'),);
      widgets.add(const ProfileRowPage(title: 'Conditions générales d\'utilisitation'),);
    }
    else if (typeAccount == 'company'){
      widgets.add(const ProfileRowCategory(title: 'Entreprise'),);
      widgets.add(const ProfileRowCompany(name: 'ALGOSUP',),);
      widgets.add(ProfileRowCommon(title: 'Slogan', content: 'Lorem ispum', type: TextInputType.name, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Description', content: 'Lorem ispum', type: TextInputType.name, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Adresse', content: '3 rue du poin 18100 Vierzon, France', type: TextInputType.streetAddress, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Adresse E-Mail', content: 'mail@mail.com', type: TextInputType.emailAddress, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Numéro de téléphone', content: '06 00 00 00 00', type: TextInputType.phone, uid: user.uid, functiontype: "",),);          
      widgets.add(ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none, uid: user.uid, functiontype: "",),);
      widgets.add(const ProfileRowPage(title: 'Vos offres'),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(const ProfileRowPage(title: 'Modifier les paramètres'),);
      widgets.add(ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none, uid: user.uid, functiontype: "",));
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(const ProfileRowPage(title: 'Politique de confidentialité'),);
      widgets.add(const ProfileRowPage(title: 'License'),);
      widgets.add(const ProfileRowPage(title: 'Conditions générales d\'utilisitation'),);
    } else {
      widgets.add(const CircularProgressIndicator());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
