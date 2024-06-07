import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'modules/buttons.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, top: 50),
                child: Image.asset('assets/images/adopte-logo-cropped.png', width: MediaQuery.of(context).size.width * 0.7),
              )
            ),
            Expanded(
              flex: 1,
              child: Container()
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'Connexion',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 24,
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.4,
                            )
                          )
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                            child: TextField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Adresse E-mail',
                              ),
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                            child: TextField(
                              controller: _passwordcontroller,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Mot de passe',
                              ),
                            )
                          )
                        )
                      ],
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 40),
                            child: ConnectionRegisterButton(
                              onPressed: () {
                                Authentication().signIn(_emailcontroller.text.trim(), _passwordcontroller.text.trim());
                                context.replaceNamed('home');
                              },
                              connectRegister: 'Valider',
                            )
                          )
                        ),
                      ],
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.only(right: 5, bottom: 5),
                            child: const Text(
                              "Pas de compte ?\nHate de faire connaissance !",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: CupertinoColors.black,
                                fontSize: 10,
                              ),
                            )
                          )
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.only(left: 5, right: 50),
                            child: ConnectionRegisterButton(
                              onPressed: () {
                                context.pushNamed('register');
                              },
                              connectRegister: 'Créer',
                            ),
                          ),
                        )
                      ]
                    )
                  ),
                ]
              )
            ),
            Expanded(
              flex: 3,
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
      ),
    );
  }
}
