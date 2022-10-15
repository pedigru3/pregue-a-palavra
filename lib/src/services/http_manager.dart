import 'package:dio/dio.dart';
import 'package:pregue_a_palavra/src/token/token.dart';

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

abstract class HttpManager {
  Future<Map<String, dynamic>> reqRequest({
    required String url,
    required String method,
    Map? headers,
  });
}

class HttpManagerBible implements HttpManager {
  @override
  Future<Map<String, dynamic>> reqRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // headers requisicao
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
        Token.bible,
      );

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );
      if (response.data is List) {
        return {'result': response.data};
      }
      //retorno do resultado do backand
      return response.data;
    } on DioError catch (error) {
      //retorno Dio request
      if (error.response == null) {
        return {};
      } else {
        return error.response!.data ?? {};
      }
    } catch (error) {
      // retorno map vazio para erro generalizado
      return {};
    }
  }
}
