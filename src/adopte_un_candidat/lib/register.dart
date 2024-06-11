import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'modules/buttons.dart';
// import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  int? page;

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
                      setState(() {
                        page = 2;
                      });
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
                        child: ConnectionRegisterButton(
                          onPressed: () {
                            context.pushNamed('login');
                          },
                          connectRegister: 'Connexion',
                        ),
                      ),
                    )
                  ]
                )
              ),
              Expanded(
                flex: 2,
                child: extraInformation(),
              )
            ]
          )
        )
      ],
    );
  }

  Widget registerNameCandidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 2,
          child: Container()
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Faisons connaisance !',
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1,top: 2,bottom: 1),
                        child: Container(
                          color: Colors.black,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.6,
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Les champs ci-dessous sont obligatoires ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      )
                    )
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Nom',
                          ),
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Prénom',
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
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              page = 1;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_rounded, size: 40),
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 40,left: 1),
                        child: NextButton(
                          onPressed: () {
                            setState(() {
                              page = 3;
                            });
                            // name validation

                          },
                        )
                      )
                    )
                  ],
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 3,
          child: extraInformation(),
        )
      ]
    );
  }

  Widget registerEmailCandidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 2,
          child: Container()
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Entrez votre\nadresse E-mail',
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1,top: 2,bottom: 1),
                        child: Container(
                          color: Colors.black,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.6,
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Les champs ci-dessous sont obligatoires ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
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
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              page = 2;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_rounded, size: 40),
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 40,left: 1),
                        child: NextButton(
                          onPressed: () {
                            setState(() {
                              page = 4;
                            });
                            // email validation

                          },
                        )
                      )
                    )
                  ],
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 3,
          child: extraInformation(),
        )
      ]
    );
  }

  Widget registerPasswordCandidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 2,
          child: Container()
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Enregistrez un\nmot de passe',
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1,top: 2,bottom: 1),
                        child: Container(
                          color: Colors.black,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.6,
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Les champs ci-dessous sont obligatoires ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                        child: TextField(
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
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
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
                        )
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 40,left: 1,top: 15),
                  child: NextButton(
                    onPressed: () {
                      setState(() {
                        page = 5;
                      });
                      // password validation ---

                    },
                  )
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 2,
          child: extraInformation(),
        )
      ]
    );
  }

  Widget registerInformationCandidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 2,
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Dites-en plus sur vous !',
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
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1,top: 2,bottom: 1),
                        child: Container(
                          color: Colors.black,
                          height: 1,
                          width: MediaQuery.of(context).size.width * 0.6,
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(left: 40,right: 1),
                        child: const Text(
                          'Les champs ci-dessous sont obligatoires ',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.black,
                            fontSize: 8,
                          ),
                        ),
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Statut professionnel',
                          ),
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Secteur d\'activité recherché',
                          ),
                        )
                      )
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(right: 40,left: 40,top: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFEEEEEE),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Expérience professionnel',
                          ),
                        )
                      )
                    )
                  ],
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 40,left: 1),
                  child: NextButton(
                    onPressed: () {
                      setState(() {
                        page = 6;
                      });
                      // validate information

                    },
                  )
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 2,
          child: extraInformation(),
        )
      ]
    );
  }

  Widget registerStep1Candidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 40,right: 1),
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
                  padding: const EdgeInsets.only(left: 40,right: 1),
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
                  padding: const EdgeInsets.only(right: 40,left: 40,top: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEEEEEE),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Text(
                                    '\"Nickname\"',
                                    style: const TextStyle(
                                      fontFamily: 'Quicksand',
                                      color: Color(0xFF3C3C3C),
                                      fontSize: 26,
                                    ),
                                  )
                                )
                              ),
                              Expanded(
                                flex: 2,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      // Nickname randomizer
                                      
                                    },
                                    icon: const Icon(Icons.shuffle_rounded, size: 40),
                                  )
                                )
                              )
                            ]
                          )
                        )
                      ),
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
                                )
                              )
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.only(top: 5),
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Pourquoi dois-je choisir un pseudonyme ?",
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF6F6F6F),
                                        fontSize: 10,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                      
                                      }
                                    ),
                                  ])
                                )
                              )
                            )
                          ],
                        )
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 7;
                              });
                              // Register nickname

                            },
                          ),
                        ),
                      )
                    ]
                  )
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 2,
          child: Container(),
        )
      ]
    );
  }

  Widget registerStep2Candidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 6,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 40,right: 1),
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
                  padding: const EdgeInsets.only(left: 40,right: 1),
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
                  padding: const EdgeInsets.only(right: 40,left: 40,top: 20),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: AvatarRandomizerButton(
                                onPressed: () {
                              
                                },
                                icon: Transform.flip(
                                  flipX: true,
                                  flipY: true,
                                  child: const Icon(Icons.shuffle_rounded, color: Color(0xFF939393), size: 35,),
                                ),
                                text: 'Couleur',
                              )
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [Color(0xFFE02800), Color(0xFFF8CAC0)], // will be changeable 
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )
                                  ),
                                  child: Image.asset('assets/images/cat-avatar.png', width: MediaQuery.of(context).size.width * 0.5), // will be changeable
                                ),
                              )
                            ),
                            Expanded(
                              flex: 1,
                              child: AvatarRandomizerButton(
                                onPressed: () {
                              
                                },
                                icon: const Icon(Icons.shuffle_rounded, color: Color(0xFF939393), size: 35),
                                text: 'Image',
                              )
                            ),
                          ],
                        )
                      ),
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
                                )
                              )
                            ),
                          ],
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: NextButton(
                            onPressed: () {
                              setState(() {
                                page = 8;
                              });
                              // register avatar

                            },
                          ),
                        ),
                      )
                    ]
                  )
                )
              )
            ]
          )
        ),
        Expanded(
          flex: 2,
          child: Container(),
        )
      ]
    );
  }

  Widget registerStep3Candidate(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: logoAdopte(context)
        ),
        Expanded(
          flex: 8,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 40,right: 1),
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
                  padding: const EdgeInsets.only(left: 40,right: 40),
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
                        )
                      ),
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
                        )
                      )
                    ],
                  )
                ),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFE8E8E8)
                    ),
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
                                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                                  child: const Text(
                                    '\"Soft-skill category\"',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Container(
                                    color: Colors.black,
                                    height: 2,
                                  )
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            // Soft-skills area (not selected)

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
                                    padding: const EdgeInsets.only(left: 130, right: 130, top: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFF747474), // color will be changeable depending the soft-skill category
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFC5C5C5), // color will be changeable depending the soft-skill category
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: Container(
                                    color: Colors.black,
                                    height: 2,
                                  )
                                ),
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
                            // Soft-skills area (selected)
                            
                          ),
                        ),
                      ],
                    )
                  ),
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 40),
                  child: NextButton(
                    onPressed: () {

                    },
                  ),
                ),
              )
            ]
          )
        )
      ]
    );
  }

  Widget logoAdopte(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5, top: 50),
      child: Image.asset('assets/images/adopte-logo-cropped.png', width: MediaQuery.of(context).size.width * 0.7),
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
    );
  }

  Widget _registerPage(BuildContext context) {
    // print(page);
    switch(page) {
      case 1:
        return registerChoicePage(context);
      case 2:
        return registerNameCandidate(context);
      case 3:
        return registerEmailCandidate(context);
      case 4:
        return registerPasswordCandidate(context);
      case 5:
        return registerInformationCandidate(context);
      case 6:
        return registerStep1Candidate(context);
      case 7:
        return registerStep2Candidate(context);
      case 8:
        return registerStep3Candidate(context);
      default:
        return registerChoicePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        body: _registerPage(context),
      ),
    );
  }
}

