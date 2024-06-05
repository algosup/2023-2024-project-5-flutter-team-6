import 'package:adopte_un_candidat/modules/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../company_cards.dart';
import 'package:adopte_un_candidat/modules/database.dart';

class Cards extends StatelessWidget {
  final CompanyCard candidate;

  Cards({super.key, required this.candidate});

  Database database = Database();

  @override
  Widget build(BuildContext context) {
      var user = database.getUser(0);
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
      //bottom part//
      child: Column(
        children: [
          Flexible(
            //Start of outer box (gradient)//
            child: Container(
              padding: const EdgeInsets.all(15), // Add padding here
              decoration: BoxDecoration(
                gradient: candidate.color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              //End of outer box (gradient)

              //--//
              child: Row(
                // Start Inner white box//
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: CupertinoColors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                                  "snapshot.data!",
                                  width: 100,
                                  height: 100,
                                )
                          ),
                          Text(
                            "company.name",
                            style: const TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      
                          Text(
                            candidate.job!,
                            style: const TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
