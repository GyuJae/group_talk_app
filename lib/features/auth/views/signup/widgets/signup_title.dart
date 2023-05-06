import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/Sizes.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '회원가입',
        style: TextStyle(
          fontSize: Sizes.size24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
