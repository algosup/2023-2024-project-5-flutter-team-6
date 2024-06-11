import 'dart:ffi';

import 'package:flutter/material.dart';

class SoftSkillsButton extends StatefulWidget {
  final String type;
  final String content;

  const SoftSkillsButton(
      {super.key, required this.content, required this.type});

  @override
  State<SoftSkillsButton> createState() => _SoftSkillsButtonState();
}

class _SoftSkillsButtonState extends State<SoftSkillsButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;

    switch (widget.type) {
      case 'Social':
        background = const Color(0xFF38A0FF);
        textColor = const Color(0xFFFFFFFF);
        break;
      case 'Self-management':
        background = const Color(0xFFFF7474);
        textColor = const Color(0xFFFFFFFF);
        break;
      case 'Analytical':
        background = const Color(0xFFFFFC4F);
        textColor = const Color(0xFF000000);
        break;
      case 'Interpersonal':
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
            widget.content,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
