import 'package:adopte_un_candidat/modules/database.dart';
import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './widgets/carousel.dart';
import './widgets/user_soft_selection.dart';

class Softskills extends StatefulWidget {
  const Softskills({super.key});

  @override
  State<Softskills> createState() => _SoftskillsState();
}

class _SoftskillsState extends State<Softskills> {

  Database database = Database();
  dynamic data = {};
  dynamic categories = [];
  dynamic skills;

@override
void initState() {
  super.initState();
  database.softSkills().then((value) {
    setState(() {
      data = value?.entries;
      if (kDebugMode) {
        print(data);
      }

      // Liste pour stocker les compétences en français avec leur valeur
      List<Map<String, dynamic>> frenchSkills = [];

      // Itération sur les entrées pour sélectionner les compétences en français
      data.forEach((entry) {
        String category = entry.key;
        Map<String, dynamic> skills = entry.value;

        // Vérification de la présence de compétences en français
        if (skills.containsKey('fr')) {
          List<Map<String, dynamic>> categorySkills = [];

          // Itération sur les compétences de la catégorie
          skills['fr']['skill'].forEach((skillKey, skillValue) {
            Map<String, dynamic> skillData = {
              'skillName': skillKey,
              'value': skillValue,
            };
            categorySkills.add(skillData);
          });

          // Ajouter toutes les compétences de la catégorie à frenchSkills
          frenchSkills.addAll(categorySkills.map((skillData) {
            return {
              'category': category,
              'title': skills['fr']['title'],
              'skill': skillData['skillName'],
              'value': skillData['value']
            };
          }).toList());
        }
      });

      // Affichage des compétences en français avec leur valeur
      for (var skill in frenchSkills) {
        if (kDebugMode) {
          print('Category: ${skill['category']}');
          print('Title: ${skill['title']}');
          print('Skill: ${skill['skill']}');
          print('Value: ${skill['value']}'); // Affiche la valeur du skill
          print('---');
        }
      }
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Soft Skills'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(25),
            right: Radius.circular(25),
          ),
        ),
        child: const Column(
          children: [
            Expanded(
              flex: 1,
              child: CarouselCategoriesChoise(),
            ),
            Expanded(
              flex: 1,
              child: SoftSkillsUserSelection(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const SuperNavigationBar(
        index: 2,
      ),
    );
  }
}
