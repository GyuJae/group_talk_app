import 'package:go_router/go_router.dart';
import 'package:group_talk_app/features/auth/login/screen.dart';
import 'package:group_talk_app/features/auth/signup/screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routePath,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
        name: LoginScreen.routeName,
        path: LoginScreen.routePath,
        builder: (context, state) => const LoginScreen()),
  ],
);
