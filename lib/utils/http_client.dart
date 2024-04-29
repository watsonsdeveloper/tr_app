import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:tr_app/config.dart';
import 'package:tr_app/data/models/service_result.dart';
import 'package:tr_app/domain/services/service.dart';

Future<String> readResponse(HttpClientResponse response) {
  final completer = Completer<String>();
  final contents = StringBuffer();
  response.transform(utf8.decoder).listen((data) {
    contents.write(data);
  }, onDone: () => completer.complete(contents.toString()));
  return completer.future;
}

// create HttpClient factory
HttpClient createHttpClient() {
  final httpClient = HttpClient();
  httpClient.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
  httpClient.connectionTimeout = const Duration(seconds: 5);
  return httpClient;
}

class Http {
  static Future<HttpClientResponse> get<T>(
      String path, Map<String, String> queryParameters) async {
    final apiStartTime = DateTime.now();
    final queryString = Uri(queryParameters: queryParameters).query;
    final url = Uri.parse('${Config.trv2BaseUrl}$path?$queryString');
    final httpClient = createHttpClient();
    try {
      var request = await httpClient.getUrl(url);
      final response = await request.close();
      httpClient.close();
      return response;
    } catch (e) {
      print('API Error: $e');
      httpClient.close();
      rethrow;
    } finally {
      final endStartTime = DateTime.now();
      final duration =
          endStartTime.difference(apiStartTime).inMilliseconds / 1000;
      print('API: $path, Duration: $duration seconds');
    }
  }

  static Future<HttpClientResponse> post(String path, Map<String, dynamic> body,
      {Map<String, String>? queryParameters}) async {
    final apiStartTime = DateTime.now();
    final query = queryParameters != null
        ? '? ${Uri(queryParameters: queryParameters).query}'
        : '';
    final url = Uri.parse('${Config.trv2BaseUrl}$path$query');
    final httpClient = createHttpClient();

    try {
      var request = await httpClient.postUrl(url);
      request.headers.set('Content-Type', 'application/json');
      request.write(jsonEncode(body));

      final response = await request.close();
      httpClient.close();
      return response;
    } catch (e) {
      print('API Error: $e');
      httpClient.close();
      rethrow;
    } finally {
      final endStartTime = DateTime.now();
      final duration =
          endStartTime.difference(apiStartTime).inMilliseconds / 1000;
      print('API: $path, Duration: $duration seconds');
    }
  }
}
