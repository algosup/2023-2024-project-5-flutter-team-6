import 'package:adopte_un_candidat/modules/authentication.dart';
import 'package:adopte_un_candidat/modules/database.dart';
import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String conversationId;
  const Chat({super.key, required this.conversationId});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  final TextEditingController messageController = TextEditingController();
  dynamic user;
  dynamic secondaryUser;
  dynamic messages;
  late String conversationId;

  @override
  void initState() {
    super.initState();
    conversationId = widget.conversationId;
    Authentication().getCurrentUser().then(
      (value) {
        setState(() {
          user = value;
        });
        Database().getMessages(value!.uid).then(
        (data) {
          setState(() {
            messages = data![conversationId]["messages"];
            secondaryUser = data[conversationId]["userData"];
          });
          Database().readMessage(conversationId, user.uid);
        },
      );
      }
    );
  }

  

  Widget senderMessage(String content, String picture){
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 118),
      title: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12
            ),
          )
        ),
      leading: CircleAvatar(
        radius: 14,
        foregroundImage: NetworkImage(
          picture,
        ),
        backgroundColor: const Color(0x00FFFFFF),
      ),
    );
  }

  Widget reveiverMessage(String content) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 118, right: 10),
      title: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          content,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12
          ),
        )
      ),
    );
  }

  Widget conversation() {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];

        if (message['sender'] == user.uid) {
          return reveiverMessage(message['message']);
        } else {
          return senderMessage(message['message'], secondaryUser["profile_picture"]);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min, // Ensures the Row takes minimal space
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 20,
                foregroundImage:
                    NetworkImage(
                      secondaryUser != null ? secondaryUser["profile_picture"] : "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                    ),
                backgroundColor: const Color(0x00FFFFFF),
              ),
              const SizedBox(width: 10,),
              Text(
                secondaryUser != null ? secondaryUser["name"] : 'Loading...',
                style: const TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                  decoration: TextDecoration.underline,
                ),
              ),
           ]
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: messages != null ? conversation() : const Center(child: CircularProgressIndicator()),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child:
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: messageController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFEEEEEE),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  hintText: 'Message ...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (kDebugMode) {
                        print("Message sent: ${messageController.text.trim()}");
                      }
                      print(secondaryUser);
                      print(user.uid);
                      Database().sendMessage(conversationId, user.uid, secondaryUser["uid"], messageController.text.trim());
                      messageController.clear();
                    },
                    icon: const Icon(Icons.send),
                  )
                ),
              )
            )
          ),
        ],
      ),
      bottomNavigationBar: const SuperNavigationBar(index: 0),
    );
  }
}