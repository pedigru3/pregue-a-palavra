import 'package:flutter/material.dart';
import 'package:pregue_a_palavra/src/pages/auth/controller/auth_controller.dart';
import 'package:pregue_a_palavra/src/pages_routes/app_pages.dart';
import 'package:pregue_a_palavra/src/services/shared_local_storage_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initValidate();
  }

  _initValidate() async {
    ILocalStorage localStorage = SharedLocalStorageService();
    final authController = AuthController();
    String token = await localStorage.get('authKey') ?? '';
    var result = await authController.isValidateToken(token);
    print(result);

    result.when(success: (user) {
      Navigator.of(context).pushReplacementNamed(PagesRoute.baseRoute);
    }, error: (msg) {
      Navigator.of(context).pushReplacementNamed(PagesRoute.signInRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('images/icon.png'),
            height: 200,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
