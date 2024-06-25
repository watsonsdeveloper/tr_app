import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tr_app/config.dart';
import 'package:tr_app/data/models/user_login_model.dart';
import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/services/user_service.dart';
import 'package:tr_app/utils/dio_extension.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements UserService {
  late Dio _dio;
  final GlobalState _globalState;

  UserServiceImpl(this._globalState) {
    _dio = Dio();
    DioExtension.configure(_dio);
  }

  @override
  Future<User> login(String username, String password) async {
    try {
      final Map<String, dynamic> data = {
        "username": username,
        "password": password,
        "language": "0",
        "type": "RSIM",
        "desktop": "false"
      };

      final url = Uri.parse(
          'http://${_globalState.storeIP!}/RSIM2MIDDLEWARE/Account/CreateToken');

      var response = await http.post(
        url.replace(port: 8080),
        // url,
        body: jsonEncode(data),
        // headers: {'Content-Type': 'application/json'},
      );

      // if (response.statusCode == 200) {
      //   // If the server returns a 200 OK response, then parse the JSON.
      //   print('User Data: ${response.body}');
      // } else {
      //   // If the server did not return a 200 OK response,
      //   // then throw an exception.
      //   throw Exception('Failed to load user data');
      // }

      // Dio dio = Dio();

      // DioExtension.config(dio, 'http://${_globalState.storeIP!}:8080');
      // // DioExtension.config(dio, 'http://10.99.252.193:8080');

      // Response<dynamic> response =
      //     await dio.post('/RSIM2MIDDLEWARE/Account/CreateToken', data: data);

      // var jsonLoginFail = {
      //   "firstLogin": false,
      //   "passwordExpired": false,
      //   "allowChangePassword": false,
      //   "responseCode": "USER-001",
      //   "message": "User or Password is incorrect"
      // };
      // var jsonLoginSuccess = {
      //   "displayName": "Admin",
      //   "token": "048932F8-E30F-477D-8377-648CF513993D",
      //   "firstLogin": false,
      //   "passwordExpired": false,
      //   "allowChangePassword": true,
      //   "storeCode": "2144",
      //   "storeName": "PAV",
      //   "ip": "10.99.252.193",
      //   "loginTime": "10:34",
      //   "responseCode": "00"
      // };

      // var mockData = UserLoginModel.fromJson(jsonLoginSuccess);
      // Response<UserLoginModel> response = Response<UserLoginModel>(
      //     requestOptions: RequestOptions(), statusCode: 200, data: mockData);

      final Map<String, dynamic> loginLogRequest = {
        "url": url.toString(),
        "request": jsonEncode(data),
        "response": response.body,
      };

      await http.post(
        Uri.parse('${Config.trv2BaseUrl}/mobileApi/login'),
        body: jsonEncode(loginLogRequest),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // UserLoginModel userLoginModel = UserLoginModel.fromJson(response.data);

        UserLoginModel userLoginModel =
            UserLoginModel.fromJson(jsonDecode(response.body));

        if (userLoginModel.token != null && userLoginModel.message == null) {
          if (userLoginModel.functions == null ||
              !userLoginModel.functions!.contains('IA_Approve')) {
            return throw Exception('User does not have access to this app');
          }

          userLoginModel =
            userLoginModel.copyWith(username: username, password: password);
          return userLoginModel.toUser();
        }
        if (userLoginModel.message == 'Username or Password is incorrect') {
          return throw Exception('Incorrect user ID or password');
        }
        return throw Exception(userLoginModel.message);
      }
      return throw Exception('Failed to login');
    } catch (e) {
      return throw Exception(e.toString());
    }
  }

  @override
  Future<bool> logout(String username) async {
    return true;
  }
}
