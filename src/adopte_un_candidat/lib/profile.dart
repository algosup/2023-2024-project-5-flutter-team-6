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
  dynamic user;
  dynamic userData;
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
      widgets.add(ProfileRowUser(username: userData["name"], colors: userData["colors"], image: userData["profile_picture"],),);
      widgets.add( ProfileRowCommon(title: 'Nom', content: userData["last_name"], type: TextInputType.name,  uid: user.uid, functiontype: "lastname",),);
      widgets.add( ProfileRowCommon(title: 'Prénom', content: userData["first_name"], type: TextInputType.name,  uid: user.uid, functiontype: "firstname",),);
      widgets.add( ProfileRowCommon(title: 'Adresse E-Mail', content: userData["email"], type: TextInputType.emailAddress,  uid: user.uid, functiontype: "email",),);
      widgets.add( ProfileRowCommon(title: 'Numéro de téléphone', content: userData["phone"], type: TextInputType.phone,  uid: user.uid, functiontype: "phone",),);          
      widgets.add(const ProfileRowSoft(title: 'Soft skills', content: ['Parler'],),);
      widgets.add(ProfileRowPage(title: 'Cartes enregistrées', onTap: () { context.pushNamed('favorites'); },),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(ProfileRowPage(title: 'Modifier les paramètres', onTap: () {},),);
      widgets.add(ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none,  uid: user.uid, functiontype: "",),);
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(ProfileRowPage(title: 'Politique de confidentialité', onTap: () {}),);
      widgets.add(ProfileRowPage(title: 'License', onTap: () {}),);
      widgets.add(ProfileRowPage(title: 'Conditions générales d\'utilisitation', onTap: () {}),);
    }
    else if (typeAccount == 'company'){
      widgets.add(const ProfileRowCategory(title: 'Entreprise'),);
      widgets.add(ProfileRowCompany(name: userData['name'],),);
      widgets.add(ProfileRowCommon(title: 'Slogan', content: userData['motto'], type: TextInputType.name, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Description', content: userData['description']['fr'], type: TextInputType.name, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Adresse', content: '${userData['location']['address']} ${userData['location']['zip_code']} ${userData['location']['town']}, ${userData['location']['country']}', type: TextInputType.streetAddress, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Adresse E-Mail', content: userData['email'], type: TextInputType.emailAddress, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowCommon(title: 'Numéro de téléphone', content: userData['phone'], type: TextInputType.phone, uid: user.uid, functiontype: "",),);          
      widgets.add(ProfileRowCommon(title: 'Soft skills', content: '<List>', type: TextInputType.none, uid: user.uid, functiontype: "",),);
      widgets.add(ProfileRowPage(title: 'Vos offres', onTap: () {}),);
      widgets.add(const ProfileRowCategory(title: 'Paramètres'),);
      widgets.add(ProfileRowPage(title: 'Modifier les paramètres', onTap: () {}),);
      widgets.add(ProfileRowCommon(title: 'Langue', content: 'Français', type: TextInputType.none, uid: user.uid, functiontype: "",));
      widgets.add(const ProfileRowCategory(title: 'Légal'),);
      widgets.add(ProfileRowPage(title: 'Politique de confidentialité', onTap: () {}),);
      widgets.add(ProfileRowPage(title: 'License', onTap: () {}),);
      widgets.add(ProfileRowPage(title: 'Conditions générales d\'utilisitation', onTap: () {}),);
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
            heroTag: 'disconnect',
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            onPressed: () {
              Authentication().signOutUser();
              context.replaceNamed('login');
            },
            child: const Text('Déconnexion',style: TextStyle(fontSize: 16, color: Colors.red),),
          ),
          FloatingActionButton(
            heroTag: 'deleteaccount',
            elevation: 0,
            backgroundColor: const Color(0xFFFFFFFF),
            onPressed: () {
              //TODO: Add the remove this.user on the database here
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
