class UserModel {
  String id;
  String name;
  String username;
  String password;
  String email;
  String token;

  UserModel(
      {this.id = '',
      this.name = '',
      this.username = '',
      this.password = '',
      this.email = '',
      this.token = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] as String,
        username: json['username'] as String,
        password: json['password'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        token: json['token'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'password': password,
      'email': email,
      'token': token,
    };
  }
}
