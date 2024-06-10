import 'package:flutter/material.dart';

class ChangeInfosProfile extends StatelessWidget {
  final String title;
  final TextInputType type;

  const ChangeInfosProfile(
      {super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: AlertDialog(
        title: Text('Entrez votre $title'),
        content: TextField(
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
