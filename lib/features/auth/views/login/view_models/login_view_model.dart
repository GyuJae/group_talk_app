import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_talk_app/features/auth/views/login/models/login_model.dart';
import 'package:group_talk_app/features/auth/views/login/repos/login_repo.dart';
import 'package:group_talk_app/features/auth/view_models/auth_view_model.dart';
import 'package:group_talk_app/features/home/home_screen.dart';

class LoginViewModel extends AsyncNotifier<LoginModel> {
  late final LoginRepository _loginRepository;

  @override
  FutureOr<LoginModel> build() {
    _loginRepository = ref.read(loginRepo);
    return LoginModel(ok: false);
  }

  Future<void> login({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    try {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() async {
        final response = await _loginRepository.login(username, password);
        final result = LoginModel.fromJson(response);

        return result;
      });
      state.whenData((value) {
        if (value.ok && value.token != null) {
          ref.read(authProvider.notifier).setLoggedIn(value.token!);
          context.goNamed(HomeScreen.routeName);
        }
      });
    } catch (error) {
      throw Error();
    }
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, LoginModel>(
  () => LoginViewModel(),
);
