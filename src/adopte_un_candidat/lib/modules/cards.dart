import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final dynamic user;

  const Cards({super.key, required this.user});

  final bool versoShowed = false;

  String getRemoteLabel(int onRemote) {
    switch (onRemote) {
      case 0:
        return "Non renseigné";
      case 1:
        return "Sur site";
      case 2:
        return "Télétravail";
      case 3:
        return "sur site/télétravail";
      default:
        return "Non renseigné";
    }
  }

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
            children: generateSoftskills(user["proposal"]["soft_skill"]),
          )
        : Container(); // return an empty Container if softskill is null
  }

  List<Widget> generateSoftskills(Map<String, dynamic> softskills) {
    List<Widget> softskillsList = [];

    for (int i = 0; i < softskills["Analytical"].length; i++) {
      softskillsList.add(Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFC4F),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          softskills["Analytical"][i],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8,
          ),
        ),
      ));
    }

    for (int i = 0; i < softskills["Interpersonal"].length; i++) {
      softskillsList.add(Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF84FF7B),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          softskills["Interpersonal"][i],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8,
          ),
        ),
      ));
    }

    for (int i = 0; i < softskills["Self-management"].length; i++) {
      softskillsList.add(Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFFF7474),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          softskills["Self-management"][i],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8,
          ),
        ),
      ));
    }

    for (int i = 0; i < softskills["Social"].length; i++) {
      softskillsList.add(Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFF38A0FF),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          softskills["Social"][i],
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 8,
          ),
        ),
      ));
    }

    return softskillsList;
  }

  Widget displayCandidatSoftSkills() {
    return user["soft_skills"] != null
        ? GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(5),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: generateSoftskills(user["soft_skills"]),
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
          Expanded(
              flex: 6,
              child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Informations:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: GridView.count(
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
                                  getRemoteLabel(user["proposal"]["location"]
                                      ["on_remote"]),
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
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 2,
                              ),
                            ))
                      ]))),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Soft skills en commun:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: displayCommonSoftSkills(),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2,
                            ),
                          ))
                    ],
                  ))),
          Expanded(
              flex: 8,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Taux de compatibilité:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                            child: Container(
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
                                    ]))),
                      )
                    ],
                  )))
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
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
                    child: Text(
                      user["name"],
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: CupertinoColors.black,
                          fontFamily: 'QuickSand',
                          fontSize: 18,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                  padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: Text(
                            "Disctance:",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: GridView.count(
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
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topCenter,
                              child: Divider(
                                color: Colors.grey[300],
                                thickness: 2,
                              ),
                            ))
                      ]))),
          Expanded(
              flex: 6,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Soft skills en commun:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          child: displayCandidatSoftSkills(),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.topCenter,
                            child: Divider(
                              color: Colors.grey[300],
                              thickness: 2,
                            ),
                          ))
                    ],
                  ))),
          Expanded(
              flex: 8,
              child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Text(
                          "Taux de compatibilité:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Center(
                            child: Container(
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
                                    ]))),
                      )
                    ],
                  )))
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
