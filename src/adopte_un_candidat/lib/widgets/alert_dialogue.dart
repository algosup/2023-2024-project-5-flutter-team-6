import 'package:adopte_un_candidat/modules/database.dart';
import 'package:flutter/material.dart';

class ChangeInfosProfile extends StatelessWidget {
  final String title;
  final TextInputType type;
  final String functiontype;
  final String uid;

  ChangeInfosProfile(
      {super.key, required this.title, required this.type, required this.uid, required this.functiontype});

  final TextEditingController textFieldController = TextEditingController();

  void getAction(String type) {
    Database database = Database();
    switch (type) {
      case "lastname":
        database.lastNameUpdate(uid, textFieldController.text.trim());
        break;
      case "firstname":
        database.firstNameUpdate(uid, textFieldController.text.trim());
        break;
      case "email":
        database.emailUpdate(uid, textFieldController.text.trim());
        break;
      case "phone":
        database.phoneUpdate(uid, textFieldController.text.trim());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: AlertDialog(
        title: Text('Entrez votre $title'),
        content: TextField(
          controller: textFieldController,
          keyboardType: type,
          decoration: InputDecoration(
              hintText: title,
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA7207D), width: 2,),),),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Annuler',
              style: TextStyle(
                color: Color(0xFFA7207D),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Add your save functionality here
              getAction(functiontype);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Sauvegarder',
              style: TextStyle(
                color: Color(0xFFA7207D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

