import 'package:tr_app/utils/constants/enum_constants.dart';

class User {
  final String? name;
  final String? username;
  final String? password;
  final String? token;
  final String storeId;
  final String? storeName;
  final String? ip;
  final String? loginTime;
  final Brand selectedBrand;

  User({
    required this.name,
    required this.username,
    required this.token,
    required this.storeId,
    required this.storeName,
    required this.ip,
    required this.loginTime,
    this.selectedBrand = Brand.own,
    this.password = "",
  });

  // copy with
  User copyWith({
    String? name,
    String? username,
    String? password,
    String? token,
    String? storeId,
    String? storeName,
    String? ip,
    Brand? selectedBrand,
    String? loginTime,
  }) {
    return User(
      name: name ?? this.name,
      username: username ?? this.username,
      token: token ?? this.token,
      storeId: storeId ?? this.storeId,
      storeName: storeName ?? this.storeName,
      ip: ip ?? this.ip,
      loginTime: loginTime ?? this.loginTime,
      selectedBrand: selectedBrand ?? this.selectedBrand,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'password': password,
      'token': token,
      'storeId': storeId,
      'storeName': storeName,
      'ip': ip,
      'selectedBrand': selectedBrand,
      'loginTime': loginTime,
    };
  }
}
