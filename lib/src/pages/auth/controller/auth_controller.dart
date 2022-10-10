import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier {
  bool islooding = false;

  Future sigIn({
    required String email,
    required String password,
  }) async {
    islooding = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    islooding = false;
    notifyListeners();
  }
}
