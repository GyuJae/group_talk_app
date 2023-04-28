import 'package:flutter/material.dart';

void main() {
  runApp(const GroupTalkApp());
}

class GroupTalkApp extends StatelessWidget {
  const GroupTalkApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Group Talk App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
