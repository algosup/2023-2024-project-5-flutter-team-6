import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/navigation_bar.dart';

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
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 15),
                      child: IconButton(
                        onPressed: () {
                          context.pushNamed('profile');
                        },
                        icon: const Icon(Icons.arrow_back_rounded, size: 40),
                      )
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Rechercher',
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              // TODO: research the profile written
                            },
                            icon: Image.asset('assets/icons/search-icon.png', width: MediaQuery.of(context).size.width * 0.06),
                          )
                        ),
                      )
                    )
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        bottomNavigationBar: const SuperNavigationBar(index: 2),
      ),
    );
  }
}