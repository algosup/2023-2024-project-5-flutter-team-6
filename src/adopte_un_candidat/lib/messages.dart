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
      backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(35),
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.center,
                    height: 50,
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
                            // research the profile written
                          },
                          icon: Image.asset('assets/icons/search-icon.png', width: MediaQuery.of(context).size.width * 0.06),
                        )
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
