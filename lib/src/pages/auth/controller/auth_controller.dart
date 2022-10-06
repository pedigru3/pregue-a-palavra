import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool islooding = false.obs;

  Future sigIn({
    required String email,
    required String password,
  }) async {
    islooding.value = true;

    await Future.delayed(const Duration(seconds: 2));

    islooding.value = false;
  }
}
