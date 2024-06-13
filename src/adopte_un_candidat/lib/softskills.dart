import 'package:adopte_un_candidat/modules/database.dart';
import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
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
  dynamic categories;
  dynamic skills;

  @override
  void initState() {
    super.initState();
    database.softSkills().then((value) {
      setState(() {
        categories = value?.keys.toList();
        print(categories["skills"]);
        for (var category in categories) {
          print(category);
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
