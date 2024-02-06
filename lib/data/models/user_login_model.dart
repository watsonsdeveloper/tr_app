import 'package:tr_app/domain/entities/user.dart';

class UserLoginModel {
  final String? displayName;
  final String? username;
  final String? password;
  final String? token;
  final bool? firstLogin;
  final bool? passwordExpired;
  final bool? allowChangePassword;
  final String? storeCode;
  final String? storeName;
  final String? ip;
  final String? loginTime;
  final String? responseCode;
  final String? message;

  UserLoginModel({
    this.displayName = '',
    this.username = '',
    this.password = '',
    this.token = '',
    this.firstLogin = false,
    this.passwordExpired = false,
    this.allowChangePassword = false,
    this.storeCode = '',
    this.storeName = '',
    this.ip = '',
    this.loginTime = '',
    this.responseCode = '',
    this.message = '',
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      displayName: json['displayName'],
      username: json['username'],
      password: json['password'],
      token: json['token'],
      firstLogin: json['firstLogin'] ?? false,
      passwordExpired: json['passwordExpired'] ?? false,
      allowChangePassword: json['allowChangePassword'] ?? false,
      storeCode: json['storeCode'],
      storeName: json['storeName'],
      ip: json['ip'],
      loginTime: json['loginTime'],
      responseCode: json['responseCode'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'username': username,
      'password': password,
      'token': token,
      'firstLogin': firstLogin,
      'passwordExpired': passwordExpired,
      'allowChangePassword': allowChangePassword,
      'storeCode': storeCode,
      'storeName': storeName,
      'ip': ip,
      'loginTime': loginTime,
      'responseCode': responseCode,
      'message': message,
    };
  }

  UserLoginModel copyWith({
    String? displayName,
    String? username,
    String? password,
    String? token,
    bool? firstLogin,
    bool? passwordExpired,
    bool? allowChangePassword,
    String? storeCode,
    String? storeName,
    String? ip,
    String? loginTime,
    String? responseCode,
    String? message,
  }) {
    return UserLoginModel(
      displayName: displayName ?? this.displayName,
      username: username ?? this.username,
      password: password ?? this.password,
      token: token ?? this.token,
      firstLogin: firstLogin ?? this.firstLogin,
      passwordExpired: passwordExpired ?? this.passwordExpired,
      allowChangePassword: allowChangePassword ?? this.allowChangePassword,
      storeCode: storeCode ?? this.storeCode,
      storeName: storeName ?? this.storeName,
      ip: ip ?? this.ip,
      loginTime: loginTime ?? this.loginTime,
      responseCode: responseCode ?? this.responseCode,
      message: message ?? this.message,
    );
  }

  // to User
  User toUser() {
    return User(
      name: displayName,
      username: username,
      password: password,
      token: token,
      storeId: storeCode,
      storeName: storeName,
      ip: ip,
      loginTime: loginTime,
    );
  }
}
