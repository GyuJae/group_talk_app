import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const String _token = "token";
  static const String _isLoggedIn = "isLoggedIn";

  final SharedPreferences _sharedPreferences;

  AuthRepository(this._sharedPreferences);

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(_token, token);
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    await _sharedPreferences.setBool(_isLoggedIn, isLoggedIn);
  }

  String getToken() {
    return _sharedPreferences.getString(_token) ?? "";
  }

  bool getIsLoggedIn() {
    return _sharedPreferences.getBool(_isLoggedIn) ?? false;
  }
}
