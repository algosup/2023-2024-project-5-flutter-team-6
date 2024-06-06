import 'package:flutter/material.dart';
import './widgets/navigation_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        color: Colors.deepOrangeAccent,
      ),
      bottomNavigationBar: const SuperNavigationBar(index: 2),
    );
  }
}
