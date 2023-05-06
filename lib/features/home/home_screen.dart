import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "home";
  static const String routePath = "/";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
