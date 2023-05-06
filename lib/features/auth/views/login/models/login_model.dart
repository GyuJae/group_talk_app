import 'package:group_talk_app/features/auth/models/user_model.dart';
import 'package:group_talk_app/shared/models/core_model.dart';

class LoginModel extends CoreModel {
  final String? token;
  final UserModel? user;

  LoginModel({
    required bool ok,
    String? error,
    this.token,
    this.user,
  }) : super(
          ok: ok,
          error: error,
        );

  LoginModel.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        user = json['user'] != null ? UserModel.fromJson(json['user']) : null,
        super(
          ok: json['ok'],
          error: json['error'],
        );
}
