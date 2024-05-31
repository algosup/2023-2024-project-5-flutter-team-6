//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';


//import 'dart:developer';
//
//import 'package:line_icons/line_icon.dart';

// imported libraries that are in comments are not used for the moment
void main() {
  runApp(MyApp());
}


enum AppinioSwiperDirection {
  left,
  right,
}

typedef CardsBuilder = Widget Function(BuildContext context, int index);

class AppinioSwiper extends StatelessWidget {
  final int cardsCount;
  final Function(AppinioSwiperDirection) onSwiping;
  final CardsBuilder cardsBuilder;

  const AppinioSwiper({
    Key? key,
    required this.cardsCount,
    required this.onSwiping,
    required this.cardsBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardsCount,
      itemBuilder: (context, index) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            onSwiping(AppinioSwiperDirection.right);
          } else if (details.velocity.pixelsPerSecond.dx < 0) {
            onSwiping(AppinioSwiperDirection.left);
          }
        },
        child: cardsBuilder(context, index),
      ),
    );
  }
}

// Gradient for Refuse button
const myGradientRefuse = LinearGradient(
  colors: [Color(0xFFE5BF93), Color(0xffd23030)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
// End of Gradient for Refuse button

//..//

// Gradient for Accept button
const myGradientAccept = LinearGradient(
  colors: [Color(0xff5ad230), Color(0xffd4e593)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
// End of Gradient for Accept button

//..//

// Gradient for menu border
const myGradientMenu = LinearGradient(
  colors: [Color(0xffa7207d), Color(0xff6e297c)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
// End of Gradient for menu border

//--//

// Start: LargeFloatingActionButton class (Yes, No buttons)
class LargeFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final LinearGradient? gradient;

  LargeFloatingActionButton({
    required this.onPressed,
    required this.child,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        shape: BoxShape.circle,
        boxShadow: [
          // Add a shadow to the container
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Define the shadow color here
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: child,
        shape: CircleBorder(),
        padding: EdgeInsets.all(screenWidth *
            0.03), // Adjust padding as a percentage of screen width
        //fillColor: Colors.transparent, // Make the button background transparent
      ),
    );
  }
}

// End: LargeFloatingActionButton class (Yes, No buttons)

//---//

// Start: SideFloatingActionButton class (Save, Back buttons)
class SideFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  SideFloatingActionButton({
    required this.onPressed,
    required this.child,
    this.color = const Color(0xFFDEDEDE),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width > 600
          ? MediaQuery.of(context).size.width * 0.10
          : MediaQuery.of(context).size.width * 0.15,
      child: FittedBox(
        child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: color,
            shape: const CircleBorder(),
            child: child),
      ),
    );
  }
}
// End: SideFloatingActionButton class (Save, Back buttons)

//--//

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            //Start of Top Section (logo, top)
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.pink, // Set the background color of the top section for viewing purposes
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(
                            10.0), // Add padding to the container to center the image !!!WIP - Need to find solution to avoid being placed next to iphone notch.
                        //color: Colors.yellow, // Set the background color of the top section for viewing purposes
                        child: Center(
                          child: Image.network(
                              'https://github.com/algosup/2023-2024-project-5-flutter-team-6/raw/dev/src/Assets/adopte-logo.png'), // Logo image for GIT
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          //Color: Colors.red, // Set the background color of the top section for viewing purposes
                          //child: Center(
                          //child: Text('Top Section'), // Text for the top section for viewing purposes
                          //), // VIEWING PURPOSES Line 99 - 102
                          ),
                    ),
                  ],
                ),
              ),
            ),
            //End of Top Section (logo, top)

            //---//

            //Start of Middle Section (left, right, center)
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.green, //for viewing purposes

                      //swipper section
                      

                    ),
                  ),
                  
                  
                ],
              ),
            ),
            //End of Middle Section (left, right, center)

            //---//

            //Start of Bottom Section (yes,no,save,back)
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.orange,// Set the background color of the bottom section for viewing purposes
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SideFloatingActionButton(
                        onPressed: () {
                          // Back button logic
                        },
                        child: const Icon(Icons.arrow_back_rounded,
                            size: 35, color: Color(0xFF959595)),
                      ),
                      LargeFloatingActionButton(
                        onPressed: () {
                          // Refuse button logic
                        },
                        child: const Icon(Icons.clear_rounded,
                            size: 60.0, color: Colors.white),
                        gradient: myGradientRefuse,
                      ),
                      LargeFloatingActionButton(
                        onPressed: () {
                          // Accept button logic
                        }, // Increase the size of the icon

                        child: const Icon(Icons.check_rounded,
                            size: 60.0, color: Colors.white),
                        gradient: myGradientAccept,
                      ),
                      SideFloatingActionButton(
                        onPressed: () {
                          // Save button logic
                        },
                        child: const Icon(Icons.bookmark_rounded,
                            size: 35, color: Color(0xFF959595)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //End of Bottom Section (yes,no,save,back)

            //---//

            // Start of Menu Bar Section
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0,
                    50.0), // Add space on the sides and at the bottom
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: myGradientMenu.colors.first,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Chat button logic
                        },
                        icon: Icon(CupertinoIcons.chat_bubble_2,
                            size: MediaQuery.of(context).size.width > 600
                                ? MediaQuery.of(context).size.width * 0.08
                                : MediaQuery.of(context).size.width *
                                    0.10), // Chat Icon
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: myGradientMenu,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.all(10),
                          onPressed: () {
                            // Swipe (rectangle stack) button logic
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
                          // Profile button logic
                        },
                        icon: Icon(CupertinoIcons.person_fill,
                            size: MediaQuery.of(context).size.width > 600
                                ? MediaQuery.of(context).size.width * 0.08
                                : MediaQuery.of(context).size.width *
                                    0.10), // Chat Icon
                      ),
                    ],
                  )),
                ),
              ),
            ),
            //End of Menu Bar Section
          ],
        ),
      ),
    );
  }
}
