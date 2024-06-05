import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'modules/buttons.dart';
// import 'package:flutter/services.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(10.0), // Add padding to the container to center the image !!!WIP - Need to find solution to avoid being placed next to iphone notch.
                child: Center(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/images/adopte-logo.png', width: MediaQuery.of(context).size.width * 0.8), // Logo image for GIT
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
              child: Container(
              child: const Text(
                "Vous êtes ...",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: CupertinoColors.black,
                  fontSize: 32,
                ),
              )
              )
              )
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: RegisterChoice(
                        onPressed: () {
                    
                        },
                        choice: 'Un candidat',
                      )
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: RegisterChoice(
                        onPressed: () {
                    
                        },
                        choice: 'Une entreprise',
                      )
                    )
                  )
                ]
              )
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Déjà un compte ?\nConnectez-vous !",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: CupertinoColors.black,
                                fontSize: 12,
                              ),
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: ConnectionButton(
                              onPressed: () {

                              }
                            ),
                          ),
                        )
                      ]
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "© WE ARE EVOLUTION,  2023\n\n\n",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: CupertinoColors.black,
                              fontSize: 12,
                            ),
                          ),
                          TextSpan(
                            text: 'MENTIONS LÉGALES\n\n',
                            style: const TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto',
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              
                            }
                          ),
                          TextSpan(
                            text: 'DONNÉES PERSONNELS\n\n',
                            style: const TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto',
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              
                            }
                          ),
                          TextSpan(
                            text: 'CGU\n',
                            style: const TextStyle(
                              color: Color(0xFF6F6F6F),
                              fontSize: 10,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Roboto',
                            ),
                            recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              
                            }
                          ),
                        ]),
                      ),
                    )
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}

