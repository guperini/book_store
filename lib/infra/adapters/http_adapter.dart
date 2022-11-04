import 'http_adapter_imp.dart';

abstract class HttpAdapter {
  Future<dynamic> request(
      {required String endpoint,
      required HttpMethod method,
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
      bool printRequest,
      String? token});
}
