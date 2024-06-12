import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:adopte_un_candidat/modules/database.dart';
import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  MessagesState createState() => MessagesState();
}

class MessagesState extends State<Messages> {
  dynamic messages;
  dynamic user;

  @override
  void initState() {
    super.initState();
    Authentication().getCurrentUser().then((value) {
      setState(() {
        user = value;
      });
      Database().getMessages(value!.uid).then(
        (data) {
          setState(() {
            messages = data;
          });
        },
      );
    });
  }

  dynamic newMessageTag(dynamic message) {
    if (message["seen"] == false && message["sender"] != user.uid) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
        ),
        child: Text(
            'NOUVEAU',
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 24,
              color: Colors.yellowAccent[700],
              fontFamily: 'Quicksand',
          ),
          )
      );
    } else {
      return Container();
    }
  }

  ListView messagesList(){
    return ListView(
                children: messages.entries.map<Widget>((entry) {
                  final key = entry.key;
                  final value = entry.value;

                  final lastmessageindex = value["messages"].length - 1;

                  final timestamp = value["messages"][lastmessageindex]["date"] as Timestamp;
                  final formattedDate = DateFormat('HH:mm, dd/MM/yyyy').format(timestamp.toDate());
                  

                  return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          onTap: () {
                            if (kDebugMode) {
                              context.pushNamed('chat');
                              print("id: $key");
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Row(children: [
                                CircleAvatar(
                                  radius: 40,
                                  foregroundImage: NetworkImage(value["userData"]["profile_picture"]),
                                  backgroundColor: value["userData"]["type"] == "company" ? const Color(0x00FFFFFF) : Color(int.parse("0xFF${value["userData"]["colors"][0]}")),
                                ),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    value["userData"]["name"],
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontFamily: 'Quicksand',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                                  ),

                                                  newMessageTag(value["messages"][lastmessageindex]),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${value["messages"][lastmessageindex]["sender"] == user.uid ? "Me:" : "They:"} ${value["messages"][lastmessageindex]["message"]}",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: 'Quicksand',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                             
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      formattedDate,
                                                      textAlign: TextAlign.end,
                                                      style: TextStyle(
                                                        fontSize: 8,
                                                        color: Colors.grey[500],
                                                        fontFamily: 'Quicksand',
                                                      ),
                                                    ),
                                                  ])
                                            ])))
                              ]))));
                }).toList(),
              );
  }

  @override
  Widget build(BuildContext context) {
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
              child: messages != null ? messagesList() : const Center(child: CircularProgressIndicator()),
            )
          ],
        )),
        bottomNavigationBar: const SuperNavigationBar(index: 0));
  }
}
