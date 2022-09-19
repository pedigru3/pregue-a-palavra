import 'package:get/get.dart';
import 'package:pregue_a_palavra/src/pages/auth/sign_in_screen.dart';
import 'package:pregue_a_palavra/src/pages/auth/sign_up_screen.dart';
import 'package:pregue_a_palavra/src/pages/base/base_screen.dart';
import 'package:pregue_a_palavra/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(name: PagesRoute.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PagesRoute.signInRoute, page: () => SignInScreen()),
    GetPage(name: PagesRoute.signUpRoute, page: () => const SignUpScreen()),
    GetPage(name: PagesRoute.baseRoute, page: () => const BaseScreen()),
  ];
}

abstract class PagesRoute {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
