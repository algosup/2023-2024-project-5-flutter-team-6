import 'package:flutter/material.dart';

class SoftSkillsButton extends StatelessWidget {
  final String type;
  final String content;

  const SoftSkillsButton(
      {super.key, required this.content, required this.type});

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;

    switch (type) {
      case 'Social':
        background = const Color(0xFF38A0FF);
        textColor = const Color(0xFF000000);
        break;
      case 'Self-management':
        background = const Color(0xFFFF7474);
        textColor = const Color(0xFF000000);
        break;
      case 'Analytical':
        background = const Color(0xFFFFFC4F);
        textColor = const Color(0xFFFFFFFF);
        break;
      case 'Interpersonal':
        background = const Color(0xFF84FF7B);
        textColor = const Color(0xFFFFFFFF);
        break;
      default:
        background = const Color(0xFFFFFFFF);
        textColor = const Color(0xFFFFFFFF);
    }

    return FloatingActionButton(
      onPressed: () {},
      heroTag: content,
      backgroundColor: background,
      child: Text(
        content,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
