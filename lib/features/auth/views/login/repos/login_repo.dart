import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  static const String baseUrl = "http://localhost:8080/users";

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "username": username,
          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (error) {
      throw Error();
    }
  }
}

final loginRepo = Provider((ref) => LoginRepository());
