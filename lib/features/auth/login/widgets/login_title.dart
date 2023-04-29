import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/Sizes.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '로그인',
        style: TextStyle(
          fontSize: Sizes.size24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
