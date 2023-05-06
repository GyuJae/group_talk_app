import 'package:flutter/material.dart';

class UsernameTextField extends StatelessWidget {
  final TextEditingController controller;

  const UsernameTextField({
    super.key,
    required this.controller,
  });

  void _clearText() {
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '이름을 입력해주세요';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "이름",
        labelStyle: TextStyle(
          color: Colors.grey.shade500,
        ),
        hintText: "이름을 입력해주세요",
        hintStyle: TextStyle(
          color: Colors.grey.shade300,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
          ),
        ),
        suffix: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.grey.shade400,
          ),
          onPressed: _clearText,
        ),
      ),
    );
  }
}
