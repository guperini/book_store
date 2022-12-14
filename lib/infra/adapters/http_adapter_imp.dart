import 'dart:convert';

import 'package:http/http.dart';

import '../../core/errors/http_errors.dart';
import 'http_adapter.dart';

class HttpAdapterImp implements HttpAdapter {
  final Client client;

  HttpAdapterImp(
    this.client,
  );

  @override
  Future<dynamic> request({
    required String endpoint,
    required HttpMethod method,
    String? token,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters = const <String, dynamic>{},
  }) async {
    Map<String, String> defaultHeaders = {
      if (token != null) 'Authorization': token,
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final jsonBody = body != null ? jsonEncode(body) : null;

    var response = Response('', 500);
    try {
      switch (method) {
        case HttpMethod.get:
          try {
            final queryString =
                Uri(queryParameters: queryParameters!.map((key, value) => MapEntry(key, value.toString()))).query;

            response = await client.get(
              Uri.parse("$endpoint?$queryString"),
              headers: headers ?? defaultHeaders,
            );
          } catch (e) {
            // ignore: avoid_print
            print(e);
          }

          break;
        case HttpMethod.delete:
          response = await client.delete(
            Uri.parse(endpoint),
            headers: headers ?? defaultHeaders,
          );
          break;
        case HttpMethod.post:
          response = await client.post(
            Uri.parse(endpoint),
            headers: headers ?? defaultHeaders,
            body: jsonBody,
          );
          break;
        case HttpMethod.put:
          response = await client.put(
            Uri.parse(endpoint),
            headers: headers ?? defaultHeaders,
            body: jsonBody,
          );
          break;
        case HttpMethod.patch:
          response = await client.patch(
            Uri.parse(endpoint),
            headers: headers ?? defaultHeaders,
            body: jsonBody,
          );
          break;
        default:
          return HttpError('serverError');
      }
    } catch (error) {
      throw HttpError('serverError');
    }
    return _handleResponse(response, endpoint);
  }

  dynamic _handleResponse(
    Response response,
    String endpoint,
  ) {
    final json = jsonDecode(response.body == '' ? '{}' : response.body);
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : json;
      case 400:
        throw HttpError('badRequest');
      case 401:
        throw HttpError('unauthorized');
      case 403:
        throw HttpError('forbidden');
      case 404:
        throw HttpError('notFound');
      case 500:
        throw HttpError('serverError');
      default:
        throw HttpError('serverError');
    }
  }
}

enum HttpMethod { get, put, post, patch, delete }
