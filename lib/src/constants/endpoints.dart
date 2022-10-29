const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String bibleBaseUrl = 'https://www.abibliadigital.com.br/api';
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/singup';
  static const String validateToken = '$baseUrl/validate-token';
}
