import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'dart:developer';



void main() {
  runApp(MyApp());
}



// Start: LargeFloatingActionButton class (Yes, No buttons)
class LargeFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  LargeFloatingActionButton({
    required this.onPressed,
    required this.child,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.15 : MediaQuery.of(context).size.width * 0.20,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          child: child,
          backgroundColor: color,
          shape: CircleBorder()
        ),
      ),
    );
  }
}
// End: LargeFloatingActionButton class (Yes, No buttons)

//---//

// Start: SideFloatingActionButton class (Save, Back buttons)
class SideFloatingActionButton  extends StatelessWidget {
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
      width:  MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.10 : MediaQuery.of(context).size.width * 0.15,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          child: child,
          backgroundColor: color,
          shape: CircleBorder()
        ),
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
                        padding: EdgeInsets.all(10.0), // Add padding to the container to center the image !!!WIP - Need to find solution to avoid being placed next to iphone notch.
                        //color: Colors.yellow, // Set the background color of the top section for viewing purposes
                        child: Center(
                          child: Image.network('https://github.com/algosup/2023-2024-project-5-flutter-team-6/raw/dev/src/Assets/adopte-logo.png'), // Logo image for GIT
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        //Color: Colors.red, // Set the background color of the top section for viewing purposes
                        //child: Center(
                        //child: Text('Top Sectionn'), // Text for the top section for viewing purposes
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
                    flex: 1,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Left Section'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child: Text('Center Section'),

                        // Start of Swiper

                        

                        

                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                      child: Center(
                        child: Text('Right Section'),
                      ),
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
                        child: Icon(Icons.arrow_back_rounded),
                      ),
                      
                      LargeFloatingActionButton(
                        onPressed: () {
                          // Refuse button logic
                        },
                        child: Icon(Icons.clear, size: 40.0), // Increase the size of the icon
                        color: Colors.red,
                        
                      ),

                      LargeFloatingActionButton(
                        onPressed: () {
                          // Accept button logic
                        },
                        child: Icon(Icons.check_rounded, size: 40.0), // Increase the size of the icon
                        color: Colors.green,
                        
                      ),

                      SideFloatingActionButton(
                        onPressed: () {
                          // Save button logic
                        },
                        child: Icon(Icons.bookmark_rounded),
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
                 padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 50.0), // Add space on the sides and at the bottom
                child: Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.purple), //Add gradient color to the border
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
                        icon: Icon(CupertinoIcons.chat_bubble_2, size: MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.08 : MediaQuery.of(context).size.width * 0.10), // Chat Icon
                      ),

                      IconButton( //need to add the background! WIP! @Ian
                        onPressed: () {
                          // Swipe (rectangle stack) button logic
                        },
                        icon: Icon(CupertinoIcons.rectangle_stack, size: MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.08 : MediaQuery.of(context).size.width * 0.10),
                      ),

                      IconButton(
                        onPressed: () {
                          // Profile button logic
                        },
                        icon: Icon(CupertinoIcons.person_fill, size: MediaQuery.of(context).size.width > 600 ? MediaQuery.of(context).size.width * 0.08 : MediaQuery.of(context).size.width * 0.10), // Chat Icon
                    ),
                    
                    ],

                  )
                  ),
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




        