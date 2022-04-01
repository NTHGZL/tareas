import 'package:flutter/material.dart';

class CircleAvatarInitials extends StatelessWidget{
  const CircleAvatarInitials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.indigo,
      child: Text('NG'),
    );
  }

}