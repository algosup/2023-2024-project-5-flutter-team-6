import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'modules/buttons.dart';
// import 'package:flutter/services.dart';



class Register extends StatelessWidget {
  const Register({super.key});

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
                child: Container(
                  // color: Colors.blue,
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
                            obscureText: true,
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
                child: Container(
                  // color: Colors.blue,
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
                )
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.only(right: 40,left: 1,top: 15),
                  child: NextButton(
                    onPressed: () {

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
                child: Container(
                  // color: Colors.blue,
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
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 40,left: 1),
                  child: NextButton(
                    onPressed: () {
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset : false,
        body: registerChoicePage(context),
        
      ),
    );
  }
}

