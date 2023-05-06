import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:group_talk_app/constants/gaps.dart';
import 'package:group_talk_app/constants/sizes.dart';

class LoginBottomBar extends StatelessWidget {
  const LoginBottomBar({super.key});

  void _onTapRouteLogin(BuildContext context) {
    context.pop();
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
          const Text('처음 이용하시는 건가요?'),
          Gaps.h4,
          GestureDetector(
            onTap: () => _onTapRouteLogin(context),
            child: Text(
              '가입 하러가기',
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
