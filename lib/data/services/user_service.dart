import 'package:dio/dio.dart';
import 'package:tr_app/data/models/user_login_model.dart';
import 'package:tr_app/domain/entities/global_state.dart';
import 'package:tr_app/domain/entities/user.dart';
import 'package:tr_app/domain/services/user_service.dart';
import 'package:tr_app/utils/dio_extension.dart';

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
      Dio dio = Dio();
      DioExtension.config(dio, 'http://${_globalState.storeIP!}:8080');
      // DioExtension.config(dio, 'http://10.99.252.193:8080');

      Response<dynamic> response = await dio.post(
        '/RSIM2MIDDLEWARE/Account/CreateToken',
        data: {
          "username": username,
          "password": password,
          "language": "0",
          "type": "RSIM",
          "desktop": "false"
        },
      );

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

      UserLoginModel userLoginModel = UserLoginModel.fromJson(response.data);

      if (response.statusCode == 200) {
        if (userLoginModel.token != null && userLoginModel.message == null) {
          userLoginModel =
              userLoginModel.copyWith(username: username, password: password);
          return userLoginModel.toUser();
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
