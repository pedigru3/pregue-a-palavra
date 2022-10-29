import 'package:pregue_a_palavra/src/constants/endpoints.dart';
import 'package:pregue_a_palavra/src/interfaces/http_manager_interface.dart';
import 'package:pregue_a_palavra/src/models/user_model.dart';
import 'package:pregue_a_palavra/src/pages/auth/repository/auth_errors.dart'
    as authErrors;
import 'package:pregue_a_palavra/src/pages/auth/result/auth_result.dart';
import 'package:pregue_a_palavra/src/services/http/http_manager_b4app.dart';

class AuthRepository {
  final IHttpManager _httpManager = HttpManagerB4app();

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final result = await _httpManager
        .reqRequest(url: Endpoints.signin, method: HttpMethods.post, body: {
      "email": email,
      "password": password,
    });

    if (result['result'] != null) {
      final user = UserModel.fromMap(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validateToken({required String token}) async {
    final result = await _httpManager.reqRequest(
        url: Endpoints.validateToken,
        method: HttpMethods.post,
        headers: {'X-Parse-Session-Token': token});

    if (result['result'] != null) {
      final user = UserModel.fromMap(result['result']);

      return AuthResult.success(user);
    } else {
      return AuthResult.error(authErrors.authErrorsString(result['error']));
    }
  }
}
