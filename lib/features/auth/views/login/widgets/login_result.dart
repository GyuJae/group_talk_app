import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_talk_app/constants/sizes.dart';
import 'package:group_talk_app/features/auth/views/login/view_models/login_view_model.dart';

class LoginResult extends ConsumerWidget {
  const LoginResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14, horizontal: Sizes.size12),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: ref.watch(loginProvider).when(data: (data) {
          return Text(
            data.error ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          );
        }, error: (error, stack) {
          return Text(error.toString());
        }, loading: () {
          return const Text("");
        }),
      ),
    );
  }
}
