import 'package:flutter/material.dart';

class ProfileRowCategory extends StatelessWidget {
  final String title;

  const ProfileRowCategory({
    super.key,
    required this.title
    });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ProfileRowCommon extends StatelessWidget {
  final String title;
  final String content;

  const ProfileRowCommon({
    super.key,
    required this.content,
    required this.title
    });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
