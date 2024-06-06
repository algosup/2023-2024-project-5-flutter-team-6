import 'package:adopte_un_candidat/modules/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class SuperNavigationBar extends StatefulWidget {
  const SuperNavigationBar({super.key});

  @override
  State<SuperNavigationBar> createState() => _SuperNavigationBarState();
}

class _SuperNavigationBarState extends State<SuperNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_2,
              size: MediaQuery.of(context).size.width > 600
                  ? MediaQuery.of(context).size.width * 0.08
                  : MediaQuery.of(context).size.width * 0.10,
            ),
            label: 'messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.rectangle_stack,
              size: MediaQuery.of(context).size.width > 600
                  ? MediaQuery.of(context).size.width * 0.08
                  : MediaQuery.of(context).size.width * 0.10,
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_fill,
              size: MediaQuery.of(context).size.width > 600
                  ? MediaQuery.of(context).size.width * 0.08
                  : MediaQuery.of(context).size.width * 0.10,
            ),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: myGradientMenu.colors.first,
        showSelectedLabels: false, // Hide labels for selected items
        showUnselectedLabels: false, // Hide labels for unselected items
        onTap: (int index) {
          switch (index) {
            case 0:
              context.pushNamed('discussion');
            case 1:
              context.pushNamed('home');
            case 3:
              context.pushNamed('profile');
          }
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      );
  }
}

