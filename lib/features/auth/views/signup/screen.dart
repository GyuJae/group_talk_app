import 'package:flutter/material.dart';
import 'package:group_talk_app/constants/Sizes.dart';
import 'package:group_talk_app/constants/gaps.dart';
import 'package:group_talk_app/features/auth/views/signup/widgets/signup_bottom_bar.dart';
import 'package:group_talk_app/features/auth/views/signup/widgets/signup_title.dart';
import 'package:group_talk_app/features/auth/views/widgets/form_button.dart';
import 'package:group_talk_app/features/auth/views/widgets/password_text_field.dart';
import 'package:group_talk_app/features/auth/views/widgets/username_text_field.dart';

enum FormDataKey {
  username,
  password,
}

class SignUpScreen extends StatefulWidget {
  static const String routeName = 'sign-up';
  static const String routePath = '/sign-up';

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
                    controller: _usernameController,
                  ),
                  PasswordTextField(
                    controller: _passwordController,
                  ),
                  Gaps.v36,
                  GestureDetector(
                    onTap: _onFormSubmit,
                    child: FormButton(
                      isFormValid: _formKey.currentState != null &&
                          _formKey.currentState!.validate(),
                      text: '가입하기',
                      isLoading: true,
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
