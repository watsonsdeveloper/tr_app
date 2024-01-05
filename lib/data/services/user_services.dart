import 'package:dio/dio.dart';

class UserService {
  final Dio _dio;

  UserService(this._dio);

  Future<String?> authenticate(String username, String password) async {
    try {
      // Response response = await _dio.post(
      //   '/Rsim2MiddleWare/Acount/createtoken',
      //   data: {
      //     "username": username,
      //     "password": password,
      //     "language": "0",
      //     "type": "RSIM",
      //     "desktop": "false"
      //   },
      // );
      // return response.data['token'];
      return 'token';
    } catch (e) {
      return null;
    }
  }
}
