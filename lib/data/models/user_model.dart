import 'package:hive/hive.dart';
import 'package:tr_app/domain/entities/user.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String username;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final String token;
  @HiveField(4)
  final String storeCode;
  @HiveField(5)
  final String storeName;
  @HiveField(6)
  final String ip;
  @HiveField(7)
  final String loginTime;

  //construstor
  UserModel({
    required this.name,
    required this.username,
    required this.password,
    required this.token,
    required this.storeCode,
    required this.storeName,
    required this.ip,
    required this.loginTime,
  });

  //factory
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      password: json['password'],
      token: json['token'],
      storeCode: json['storeCode'],
      storeName: json['storeName'],
      ip: json['ip'],
      loginTime: json['loginTime'],
    );
  }

  //toJson
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'token': token,
      'storeCode': storeCode,
      'storeName': storeName,
      'ip': ip,
      'loginTime': loginTime,
    };
  }

  // from User
  factory UserModel.fromUser(User user) {
    return UserModel(
      name: user.name ?? '',
      username: user.username ?? '',
      password: user.password ?? '',
      token: user.token ?? '',
      storeCode: user.storeId ?? '',
      storeName: user.storeName ?? '',
      ip: user.ip ?? '',
      loginTime: user.loginTime ?? '',
    );
  }

  // to User
  User toUser() {
    return User(
      name: name,
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
