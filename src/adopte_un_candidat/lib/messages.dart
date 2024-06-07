import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(35),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    height: 25.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Rechercher...',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5), // Adjusted padding
                      ),
                    ))),
            Expanded(
                child: ListView(children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          context.pushNamed('chat');
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Row(children: [
                            const CircleAvatar(
                              radius: 40,
                              foregroundImage:
                                  AssetImage('assets/images/Algosup_logo.png'),
                              backgroundColor: Color(0x00FFFFFF),
                            ),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'ALGOSUP',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Quicksand',
                                                    fontWeight: FontWeight.bold,
                                                    decoration: TextDecoration
                                                        .underline),
                                              ),
                                            ],
                                          ),
                                          const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Moi: Bonjour!',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Quicksand',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '7:37, 24/03/2024',
                                                  textAlign: TextAlign.end,
                                                  style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.grey[500],
                                                    fontFamily: 'Quicksand',
                                                  ),
                                                ),
                                              ])
                                        ])))
                          ]))))
            ]))
          ],
        )),
        bottomNavigationBar: const SuperNavigationBar(index: 0)
    );
  }
}
