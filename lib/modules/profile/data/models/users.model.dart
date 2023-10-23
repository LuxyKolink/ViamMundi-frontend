class UsersModel {
  final String username;
  final String password;
  final String refreshToken;

  const UsersModel({
    required this.username,
    required this.password,
    required this.refreshToken,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      username: json['username'],
      password: json['password'],
      refreshToken: json['refreshToken'],
    );
  }
}
