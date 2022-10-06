import 'package:dio/dio.dart';

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
      ..addAll({
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IlRodSBTZXAgMTUgMjAyMiAxOToxMDoxMSBHTVQrMDAwMC5mZXJyZWlyYS5jb250YXRvMUBnbWFpbC5jb20iLCJpYXQiOjE2NjMyNjkwMTF9._E-zPYgk4_y3s5NNWtvnzAbgJ-nz_7zTgEpJy5hHt1o',
      });

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
      return error.response!.data ?? {};
    } catch (error) {
      // retorno map vazio para erro generalizado
      return {};
    }
  }
}
