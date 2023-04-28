import 'package:go_router/go_router.dart';
import 'package:group_talk_app/features/auth/signup_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: SignUpScreen.routeName,
      path: SignUpScreen.routePath,
      builder: (context, state) => const SignUpScreen(),
    )
  ],
);
