import 'dart:ffi';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

const myGradientMenu = LinearGradient(
  colors: [Color(0xffa7207d), Color(0xff6e297c)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class ActionButtonNext extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget row;
  final LinearGradient? gradient;

  ActionButtonNext({
    required this.onPressed,
    required this.row,
    this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(30),
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
      child: SizedBox(
        width: screenWidth * 0.25,
        // Adjust the width as a percentage of screen width
        child: RawMaterialButton(
            onPressed: onPressed,
            child: row,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.all(10)
            // Adjust padding as a percentage of screen width
            ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  //class Login extends StatelessWidget {
  //Login ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            // Top Section
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  'https://github.com/algosup/2023-2024-project-5-flutter-team-6/blob/dev/src/adopte_un_candidat/assets/images/adopte-logo.png?raw=true',
                  height: 150, // Adjust the height as desired
                ),
                padding: EdgeInsets.only(top: 35, bottom: 0),
              ),
            ),
            // Middle Section

            Expanded(
              flex: 1,
              child: Container(
                padding:
                    EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),
                alignment: Alignment.center,
                child: Text(
                  'The choice of your future is in your hands.',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'QuickSand',
                    color: Colors.black, // Change the color to red
                    fontWeight: FontWeight.normal, // Add bold font weight
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                // Bottom Section

                children: [
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Quicksand',
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          icon: const Icon(LineIcons.googlePlusG),
                          color: CupertinoColors.systemGrey2,
                          onPressed: () {
                            // Add your logic here
                          },
                          iconSize: 35,
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          icon: Icon(LineIcons.apple),
                          color: CupertinoColors.systemGrey2,
                          onPressed: () {
                            // Add your logic here
                          },
                          iconSize: 35,
                        ),
                        IconButton(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          icon: Icon(LineIcons.linkedin),
                          color: CupertinoColors.systemGrey2,
                          onPressed: () {
                            // Add your logic here
                          },
                          iconSize: 35,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ActionButtonNext(
                        onPressed: () {
                          // Add your logic here
                        },
                        row: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              CupertinoIcons.arrow_right_circle_fill,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        gradient: myGradientMenu,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              flex: 1,
              child:
                  // Bottom Section
                  Container(
                //color: Colors.orange,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        '© 2023 WE ARE EVOLUTION',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)), // Add space

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LEGAL NOTICE',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[800],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, left: 10)), // Add space
                          Text(
                            'PRIVACY POLICY',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[800],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, left: 10)), // Add space
                          Text(
                            'TERMS OF USE',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
