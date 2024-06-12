import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../modules/buttons.dart';

class SuperNavigationBar extends StatefulWidget {
  final int index;

  const SuperNavigationBar({super.key, required this.index});

  @override
  State<SuperNavigationBar> createState() => _SuperNavigationBarState();
}

class _SuperNavigationBarState extends State<SuperNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3, // Set width to 2/3 of screen width
      decoration: BoxDecoration(
        border: Border.all(
          color: myGradientMenu.colors.first,
          width: 2.0, // Adjust the border width as needed
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100), // Match the border radius
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Make background transparent
          elevation: 0, // Remove elevation shadow
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.chat_bubble_2,
                color: myGradientMenu.colors.first, // Color of inactive icon
                size: MediaQuery.of(context).size.width * 0.1,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      myGradientMenu.colors.first,
                      myGradientMenu.colors.last,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Icon(
                  CupertinoIcons.chat_bubble_2,
                  color: Colors.white, // Color of active icon
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              label: 'messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.rectangle_stack,
                color: myGradientMenu.colors.first, // Color of inactive icon
                size: MediaQuery.of(context).size.width * 0.1,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      myGradientMenu.colors.first,
                      myGradientMenu.colors.last,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Icon(
                  CupertinoIcons.rectangle_stack,
                  color: Colors.white, // Color of active icon
                  size: MediaQuery.of(context).size.width > 600
                      ? MediaQuery.of(context).size.width * 0.08
                      : MediaQuery.of(context).size.width * 0.10,
                ),
              ),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person_fill,
                color: myGradientMenu.colors.first, // Color of inactive icon
                size: MediaQuery.of(context).size.width > 600
                    ? MediaQuery.of(context).size.width * 0.08
                    : MediaQuery.of(context).size.width * 0.10,
              ),
              activeIcon: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      myGradientMenu.colors.first,
                      myGradientMenu.colors.last,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Icon(
                  CupertinoIcons.person_fill,
                  color: Colors.white, // Color of active icon
                  size: MediaQuery.of(context).size.width > 600
                      ? MediaQuery.of(context).size.width * 0.08
                      : MediaQuery.of(context).size.width * 0.10,
                ),
              ),
              label: 'profile',
            ),
          ],
          currentIndex: _selectedIndex,
          showSelectedLabels: false, // Hide labels for selected items
          showUnselectedLabels: false, // Hide labels for unselected items
          onTap: (int index) async {
            setState(() {
              _selectedIndex = index;
            });
            switch (index) {
              case 0:
                context.replaceNamed('messages');
                break;
              case 1:
                context.replaceNamed('home');
                break;
              case 2:
                context.replaceNamed('profile');
                break;
            }
          },
        ),
      ),
    );
  }
}
