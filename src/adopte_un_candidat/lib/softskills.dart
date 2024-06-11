import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import './widgets/soft_skills_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import './modules/database.dart';

class Softskills extends StatefulWidget {
  const Softskills({super.key});

  @override
  State<Softskills> createState() => _SoftskillsState();
}

class _SoftskillsState extends State<Softskills> {
  Database database = Database();
  var categories;
  List<Widget> carouselItems = [];  // Assure que la liste contient des widgets

  @override
  void initState() {
    super.initState();
    database.softSkills().then((value) {
      setState(() {
        categories = value;

          for(List category in categories) {
          print(category);

          carouselItems.add(
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  category.toString(),
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ),
            ),
          );
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
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFFE8E8E8),
        ),
        child: categories
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    autoPlay: false,
                    height: 100,
                  ),
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
