abstract class IHttpManager {
  Future<Map<String, dynamic>> reqRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  });
}

abstract class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}
