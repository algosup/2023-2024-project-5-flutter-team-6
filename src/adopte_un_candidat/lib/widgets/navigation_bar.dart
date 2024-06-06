import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SuperNavigationBar extends StatefulWidget {
  const SuperNavigationBar({super.key});

  @override
  State<SuperNavigationBar> createState() => _SuperNavigationBarState();
}

class _SuperNavigationBarState extends State<SuperNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 50.0), // Espace sur les côtés et en bas
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.blue, // Remplace `myGradientMenu.colors.first` par une couleur de ton choix
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      context.pushNamed('messages');
                    },
                    icon: Icon(
                      CupertinoIcons.chat_bubble_2,
                      size: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.width * 0.10,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purple], // Remplace par `myGradientMenu` si nécessaire
                      ),
                    ),
                    child: IconButton(
                      padding: const EdgeInsets.all(10),
                      onPressed: () {
                        context.pushNamed('home');
                      },
                      icon: Icon(
                        CupertinoIcons.rectangle_stack,
                        size: MediaQuery.of(context).size.width > 600
                            ? MediaQuery.of(context).size.width * 0.08
                            : MediaQuery.of(context).size.width * 0.10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pushNamed('profile');
                    },
                    icon: Icon(
                      CupertinoIcons.person_fill,
                      size: MediaQuery.of(context).size.width > 600
                          ? MediaQuery.of(context).size.width * 0.08
                          : MediaQuery.of(context).size.width * 0.10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

