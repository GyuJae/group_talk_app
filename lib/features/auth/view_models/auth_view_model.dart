import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_talk_app/features/auth/models/auto_model.dart';
import 'package:group_talk_app/features/auth/repos/auth_repo.dart';

class AuthViewModel extends Notifier<AuthModel> {
  final AuthRepository _authRepository;

  AuthViewModel(this._authRepository);

  void setLoggedIn(String token) {
    _authRepository.setToken(token);
    _authRepository.setLoggedIn(true);
    state = AuthModel(token: token, isLoggedIn: true);
  }

  @override
  AuthModel build() {
    return AuthModel(
      token: _authRepository.getToken(),
      isLoggedIn: _authRepository.getIsLoggedIn(),
    );
  }
}

final authProvider = NotifierProvider<AuthViewModel, AuthModel>(
  () => throw UnimplementedError(),
);
