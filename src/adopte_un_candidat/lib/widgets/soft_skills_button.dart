import 'dart:ffi';
import 'package:flutter/material.dart';
import '../modules/database.dart';

class SoftSkillsButton extends StatefulWidget {
  final String titles;
  final String skills;

  const SoftSkillsButton(
      {super.key, required this.skills, required this.titles});

  @override
  State<SoftSkillsButton> createState() => _SoftSkillsButtonState();
}

class _SoftSkillsButtonState extends State<SoftSkillsButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;

    switch (widget.titles) {
      case 'social':
        background = const Color(0xFF38A0FF);
        textColor = const Color(0xFFFFFFFF);
        break;
      case 'self-management':
        background = const Color(0xFFFF7474);
        textColor = const Color(0xFFFFFFFF);
        break;
      case 'analytical':
        background = const Color(0xFFFFFC4F);
        textColor = const Color(0xFF000000);
        break;
      case 'interpersonal':
        background = const Color(0xFF84FF7B);
        textColor = const Color(0xFF000000);
        break;
      default:
        background = const Color(0xFFFFFFFF);
        textColor = const Color(0xFFFFFFFF);
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(25),
              right: Radius.circular(25),
            ),
            border: selected ? Border.all(color: Colors.black, width: 2) : Border.all(color: Colors.white, width: 2)
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            widget.skills,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class SoftSkillsList extends StatelessWidget {
  final List<dynamic> categories;

  SoftSkillsList({super.key, required this.categories});
  // List skills = categories.skills.en;
  // String titles = categories.titles.en;
  int i = 0;
  
  @override
  Widget build(BuildContext context) {
    // for(i < skills.lenght()){
    //   String skill = skills[i];
    //   categories.add(SoftSkillsButton(skills: skill, titles: titles),);
    // }
    return Container();
  }
}
