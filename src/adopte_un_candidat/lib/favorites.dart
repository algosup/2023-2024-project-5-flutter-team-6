import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'modules/buttons.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        
      ),
    );
  }
}