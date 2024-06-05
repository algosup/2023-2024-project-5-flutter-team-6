import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final company;

  Cards({super.key, required this.company});

  Widget displayCommonSoftSkills(){
    // int i = 0;
    // for (var softskills in company["soft_skills"]) {
    //   ++i;
    //   for (var softskill in softskills) {
        
    //   }
    // }
    // int i = 0;

    return company["proposal"]["soft_skill"] != null 
  ? GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 4,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(company["proposal"]["soft_skill"]["Analytical"].length, (index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF38A0FF),
            borderRadius: BorderRadius.circular(15),
          ),  
          child: Text(
            company["proposal"]["soft_skill"]["Analytical"][index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
          ),
        );
      }),
    )
  : Container();  // return an empty Container if softskill is null
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
                    Color(int.parse("0xFF${company["colors"][0]}")),
                    Color(int.parse("0xFF${company["colors"][1]}")),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: 
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  company["picture_profile"],
                                  width: 48,
                                  height: 48,
                                ),
                                const SizedBox(width: 10),
                              Expanded(
                                child:Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      company["name"],
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        color: CupertinoColors.black,
                                        fontFamily: 'QuickSand',
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text(
                                      company["motto"],
                                      style: const TextStyle(
                                        color: CupertinoColors.black,
                                        fontSize: 12,
                                        fontFamily: 'Roboto',          
                                      ),
                                    ),
                                    Text(
                                      textAlign: TextAlign.left,
                                      company["description"]["fr"],
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
                                        // TODO: Add the card flip
                                        if (kDebugMode) {
                                          print("Read more has been pressed");
                                        }
                                      },
                                      child: Text(
                                        "Lire plus",
                                        style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 6,
                                          fontFamily: 'Roboto',
                                        )
                                      )
                                    )
                                    ],
                                  )
                                )
                              ],
                            ),
                          ),

                          
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  childAspectRatio: 4,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  children: [
                                    // Add your grid elements here
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFB565F4),
                                        borderRadius: BorderRadius.circular(15),
                                      ),  
                                      child: Text(
                                        company["proposal"]["activity_sector"],
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
                                        company["proposal"]["location"]["on_remote"].toString(),
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
                                        company["proposal"]["salary"],
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
                                        company["proposal"]["contract"],
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

                                Container(
                                  child: Column(
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
                                  )
                                ),

                                Divider(
                                  color: Colors.grey[300],
                                  thickness: 2,
                                ),

                                Container(
                                  child: Column(
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
                                      Container(
                                        alignment: Alignment.center,
                                        width: 72,
                                        height: 72,
                                        decoration: BoxDecoration(
                                          // color: const Color(0xFF38A0FF),
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                          color: Colors.green,
                                          width: 8
                                        ),
                                        ), 
                                        child: const Column(
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
                                          ]
                                        )
                                      ),
                                    ],
                                  )
                                )
                              ]
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
    );
  }
}
