import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_talk_app/constants/gaps.dart';
import 'package:group_talk_app/constants/sizes.dart';
import 'package:group_talk_app/features/auth/login/screen.dart';

class SignUpBottomBar extends StatelessWidget {
  const SignUpBottomBar({super.key});

  void _onTapRouteLogin(BuildContext context) {
    context.pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size32,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('이미 회원이신가요?'),
          Gaps.h4,
          GestureDetector(
            onTap: () => _onTapRouteLogin(context),
            child: Text(
              '로그인 하러가기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
