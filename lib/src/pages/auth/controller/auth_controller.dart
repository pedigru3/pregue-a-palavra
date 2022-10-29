import 'package:flutter/cupertino.dart';
import 'package:pregue_a_palavra/src/models/user_model.dart';
import 'package:pregue_a_palavra/src/pages/auth/repository/auth_repository.dart';
import 'package:pregue_a_palavra/src/pages/auth/result/auth_result.dart';
import 'package:pregue_a_palavra/src/services/shared_local_storage_service.dart';
import 'package:pregue_a_palavra/src/services/util_services.dart';

class AuthController extends ChangeNotifier {
  bool islooding = false;

  final authRepository = AuthRepository();
  final utilServices = UtilServices();
  final ILocalStorage localStorage = SharedLocalStorageService();

  bool isLoggedIn = false;

  UserModel? user;

  Future<void> sigIn({required String email, required String password}) async {
    islooding = true;
    notifyListeners();

    AuthResult result =
        await authRepository.signIn(email: email, password: password);
    islooding = false;

    result.when(
      success: (user) {
        this.user = user;
        isLoggedIn = true;
        localStorage.put('authKey', user.token);
        notifyListeners();
      },
      error: ((message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      }),
    );

    notifyListeners();
  }

  Future<AuthResult> isValidateToken(String token) async {
    islooding = true;
    return await authRepository.validateToken(token: token);
  }
}
