import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_icons/line_icons.dart';

const myGradientMenu = LinearGradient(
  colors: [Color(0xffa7207d), Color(0xff6e297c)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);

class ActionButtonNext extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget row;
  final LinearGradient? gradient;

  const ActionButtonNext({
    required this.onPressed,
    required this.row,
    this.gradient,
    super.key,
  });

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
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SizedBox(
        width: screenWidth * 0.25,
        // Adjust the width as a percentage of screen width
        child: RawMaterialButton(
            onPressed: onPressed,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.all(10),
            child: row
            // Adjust padding as a percentage of screen width
            ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                padding: const EdgeInsets.only(top: 35, bottom: 0),
                child: Image.network(
                  'https://github.com/algosup/2023-2024-project-5-flutter-team-6/blob/dev/src/adopte_un_candidat/assets/images/adopte-logo.png?raw=true',
                  height: 150, // Adjust the height as desired
                ),
              ),
            ),
            // Middle Section

            Expanded(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),
                alignment: Alignment.center,
                child: const Text(
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
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
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
                      controller: _emailcontroller,
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
                          icon: const Icon(LineIcons.apple),
                          color: CupertinoColors.systemGrey2,
                          onPressed: () {
                            // Add your logic here
                          },
                          iconSize: 35,
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          icon: const Icon(LineIcons.linkedin),
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
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ActionButtonNext(
                        onPressed: () async {
                          bool isloggedin = await Authentication().signIn(context, _emailcontroller.text, 'azerty');
                          if (context.mounted) {
                            if (isloggedin) {
                              context.replaceNamed('/home');
                            }
                          }
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
                padding: const EdgeInsets.all(30),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        '© 2023 WE ARE EVOLUTION',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)), // Add space

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
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: 10, right: 10, left: 10)), // Add space
                          Text(
                            'PRIVACY POLICY',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[800],
                            ),
                          ),
                          const Padding(
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
