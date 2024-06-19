
import 'package:adopte_un_candidat/modules/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/navigation_bar.dart';
import 'modules/database.dart';

// TODO: everything is prepared, the cards of the companies as well of the users. They just need to link them to the database.
// Every part that uses the database are put into comments so they don't block to do the frontend. If the database is linked, you just have to get them out of the comments.

class Favorites extends StatefulWidget {

  const Favorites({super.key});

  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {

  Database database = Database();
  List<dynamic>? cardStack;
  dynamic user;

  ListView savedProfilesList(BuildContext context) {
    return ListView.separated(
      itemCount: cardStack!.length,
      itemBuilder: (BuildContext context, int index) {
        return detailedCards();
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white,),
    );
  }

  Widget emptyMessage() {
    return const Center(
      child: Text(
        "Votre listes est vides !\nPeut-être que vos choix étaient les bons !",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.black,
          fontSize: 26,
        ),
      )
    );
  }

  Widget reducedCards() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(int.parse("0xFF${user["colors"][0]}")),
                  // Color(int.parse("0xFF${user["colors"][1]}")),
                  Color(0xFFE0004D),
                  Color(0xFFF8C0D4),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: reducedCardsChoice(),
            )
          ),
        ),
      ),
    );
  }

  Widget reducedCardsChoice() {
    // if (user["type"] == 'company') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image.network(
                //   // user["profile_picture"],
                //   width: 48,
                //   height: 48,
                // ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                      'feur',// user["name"],
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'QuickSand',
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                      ),
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
              child: Column( crossAxisAlignment: CrossAxisAlignment.start, 
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
                          // child: Text(
                          //   user["proposal"]["activity_sector"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7DC3EA),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // child: Text(
                          //   // getRemoteLabel(user["proposal"]["location"]["on_remote"]),
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
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
                          // child: Text(
                          //   user["proposal"]["salary"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB565F4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // child: Text(
                          //   user["proposal"]["contract"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
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
                    )
                  )
                ]
              )
            )
          ),
        ],
      );
    // }
    // else {
    //   return Column(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         flex: 4,
    //         child: Container(
    //         padding: const EdgeInsets.all(10),
    //         decoration: BoxDecoration(
    //           color: CupertinoColors.white,
    //           borderRadius: BorderRadius.circular(15),
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Image.network(
    //               user["profile_picture"],
    //               width: 48,
    //               height: 48,
    //             ),
    //             const SizedBox(width: 10),
    //             Expanded(
    //                 child: Text(
    //                   user["name"],
    //                   textAlign: TextAlign.left,
    //                   style: const TextStyle(
    //                     color: CupertinoColors.black,
    //                     fontFamily: 'QuickSand',
    //                     fontSize: 18,
    //                     decoration: TextDecoration.underline,
    //                     fontWeight: FontWeight.bold
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //       Expanded(
    //         flex: 6,
    //         child: Padding(
    //           padding: const EdgeInsets.only(left: 15, right: 15),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               const Expanded(
    //                 flex: 1,
    //                 child: Text(
    //                   "Soft skills en commun:",
    //                   style: TextStyle(
    //                     color: Colors.black,
    //                     fontSize: 8,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 flex: 4,
    //                 child: Container(),//displayCandidatSoftSkills(),
    //               ),
    //               Expanded(
    //                 flex: 1,
    //                 child: Container(
    //                   alignment: Alignment.topCenter,
    //                   child: Divider(
    //                     color: Colors.grey[300],
    //                     thickness: 2,
    //                   ),
    //                 )
    //               )
    //             ],
    //           )
    //         )
    //       ),
    //     ],
    //   );
    // }
  }

  Widget detailedCards() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.65,
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(int.parse("0xFF${user["colors"][0]}")),
                  // Color(int.parse("0xFF${user["colors"][1]}")),
                  Color(0xFFE0004D),
                  Color(0xFFF8C0D4),
                ],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: detailedCardsChoice(),
            )
          ),
        ),
      ),
    );
  }

  Widget detailedCardsChoice() {
    // if (user["type"] == 'company') {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: CupertinoColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Image.network(
                //   user["profile_picture"],
                //   width: 48,
                //   height: 48,
                // ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Text(
                    //   user["name"],
                    //   textAlign: TextAlign.left,
                    //   style: const TextStyle(
                    //       color: CupertinoColors.black,
                    //       fontFamily: 'QuickSand',
                    //       fontSize: 14,
                    //       decoration: TextDecoration.underline,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // Text(
                    //   user["motto"],
                    //   style: const TextStyle(
                    //     color: CupertinoColors.black,
                    //     fontSize: 12,
                    //     fontFamily: 'Roboto',
                    //   ),
                    // ),
                    // Text(
                    //   textAlign: TextAlign.left,
                    //   user["description"]["fr"],
                    //   overflow: TextOverflow.ellipsis,
                    //   maxLines: 2,
                    //   style: const TextStyle(
                    //     color: CupertinoColors.black,
                    //     fontSize: 8,
                    //     fontFamily: 'Roboto',
                    //   ),
                    // ),
                  ],
                ))
              ],
            ),
          ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start, 
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
                          // child: Text(
                          //   user["proposal"]["activity_sector"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFF7DC3EA),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // child: Text(
                          //   getRemoteLabel(user["proposal"]["location"]["on_remote"]),
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
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
                          // child: Text(
                          //   user["proposal"]["salary"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xFFB565F4),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // child: Text(
                          //   user["proposal"]["contract"],
                          //   textAlign: TextAlign.center,
                          //   style: const TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 8,
                          //   ),
                          // ),
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
                    )
                  )
                ]
              )
            )
          ),
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
                    child: Container(),//displayCommonSoftSkills(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: 2,
                      ),
                    )
                  )
                ],
              )
            )
          ),
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
                    flex: 4,
                    child: Center(
                      child: Container(
                        width: 82,
                        height: 82,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.green, width: 8),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                      )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: LargeFloatingActionButton(
                            onPressed: () {

                            },
                            gradient: myGradientRefuse,
                            child: const Icon(Icons.clear_rounded, size: 25.0, color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: LargeFloatingActionButton(
                            onPressed: () {

                            },
                            gradient: myGradientAccept,
                            child: const Icon(Icons.check_rounded, size: 25.0, color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              )
            )
          )
        ],
      );
    // } else {
      // return Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Expanded(
      //       flex: 4,
      //       child: Container(
      //       padding: const EdgeInsets.all(10),
      //       decoration: BoxDecoration(
      //         color: CupertinoColors.white,
      //         borderRadius: BorderRadius.circular(15),
      //       ),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           Image.network(
      //             user["profile_picture"],
      //             width: 48,
      //             height: 48,
      //           ),
      //           const SizedBox(width: 10),
      //           Expanded(
      //               child: Text(
      //                 user["name"],
      //                 textAlign: TextAlign.left,
      //                 style: const TextStyle(
      //                   color: CupertinoColors.black,
      //                   fontFamily: 'QuickSand',
      //                   fontSize: 18,
      //                   decoration: TextDecoration.underline,
      //                   fontWeight: FontWeight.bold
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       flex: 3,
      //       child: Container(
      //         padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      //         child: Column( crossAxisAlignment: CrossAxisAlignment.start, 
      //           children: [
      //             const Expanded(
      //               flex: 1,
      //               child: Text(
      //                 "Disctance:",
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 8,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 4,
      //               child: GridView.count(
      //                 crossAxisCount: 3,
      //                 padding: const EdgeInsets.all(5),
      //                 shrinkWrap: true,
      //                 physics: const NeverScrollableScrollPhysics(),
      //                 childAspectRatio: 4,
      //                 mainAxisSpacing: 5,
      //                 crossAxisSpacing: 5,
      //                 children: [
      //                   Container(
      //                     alignment: Alignment.center,
      //                     decoration: BoxDecoration(
      //                       color: const Color(0xFFB565F4),
      //                       borderRadius: BorderRadius.circular(15),
      //                     ),
      //                     child: const Text(
      //                       "54km",
      //                       textAlign: TextAlign.center,
      //                       style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: 8,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Container(
      //                 alignment: Alignment.topCenter,
      //                 child: Divider(
      //                   color: Colors.grey[300],
      //                   thickness: 2,
      //                 ),
      //               )
      //             )
      //           ]
      //         )
      //       )
      //     ),
      //     Expanded(
      //       flex: 6,
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 15, right: 15),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             const Expanded(
      //               flex: 1,
      //               child: Text(
      //                 "Soft skills en commun:",
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 8,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 4,
      //               child: displayCandidatSoftSkills(),
      //             ),
      //             Expanded(
      //               flex: 1,
      //               child: Container(
      //                 alignment: Alignment.topCenter,
      //                 child: Divider(
      //                   color: Colors.grey[300],
      //                   thickness: 2,
      //                 ),
      //               )
      //             )
      //           ],
      //         )
      //       )
      //     ),
      //     Expanded(
      //       flex: 8,
      //       child: Padding(
      //         padding: const EdgeInsets.only(left: 15, right: 15),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             const Expanded(
      //               flex: 1,
      //               child: Text(
      //                 "Taux de compatibilité:",
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 8,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               flex: 4,
      //               child: Center(
      //                 child: Container(
      //                   width: 82,
      //                   height: 82,
      //                   decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(100),
      //                     border: Border.all(color: Colors.green, width: 8),
      //                   ),
      //                   child: const Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Text(
      //                         "Bon",
      //                         style: TextStyle(
      //                           color: Colors.black,
      //                           fontSize: 12,
      //                         ),
      //                       ),
      //                       Text(
      //                         "60%",
      //                         style: TextStyle(
      //                           color: Colors.black,
      //                           fontSize: 18,
      //                         ),
      //                       ),
      //                     ]
      //                   )
      //                 )
      //               ),
      //             ),
                  //   Expanded(
                  //   flex: 2,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: LargeFloatingActionButton(
                  //           onPressed: () {

                  //           },
                  //           gradient: myGradientRefuse,
                  //           child: const Icon(Icons.clear_rounded, size: 25.0, color: Colors.white),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: LargeFloatingActionButton(
                  //           onPressed: () {

                  //           },
                  //           gradient: myGradientAccept,
                  //           child: const Icon(Icons.check_rounded, size: 25.0, color: Colors.white),
                  //         ),
                  //       ),
                  //     ],
                  //   )
                  // )
      //           ],
      //         )
      //       )
      //     )
      //   ],
      // );
    // }
    
  }

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
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 15),
                      child: IconButton(
                        onPressed: () {
                          context.pushNamed('profile');
                        },
                        icon: const Icon(Icons.arrow_back_rounded, size: 40),
                      )
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFEEEEEE),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          hintText: 'Rechercher',
                          suffixIcon: IconButton(
                            padding: const EdgeInsets.only(right: 10),
                            onPressed: () {
                              // TODO: research the profile written
                            },
                            icon: Image.asset('assets/icons/search-icon.png', width: MediaQuery.of(context).size.width * 0.06),
                          )
                        ),
                      )
                    )
                  )
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: FutureBuilder<List<dynamic>?>(
                future: database.getStack(),
                builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    cardStack = snapshot.data;
                    if (cardStack != null) {
                      // savedProfilesList(context);
                      user = cardStack;
                      return savedProfilesList(context);
                    }
                    else {
                      return emptyMessage();
                    }
                  }
                }
              )
            ),
          ],
        ),
        bottomNavigationBar: const SuperNavigationBar(index: 2),
      ),
    );
  }
}