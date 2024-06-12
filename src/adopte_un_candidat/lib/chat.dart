import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  ChatState createState() => ChatState();
}

class ChatState extends State<Chat> {
  final TextEditingController _controller = TextEditingController();
  final List<String> messages = <String>[];

  Widget senderMessage(){
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 10, right: 118),
      title: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Text(
            "Hello, How can I help you?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12
            ),
          )
        ),
      leading: const CircleAvatar(
        radius: 14,
        foregroundImage: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/adopte-un-candidat.appspot.com/o/company%2Falgosup.png?alt=media&token=34e1a449-5117-4333-8ed8-561cff132621",
        ),
        backgroundColor: Color(0x00FFFFFF),
      ),
    );
  }

  Widget reveiverMessage() {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 118, right: 10),
      title: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          "Hello, I would like to know more about your company.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 12
          ),
        )
      ),
    );
  }

  Widget loadMessages(int index) {
  
    if (index % 2 == 0) {
      return senderMessage();
    } else {
      return reveiverMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
           mainAxisSize: MainAxisSize.min, // Ensures the Row takes minimal space
            mainAxisAlignment: MainAxisAlignment.center,
           children: [
            CircleAvatar(
                radius: 20,
                foregroundImage:
                    NetworkImage(
                      "https://firebasestorage.googleapis.com/v0/b/adopte-un-candidat.appspot.com/o/company%2Falgosup.png?alt=media&token=34e1a449-5117-4333-8ed8-561cff132621",
                    ),
                backgroundColor: Color(0x00FFFFFF),
              ),
              SizedBox(width: 10,),
              Text(
                'ALGOSUP',
                style: TextStyle(
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
            child: ListView.builder(
              itemCount: 4,//messages.length,
              itemBuilder: (BuildContext context, int index) {
                return loadMessages(index);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child:
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: 
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Message ...',
                  labelStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 8,
                    fontFamily: 'Quicksand',
                  ),
                  suffixIcon: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (kDebugMode) {
                        print("Message sent: ${_controller.text.trim()}");
                      }
                      // TODO: Add message logic
                    },
                  ),
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