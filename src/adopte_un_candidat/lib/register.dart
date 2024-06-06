import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'modules/buttons.dart';
// import 'package:flutter/services.dart';

void registerChoicePage() {
  
}

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, top: 50),
                child: Image.asset('assets/images/adopte-logo-cropped.png', width: MediaQuery.of(context).size.width * 0.7),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "Vous êtes ...",
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: CupertinoColors.black,
                    fontSize: 32,
                  ),
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
                            padding: const EdgeInsets.only(right: 5, left: 50),
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
                            padding: const EdgeInsets.only(left: 5, right: 50),
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

