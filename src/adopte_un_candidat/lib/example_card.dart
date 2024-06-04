import 'package:flutter/cupertino.dart';

import 'company_cards.dart';

class ExampleCard extends StatelessWidget {
  final CompanyCard candidate;

  const ExampleCard({super.key, required this.candidate});

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
                            //child:
                          //Image.network('https://github.com/algosup/2023-2024-project-5-flutter-team-6/blob/dev/src/Assets/Algosup_logo.png')
                          ),

                            Text(
                            candidate.companyName!,
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
