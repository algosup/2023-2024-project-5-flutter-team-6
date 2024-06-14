import 'package:flutter/material.dart';

class SoftSkillsButton extends StatefulWidget {
  final String title;
  final String skill;

  const SoftSkillsButton(
      {super.key, required this.skill, required this.title});

  @override
  State<SoftSkillsButton> createState() => _SoftSkillsButtonState();
}

class _SoftSkillsButtonState extends State<SoftSkillsButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;

    switch (widget.title) {
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
              border: selected
                  ? Border.all(color: Colors.black, width: 2)
                  : Border.all(color: Colors.white, width: 2)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Text(
            widget.skill,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}

class ProfileSoftSkillView extends StatelessWidget {
  final String title;
  final String skill;

  const ProfileSoftSkillView({
    super.key,
    required this.title,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    Color background;
    Color textColor;

    switch (title) {
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
        textColor = const Color(0xFF000000);
    }

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(25),
          right: Radius.circular(25),
        ),
        border: Border.all(
          color: const Color.fromARGB(0, 255, 255, 255),
          width: 2,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Text(
        skill,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
