import 'dart:math';

import 'package:adopte_un_candidat/modules/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'modules/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:adopte_un_candidat/liste_secteur_activites.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

final valueListenable = ValueNotifier<String?>(null);
final TextEditingController textEditingController = TextEditingController();

final valueListenable2 = ValueNotifier<String?>(null);
final TextEditingController textEditingController2 = TextEditingController();

final valueListenable3 = ValueNotifier<String?>(null);
final TextEditingController textEditingController3 = TextEditingController();

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double? page;

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordVerificationController =
      TextEditingController();
  final TextEditingController professionalStatusController =
      TextEditingController();
  final TextEditingController activitySectorController = TextEditingController();
  final TextEditingController professionalExperienceController =
      TextEditingController();

  List<String> colors = ["FFFFFF", "FFFFFF"];
  String pictureLink = "";
  String userName = "River Stone";

  @override
  void initState() {
    super.initState();
    Database().getPicture(Random().nextInt(47)).then((value) {
      pictureLink = value!;
    });
    Database().getRandomName().then((value) {
      userName = value;
    });
    Database().getColors().then((value) {
      colors = value;
    });
  }

  bool userRealName() {
    return lastNameController.text.trim().isNotEmpty &&
        firstNameController.text.trim().isNotEmpty;
  }

  bool userEmail() {
      final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');

    return emailController.text.trim().isNotEmpty && emailRegex.hasMatch(emailController.text.trim());
  }

  bool userPassword() {
    return (passwordController.text.trim().isNotEmpty &&
        passwordVerificationController.text.trim().isNotEmpty) && (passwordController.text.trim() == passwordVerificationController.text.trim());
  }

  bool userInformation() {
    return professionalStatusController.text.trim().isNotEmpty &&
        activitySectorController.text.trim().isNotEmpty &&
        professionalExperienceController.text.trim().isNotEmpty;
  }

  // ------- Widget -------

  Widget registerChoicePage(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context),
        ),
        const Expanded(
            flex: 2,
            child: Center(
                child: Text(
              "Vous êtes ...",
              style: TextStyle(
                fontFamily: 'Quicksand',
                color: Colors.black,
                fontSize: 32,
              ),
            ))),
        Expanded(
            flex: 3,
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Center(
                      child: RegisterChoice(
                    onPressed: () {
                      setState(() {
                        page = 2;
                      });
                    },
                    choice: 'Un candidat',
                  ))),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: RegisterChoice(
                    onPressed: () {
                      setState(() {
                        page = 2.2;
                      });
                    },
                    choice: 'Une entreprise',
                  )))
            ])),
        Expanded(
            flex: 3,
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 5, left: 50),
                            child: const Text(
                              "Déjà un compte ?\nConnectez-vous !",
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 5, right: 50),
                        child: ConnectionRegisterButton(
                          onPressed: () {
                            context.pushNamed('login');
                          },
                          connectRegister: 'Connexion',
                        ),
                      ),
                    )
                  ])),
              Expanded(
                flex: 2,
                child: extraInformation(),
              )
            ]))
      ],
    );
  }

  Widget registerNameCandidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Faisons connaisance !',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: lastNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Nom',
                              ),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: firstNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Prénom',
                              ),
                            )))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 40, right: 1),
                            child: IconButton(
                              onPressed: () {
                                  setState(() {
                                    page = 1;
                                  });
                              },
                              icon: const Icon(Icons.arrow_back_rounded,
                                  size: 40),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 40, left: 1),
                            child: NextButton(
                              onPressed: () {
                                if (userRealName()) {
                                setState(() {
                                  page = 3;
                                });
                                } else {
                                  if (kDebugMode) {
                                    print("Please fill the fields");
                                  }
                                }
                              },
                            )))
                  ],
                ))
          ])),
      Expanded(
        flex: 3,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerEmailCandidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Entrez votre\nadresse E-mail',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 10),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Adresse E-mail',
                      ),
                    ))),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 40, right: 1),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  page = 2;
                                });
                              },
                              icon: const Icon(Icons.arrow_back_rounded,
                                  size: 40),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 40, left: 1),
                            child: NextButton(
                              onPressed: () {
                                if (userEmail()) {
                                setState(() {
                                  page = 4;
                                });
                                } else {
                                  if (kDebugMode) {
                                    print("Please enter a valid email address");
                                  }
                                }
                              },
                            )))
                  ],
                ))
          ])),
      Expanded(
        flex: 3,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerPasswordCandidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 4,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Enregistrez un\nmot de passe',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Mot de passe',
                              ),
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: passwordVerificationController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Confirmez le mot de passe',
                              ),
                            )))
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 40, left: 1, top: 15),
                    child: NextButton(
                      onPressed: () {
                        if (userPassword()) {
                        setState(() {
                          page = 5;
                        });
                        }
                        else {
                          if (kDebugMode) {
                            print("Please enter a valid password or verify both password are the same");
                          }
                        }
                      },
                    )))
          ])),
      Expanded(
        flex: 2,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerInformationCandidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 4,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Dites-en plus sur vous !',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: professionalStatusController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Statut professionnel',
                              ),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              controller: activitySectorController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Secteur d\'activité recherché',
                              ),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextFormField(
                              controller: professionalExperienceController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Expérience professionnel',
                              ),
                            )))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 40, left: 1),
                    child: NextButton(
                      onPressed: () async {
                        if (userInformation()) {
                          await Database().InitializeUser(emailController.text.trim(), passwordController.text.trim(), firstNameController.text.trim(), lastNameController.text.trim(), userName, pictureLink, colors);
                          setState(() {
                            page = 6;
                          });
                        } else {
                          if (kDebugMode) {
                            print("Please fill the fields");
                          }
                        }
                      },
                    )))
          ])),
      Expanded(
        flex: 2,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerStep1Candidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 6,
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Étape 1 :',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Choisir un\npseudonyme',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 20),
                    child: Column(children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEEEE),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(70),
                              ),
                              child: Row(children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            const EdgeInsets.only(left: 30),
                                        child: Text(
                                          userName,
                                          style: const TextStyle(
                                            fontFamily: 'Quicksand',
                                            color: Color(0xFF3C3C3C),
                                            fontSize: 26,
                                          ),
                                        ))),
                                Expanded(
                                    flex: 2,
                                    child: Center(
                                        child: IconButton(
                                      onPressed: () {
                                        setState(() async {
                                          userName = await Database().getRandomName();
                                      });
                                      },
                                      icon: const Icon(Icons.shuffle_rounded,
                                          size: 40),
                                    )))
                              ]))),
                      Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                        'Une fois choisi, vous ne pourrez pas changer de pseudonyme',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF3C3C3C),
                                          fontSize: 10,
                                        ),
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(top: 5),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "Pourquoi dois-je choisir un pseudonyme ?",
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF6F6F6F),
                                              fontSize: 10,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {}),
                                      ]))))
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 7;
                              });
                              // TODO: Add Register nickname
                            },
                          ),
                        ),
                      )
                    ])))
          ])),
      Expanded(
        flex: 2,
        child: Container(),
      )
    ]);
  }

  Widget registerStep2Candidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 6,
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Étape 2 :',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Choisir\nun avatar',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 34,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 8,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 20),
                    child: Column(children: [
                      Expanded(
                          flex: 4,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: AvatarRandomizerButton(
                                    onPressed: () {},
                                    icon: Transform.flip(
                                      flipX: true,
                                      flipY: true,
                                      child: const Icon(
                                        Icons.shuffle_rounded,
                                        color: Color(0xFF939393),
                                        size: 35,
                                      ),
                                    ),
                                    text: 'Couleur',
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(int.parse("0xFF${colors[0]}")),
                                              Color(int.parse("0xFF${colors[1]}")),
                                            ], // will be changeable
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                          )),
                                      child: Image.network(
                                          pictureLink,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5), // will be changeable
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: AvatarRandomizerButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shuffle_rounded,
                                        color: Color(0xFF939393), size: 35),
                                    text: 'Image',
                                  )),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: const Text(
                                        'Une fois choisi, vous ne pourrez pas changer de d\'image et de couleur de profile',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Color(0xFF3C3C3C),
                                          fontSize: 10,
                                        ),
                                      ))),
                            ],
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 8;
                              });
                              // TODO: Add register avatar
                            },
                          ),
                        ),
                      )
                    ])))
          ])),
      Expanded(
        flex: 2,
        child: Container(),
      )
    ]);
  }

  Widget registerStep3Candidate(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 8,
          child: Column(children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Étape 3 :',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            child: const Text(
                              'Vos soft-skills',
                              style: TextStyle(
                                fontFamily: 'Quicksand',
                                color: Colors.black,
                                fontSize: 34,
                              ),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Sélectionnez vos soft skills qui seront visibles par les entreprises',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ))
                    ],
                  )),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 40, right: 40, bottom: 10, top: 10),
                  child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFFE8E8E8)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      alignment: Alignment.bottomLeft,
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 5),
                                      child: const Text(
                                        '"Soft-skill category"',
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.black,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.topCenter,
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                        color: Colors.black,
                                        height: 2,
                                      )),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                                // TODO: Add Soft-skills area (not selected)

                                ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 130, right: 130, top: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(
                                                      0xFF747474), // color will be changeable depending the soft-skill category
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(
                                                      0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(
                                                      0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(
                                                      0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: Container(
                                        color: Colors.black,
                                        height: 2,
                                      )),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 20),
                                    child: const Text(
                                      'Vos soft-skills sélectionnés',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                                // TODO: Add Soft-skills area (selected)

                                ),
                          ),
                        ],
                      )),
                )),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 40),
                child: NextButton(
                  onPressed: () {},
                ),
              ),
            )
          ]))
    ]);
  }

  Widget logoAdopte(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 50),
      child: Image.asset('assets/images/adopte-logo-cropped.png',
          width: MediaQuery.of(context).size.width * 0.7),
    );
  }

  Widget extraInformation() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: "© WE ARE EVOLUTION,  2023\n\n\n",
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Colors.black,
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
              recognizer: TapGestureRecognizer()..onTap = () {}),
          TextSpan(
              text: 'DONNÉES PERSONNELS\n\n',
              style: const TextStyle(
                color: Color(0xFF6F6F6F),
                fontSize: 10,
                decoration: TextDecoration.underline,
                fontFamily: 'Roboto',
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
          TextSpan(
              text: 'CGU\n',
              style: const TextStyle(
                color: Color(0xFF6F6F6F),
                fontSize: 10,
                decoration: TextDecoration.underline,
                fontFamily: 'Roboto',
              ),
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ]),
      ),
    );
  }

  Widget registerNameCompany(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Faisons connaisance !',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10, bottom: 0),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Nom de l\'entreprise',
                              ),
                            ))),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  page = 1;
                                });
                              },
                              icon: const Icon(Icons.arrow_back_rounded,
                                  size: 40),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(
                                right: 40, left: 1, top: 0),
                            child: NextButton(
                              onPressed: () {
                                setState(() {
                                  page = 3.3;
                                });
                                // name validation
                              },
                            )))
                  ],
                ))
          ])),
      Expanded(
        flex: 3,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerEmailCompany(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 1, child: Container()),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Entrez votre\nadresse E-mail',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 1,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Adresse E-mail',
                      ),
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFEEEEEE),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Numéro de siret',
                      ),
                    ))),
            Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 15),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  page = 2;
                                });
                              },
                              icon: const Icon(Icons.arrow_back_rounded,
                                  size: 40),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(
                                right: 40, left: 1, top: 20),
                            child: NextButton(
                              onPressed: () {
                                setState(() {
                                  page = 4.4;
                                });
                                // email validation
                              },
                            )))
                  ],
                ))
          ])),
      Expanded(
        flex: 3,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerMailBoxPasswordCompany(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 1, child: Container()),
      Expanded(
          flex: 4,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Un code secret vous \n a ete envoye',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Vérifiez votre boite mail, veuillez fournir le code de confirmation.',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
              flex: 2,
              child: Container(
                child: OtpTextField(
                  numberOfFields: 5,
                  borderColor: Color.fromARGB(255, 116, 116, 116),
                  focusedBorderColor: Colors.black26,
                  showFieldAsBox: true,
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TimerCountdown(
                format: CountDownTimerFormat.minutesSeconds,
                endTime: DateTime.now().add(
                  Duration(
                    minutes: 05,
                    seconds: 00,
                  ),
                ),
                onEnd: () async {
                  print(
                      "Le temps est écoulé, un nouveau code vous sera envoyé");
                  await Future.delayed(const Duration(seconds: 5));
                  setState(() {
                    page = 4.4;
                  });
                },
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 40, left: 1, top: 15),
                    child: NextButton(
                      onPressed: () {
                        setState(() {
                          page = 4.5;
                        });
                        // password validation ---
                      },
                    )))
          ])),
      Expanded(
        flex: 2,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerStep1CompanyLogo(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      //Expanded(flex: 2, child: Container()),
      Expanded(
          flex: 4,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Étape 1:',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(
                              left: 40, right: 1, top: 0, bottom: 1),
                          child: const Text(
                            'Le logo de votre \nentreprise',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                  ],
                )),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  // TODO: Implement image upload logic
                },
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.add_photo_alternate,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 40, left: 1, top: 0),
                    child: NextButton(
                      onPressed: () {
                        setState(() {
                          page = 6.6;
                        });
                        // validate information
                      },
                    )))
          ])),
      Expanded(
        flex: 2,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerStep2CompanyBio(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 6,
          child: Column(children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Étape 2 :',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(left: 40, right: 1),
                child: const Text(
                  'Quelque informations \nen plus sur vous',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Colors.black,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 6,
                child: Container(
                    padding:
                        const EdgeInsets.only(right: 40, left: 40, top: 20),
                    child: Column(children: [
                      Expanded(
                        flex: 6,
                        child: Container(
                          //height: 200,

                          padding:
                              const EdgeInsets.only(right: 0, left: 0, top: 10),
                          child: TextField(
                            maxLines: 200,
                            maxLength: 1024,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              hintText: 'Description de l\'entreprise*',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      alignment: Alignment.topLeft,
                                      padding: const EdgeInsets.only(top: 10),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color(0xFFEEEEEE),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            hintText:
                                                ' Lien vers site internet'),
                                      ))),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                      alignment: Alignment.topRight,
                                      padding: const EdgeInsets.only(
                                          top: 10, right: 5),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                "*Ces informations sont visible par le candidat",
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              color: Color(0xFF6F6F6F),
                                              fontSize: 10,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {}),
                                      ]))))
                            ],
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.topRight,
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 7.7;
                              });
                              // Register nickname
                            },
                          ),
                        ),
                      )
                    ])))
          ])),
      Expanded(
        flex: 2,
        child: Container(),
      )
    ]);
  }

  Widget registerStep2ComapanyPoste(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 40, right: 1),
                  child: const Text(
                    'Etape 3:',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 40, right: 1, bottom: 5),
                  child: const Text(
                    'Postez votre premier \noffre d\'emploi...',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                )),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Nom du poste',
                              ),
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, top: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Text(
                                'Secteur d\'activité',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Quicksand',
                                  color: Color.fromARGB(83, 84, 84, 84),
                                ),
                              ),

                              items: items
                                  .map((item) => DropdownItem(
                                        value: item,
                                        height: 40,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              valueListenable: valueListenable,
                              onChanged: (value) {
                                valueListenable.value = value;
                              },
                              buttonStyleData: ButtonStyleData(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                height: 50,
                                width: 368,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFFEEEEEE),
                                ),
                              ),
                              dropdownStyleData: const DropdownStyleData(
                                maxHeight: 200,
                              ),
                              dropdownSearchData: DropdownSearchData(
                                searchController: textEditingController,
                                searchBarWidgetHeight: 50,
                                searchBarWidget: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    expands: true,
                                    maxLines: null,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Rechercher...',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                noResultsWidget: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Pas de resultat trouvé !'),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return item.value
                                      .toString()
                                      .contains(searchValue);
                                },
                              ),
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController.clear();
                                }
                              },
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.only(
                              right: 40, left: 40, top: 20),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'Type de contrat',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),

                              items: items2
                                  .map((item) => DropdownItem(
                                        value: item,
                                        height: 40,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              valueListenable: valueListenable2,
                              onChanged: (value2) {
                                valueListenable2.value = value2;
                              },
                              buttonStyleData: ButtonStyleData(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                height: 50,
                                width: 368,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color(0xFFEEEEEE),
                                ),
                              ),
                              dropdownStyleData: const DropdownStyleData(
                                maxHeight: 200,
                              ),
                              dropdownSearchData: DropdownSearchData(
                                searchController: textEditingController,
                                searchBarWidgetHeight: 50,
                                searchBarWidget: Container(
                                  height: 50,
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    bottom: 4,
                                    right: 8,
                                    left: 8,
                                  ),
                                  child: TextFormField(
                                    expands: true,
                                    maxLines: null,
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 8,
                                      ),
                                      hintText: 'Rechercher...',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                noResultsWidget: const Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('Pas de resultat trouvé !'),
                                ),
                                searchMatchFn: (item, searchValue) {
                                  return item.value
                                      .toString()
                                      .contains(searchValue);
                                },
                              ),
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController2.clear();
                                }
                              },
                            ),
                          ),
                        )),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 40, left: 1),
                    child: NextButton(
                      onPressed: () {
                        setState(() {
                          page = 8.8;
                        });
                        // validate information
                      },
                    ))),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(right: 40, left: 40, top: 5),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    // bring to menu page (company)
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Passer',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ])),
      Expanded(
        flex: 1,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerPasswordCompany(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(flex: 1, child: Container()),
      Expanded(
          flex: 4,
          child: Column(children: [
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Enregistrez un\nmot de passe',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                                left: 40, right: 1, top: 2, bottom: 1),
                            child: Container(
                              color: Colors.black,
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.6,
                            ))),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.only(left: 40, right: 1),
                          child: const Text(
                            'Les champs ci-dessous sont obligatoires ',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Colors.black,
                              fontSize: 8,
                            ),
                          ),
                        ))
                  ],
                )),
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
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
                            ))),
                    Expanded(
                        flex: 2,
                        child: Container(
                            padding: const EdgeInsets.only(
                                right: 40, left: 40, top: 10),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xFFEEEEEE),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                hintText: 'Confirmez le mot de passe',
                              ),
                            )))
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.only(right: 40, left: 1, top: 15),
                    child: NextButton(
                      onPressed: () {
                        setState(() {
                          page = 5.5;
                        });
                        // TODO: Add password validation ---
                      },
                    )))
          ])),
      Expanded(
        flex: 2,
        child: extraInformation(),
      )
    ]);
  }

  Widget registerStep4Company(BuildContext context) {
    return Column(children: [
      Expanded(flex: 2, child: logoAdopte(context)),
      Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 40, right: 1),
                  child: const Text(
                    'Etape 4:',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 40, right: 1, bottom: 5),
                  child: const Text(
                    'Votre proposition de \nsalaire',
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 24,
                    ),
                  ),
                )),
            Expanded(
                flex: 6,
                child: Column(children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          const EdgeInsets.only(right: 40, left: 40, top: 25),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Type de renumeration',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).hintColor,
                            ),
                          ),

                          items: items3
                              .map((item) => DropdownItem(
                                    value: item,
                                    height: 40,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          valueListenable: valueListenable3,
                          onChanged: (value3) {
                            valueListenable3.value = value3;
                          },
                          buttonStyleData: ButtonStyleData(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            height: 50,
                            width: 368,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xFFEEEEEE),
                            ),
                          ),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: textEditingController,
                            searchBarWidgetHeight: 50,
                            searchBarWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 4,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Rechercher...',
                                  hintStyle: const TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            noResultsWidget: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text('Pas de resultat trouvé !'),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController2.clear();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding:
                            const EdgeInsets.only(right: 40, left: 40, top: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Salaire brut*',
                          ),
                          onChanged: (value) {
                            // Add your logic when the user leaves the keyboard focus view

                            int? salary = int.tryParse(value);

                            if (valueListenable3.value == 'Mensuels' &&
                                salary != null &&
                                salary < 1200) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Attention'),
                                    content: const Text(
                                        'Le salaire mensuel doit être \nsupérieur à 1766,92 € brut.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else if (valueListenable3.value == 'Horaires' &&
                                salary != null &&
                                salary < 11.65) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Attention'),
                                    content: const Text(
                                        'Le salaire horaire doit être \nsupérieur à 11,65 € brut.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        )),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(right: 40, left: 1),
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 8.8;
                              });
                              // validate information
                            },
                          ))),
                ]))
          ])),
      Expanded(
        flex: 1,
        child: extraInformation(),
      )
    ]);
  }

  Widget _registerPage(BuildContext context) {
    switch (page) {
      case 1:
        return registerChoicePage(context);
      case 2:
        return registerNameCandidate(context);
      case 2.2:
        return registerNameCompany(context);
      case 3:
        return registerEmailCandidate(context);
      case 3.3:
        return registerEmailCompany(context);
      case 4:
        return registerPasswordCandidate(context);
      case 4.4:
        return registerMailBoxPasswordCompany(context);
      case 4.5:
        return registerPasswordCompany(context);
      case 5:
        return registerInformationCandidate(context);
      case 5.5:
        return registerStep1CompanyLogo(context);
      case 6:
        return registerStep1Candidate(context);
      case 6.6:
        return registerStep2CompanyBio(context);
      case 7:
        return registerStep2Candidate(context);
      case 7.7:
        return registerStep2ComapanyPoste(context);
      case 8:
        return registerStep3Candidate(context);
      case 8.8:
        return registerStep4Company(context);

      default:
        return registerChoicePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: _registerPage(context),
      ),
    );
  }
}
