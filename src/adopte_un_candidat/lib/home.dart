import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/buttons.dart';
import 'swiper_feature.dart';
import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            //Start of Top Section (logo, top)
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.all(
                          10.0), // Add padding to the container to center the image !!!WIP - Need to find solution to avoid being placed next to iphone notch.
                      //color: Colors.yellow, // Set the background color of the top section for viewing purposes
                      child: Center(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('assets/images/adopte-logo.png'), // Logo image for GIT
                      ),
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
            //End of Top Section (logo, top)

            //---//

            //Start of Middle Section (left, right, center)
            const Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SwiperFeature(),
                  ),
                ],
              ),
            ),
            //End of Middle Section (left, right, center)

            //---//

            //Start of Bottom Section (yes,no,save,back)
            Expanded(
              flex: 1,
              child: Center(
              
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SideFloatingActionButton(
                      onPressed: () {
                        // Back button logic
                        HapticFeedback.lightImpact();
                      },
                      child: const Icon(Icons.arrow_back_rounded,
                          size: 35, color: Color(0xFF959595)),
                    ),
                    LargeFloatingActionButton(
                      onPressed: () {
                        // Refuse button logic
                        HapticFeedback.mediumImpact();
                      },
                      gradient: myGradientRefuse,
                      child: const Icon(Icons.clear_rounded,
                          size: 60.0, color: Colors.white),
                    ),
                    LargeFloatingActionButton(
                      onPressed: () {
                          // Accept button logic
                          HapticFeedback.mediumImpact();
              

                          // End of Accept Button logic
                      },
                      gradient: myGradientAccept, // Increase the size of the icon
              
                      child: const Icon(Icons.check_rounded,
                          size: 60.0, color: Colors.white),
                    ),
                    SideFloatingActionButton(
                      onPressed: () {
                        // Save button logic
                        HapticFeedback.lightImpact();
                      },
                      child: const Icon(Icons.bookmark_rounded,
                          size: 35, color: Color(0xFF959595)),
                    ),
                  ],
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: myGradientMenu,
                        ),
                        child: IconButton(
                          padding: const EdgeInsets.all(10),
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
            // End of Menu Bar Sect
          ],
        ),
      ),
    );
  }
}

