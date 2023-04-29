import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/Sizes.dart';
import 'package:group_talk_app/constants/gaps.dart';
import 'package:group_talk_app/features/auth/signup/widgets/signup_bottom_bar.dart';
import 'package:group_talk_app/features/auth/signup/widgets/signup_title.dart';
import 'package:group_talk_app/features/auth/widgets/username_text_field.dart';
import 'package:group_talk_app/features/auth/widgets/form_button.dart';
import 'package:group_talk_app/features/auth/widgets/password_text_field.dart';

enum FormDataKey {
  username,
  password,
}

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'sign-up';
  static const String routePath = '/';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<FormDataKey, String> _formData = {
    FormDataKey.username: '',
    FormDataKey.password: '',
  };

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _formData[FormDataKey.username] = _usernameController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _formData[FormDataKey.password] = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onFormSubmit() {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }

    // TODO: Implement form submit
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(Sizes.size24),
              child: Column(
                children: [
                  const SignUpTitle(),
                  UsernameTextField(
                    labelText: '이름',
                    hintText: '이름을 입력해주세요',
                    controller: _usernameController,
                  ),
                  PasswordTextField(
                    labelText: '비밀번호',
                    hintText: '비밀번호를 입력해주세요',
                    controller: _passwordController,
                  ),
                  Gaps.v36,
                  GestureDetector(
                    onTap: _onFormSubmit,
                    child: FormButton(
                      isFormValid: _formKey.currentState != null &&
                          _formKey.currentState!.validate(),
                      text: '가입하기',
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomAppBar(
            elevation: 2,
            child: SignUpBottomBar(),
          ),
        ),
      ),
    );
  }
}
