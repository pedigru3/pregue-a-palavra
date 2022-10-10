import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/auth/view/sign_in_screen.dart';
import 'package:pregue_a_palavra/src/pages/auth/view/sign_up_screen.dart';
import 'package:pregue_a_palavra/src/pages/base/base_screen.dart';
import 'package:pregue_a_palavra/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final Map<String, Widget Function(BuildContext)> pages = {
    PagesRoute.splashRoute: (_) => const SplashScreen(),
    PagesRoute.signInRoute: (_) => SignInScreen(),
    PagesRoute.signUpRoute: (_) => const SignUpScreen(),
    PagesRoute.baseRoute: (_) => const BaseScreen(),
  };
}

abstract class PagesRoute {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
