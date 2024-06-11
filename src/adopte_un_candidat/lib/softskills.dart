import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import './widgets/soft_skills_button.dart';

class Softskills extends StatefulWidget {
  const Softskills({super.key});

  @override
  State<Softskills> createState() => _SoftskillsState();
}

class _SoftskillsState extends State<Softskills> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Soft Skills'),
      ),
      body: const Column(
        children: [
          SoftSkillsButton(type: 'Social',content: 'Insulte',),
          SoftSkillsButton(type: 'Analytical',content: 'Super Mega Supra Long Texte De La Mort Qui Tue',),
          SoftSkillsButton(type: 'Social',content: 'Insulte',),
        ],
      ),
      bottomNavigationBar: const SuperNavigationBar(
        index: 2,
      ),
    );
  }
}
