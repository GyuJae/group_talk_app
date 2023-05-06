import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_talk_app/constants/Sizes.dart';
import 'package:group_talk_app/constants/gaps.dart';
import 'package:group_talk_app/features/auth/views/login/widgets/login_bottom_bar.dart';
import 'package:group_talk_app/features/auth/views/login/widgets/login_result.dart';
import 'package:group_talk_app/features/auth/views/login/widgets/login_title.dart';
import 'package:group_talk_app/features/auth/views/login/view_models/login_view_model.dart';
import 'package:group_talk_app/features/auth/views/widgets/form_button.dart';
import 'package:group_talk_app/features/auth/views/widgets/password_text_field.dart';
import 'package:group_talk_app/features/auth/views/widgets/username_text_field.dart';

enum FormDataKey {
  username,
  password,
}

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = 'login';
  static const String routePath = '/login';

  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<FormDataKey, String> _formData = {
    FormDataKey.username: '',
    FormDataKey.password: '',
  };

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

  void _onFormSubmit() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    await ref.read(loginProvider.notifier).login(
          username: _formData[FormDataKey.username]!,
          password: _formData[FormDataKey.password]!,
          context: context,
        );
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
                  const LoginTitle(),
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
                      text: '로그인',
                      isLoading: ref.watch(loginProvider).isLoading,
                    ),
                  ),
                  const LoginResult()
                ],
              ),
            ),
          ),
          bottomNavigationBar: const BottomAppBar(
            elevation: 2,
            child: LoginBottomBar(),
          ),
        ),
      ),
    );
  }
}
