import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final dynamic user;

  const Cards({super.key, required this.user});

  final bool versoShowed = false;

  Widget displayCommonSoftSkills() {
    return user["proposal"]["soft_skill"] != null
        ? GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(
                user["proposal"]["soft_skill"]["Analytical"].length,
                (index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF38A0FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user["proposal"]["soft_skill"]["Analytical"][index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              );
            }),
          )
        : Container(); // return an empty Container if softskill is null
  }

  Widget displayCandidatSoftSkills() {
    return user["soft_skill"] != null
        ? GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: List.generate(
                user["soft_skill"]["Analytical"].length,
                (index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF38A0FF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  user["soft_skill"]["Analytical"][index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  ),
                ),
              );
            }),
          )
        : Container(); // return an empty Container if softskill is null
  }

  Widget cardRecto() {

    if (user["type"] == 'company') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  user["picture_profile"],
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user["name"],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: CupertinoColors.black,
                          fontFamily: 'QuickSand',
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      user["motto"],
                      style: const TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 12,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Text(
                      textAlign: TextAlign.left,
                      user["description"]["fr"],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 8,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          // versoShowed = true;
                          if (kDebugMode) {
                            print("Read more has been pressed");
                          }
                        },
                        child: Text("Lire plus",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 6,
                              fontFamily: 'Roboto',
                            )))
                  ],
                ))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Informations:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB565F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        user["proposal"]["activity_sector"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7DC3EA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        user["proposal"]["location"]["on_remote"].toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB565F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "54km",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF7DC3EA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        user["proposal"]["salary"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB565F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        user["proposal"]["contract"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Soft skills en commun:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    displayCommonSoftSkills()
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Taux de compatibilité:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 82,
                                  height: 82,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(color: Colors.green, width: 8),
                                  ),
                                  child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Bon",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "60%",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ])),
                            ]))
                  ],
                )
              ])),
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  user["profile_picture"],
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user["username"],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: CupertinoColors.black,
                          fontFamily: 'QuickSand',
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text(
                  "Distance:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GridView.count(
                  crossAxisCount: 3,
                  padding: const EdgeInsets.all(5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  childAspectRatio: 4,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFB565F4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "54km",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Soft skills en commun:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    displayCandidatSoftSkills()
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Taux de compatibilité:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  width: 82,
                                  height: 82,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border:
                                        Border.all(color: Colors.green, width: 8),
                                  ),
                                  child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Bon",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "60%",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ])),
                            ]))
                  ],
                )
              ])),
        ],
      );
    }
  }

  Widget cardVerso() {
    return GestureDetector(
        onTap: () {
          // versoShowed = false;
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      user["picture_profile"],
                      width: 48,
                      height: 48,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          user["name"],
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: CupertinoColors.black,
                              fontFamily: 'QuickSand',
                              fontSize: 14,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          user["motto"],
                          style: const TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        const Text(
                          textAlign: TextAlign.left,
                          "4 recrutements effectués en 2 Ans.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 8,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          user["description"]["fr"],
                          style: const TextStyle(
                            color: CupertinoColors.black,
                            fontSize: 12,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  if (kDebugMode) {
                                    print("Website has been pressed");
                                  }
                                },
                                child: Text(
                                  user["website"],
                                  style: const TextStyle(
                                    color: CupertinoColors.activeBlue,
                                    fontSize: 12,
                                    fontFamily: 'Roboto',
                                  ),
                                )))
                      ]),
                ),
              )
            ]));
  }

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(int.parse("0xFF${user["colors"][0]}")),
                Color(int.parse("0xFF${user["colors"][1]}")),
              ],
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(15),
            ),
            child: versoShowed ? cardVerso() : cardRecto(),
          ),
        ));
  }
}
