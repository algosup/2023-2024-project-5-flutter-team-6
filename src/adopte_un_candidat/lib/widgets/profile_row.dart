import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './alert_dialogue.dart';

class ProfileRowCategory extends StatelessWidget {
  final String title;

  const ProfileRowCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFA7207D),
          ),
        ),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileRowCommon extends StatelessWidget {
  final String title;
  final String content;
  final TextInputType type;
  final String functiontype;
  final String uid;

  const ProfileRowCommon(
      {super.key,
      required this.title,
      required this.content,
      required this.type,
      required this.functiontype,
      required this.uid});

  void _showChangeInfoDialog(BuildContext context, String title,
      TextInputType type, String uid, String functiontype) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeInfosProfile(
          title: title,
          type: type,
          uid: uid,
          functiontype: functiontype,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showChangeInfoDialog(context, title, type, uid, functiontype);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFA7207D),
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: SingleChildScrollView(
                    child: Text(
                      content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                    ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRowSoft extends StatelessWidget {
  final String title;
  final List<dynamic> content;

  const ProfileRowSoft({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('softskills');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: MediaQuery.of(context).size.height * 0.10,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFA7207D),
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    content[0],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRowPage extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileRowPage({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.10,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFA7207D),
            ),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRowUser extends StatelessWidget {
  final String username;
  final List<dynamic> colors;
  final String image;

  const ProfileRowUser(
      {super.key,
      required this.username,
      required this.colors,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFA7207D),
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Color(int.parse(
                  "0xFF${colors[0]}")), // Need to be colors choosen by the user
              foregroundImage: NetworkImage(
                image,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              username,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileRowCompany extends StatelessWidget {
  final String name;

  const ProfileRowCompany({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFA7207D),
          ),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(
                "https://firebasestorage.googleapis.com/v0/b/adopte-un-candidat.appspot.com/o/company%2Falgosup.png?alt=media&token=34e1a449-5117-4333-8ed8-561cff132621",
              ),
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: const TextStyle(decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}
