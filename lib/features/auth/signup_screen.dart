import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'sign-up';
  static const String routePath = '/';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('정규재'),
      ),
    );
  }
}
