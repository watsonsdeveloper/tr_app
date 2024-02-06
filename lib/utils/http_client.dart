import 'package:http/http.dart' as http;

class HttpClient extends http.BaseClient {
  // final http.Client _client;
  // final Map<String, String> _defaultHeaders;

  HttpClient() : super();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    throw UnimplementedError();
  }

  // HttpExtension() {
  //   options = BaseOptions(
  //     // baseUrl: dotenv.env['BaseUrl']!,
  //     baseUrl: Config.retekConfigure,
  //     connectTimeout: const Duration(seconds: 5),
  //     receiveTimeout: const Duration(seconds: 3),
  //     headers: const {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //     },
  //   );
  // }

  // Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
  //   return _client.get(url, headers: {..._defaultHeaders, ...?headers});
  // }

  // @override
  // Future<http.StreamedResponse> send(http.BaseRequest request) {
  //   throw UnimplementedError();
  // }
}
