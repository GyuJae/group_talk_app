import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_talk_app/features/auth/view_models/auth_view_model.dart';
import 'package:group_talk_app/features/auth/views/login/screen.dart';
import 'package:group_talk_app/features/auth/views/signup/screen.dart';
import 'package:group_talk_app/features/home/home_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: HomeScreen.routePath,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authProvider).isLoggedIn;
        if (isLoggedIn) return null;
        if (state.subloc != SignUpScreen.routePath &&
            state.subloc != LoginScreen.routePath) {
          return SignUpScreen.routePath;
        }
        return null;
      },
      routes: [
        GoRoute(
          name: HomeScreen.routeName,
          path: HomeScreen.routePath,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: SignUpScreen.routeName,
          path: SignUpScreen.routePath,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routePath,
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    );
  },
);
