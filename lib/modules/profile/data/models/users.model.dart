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

  static List<UsersModel> getUsers() {
    List<UsersModel> users = [];

    users.add(const UsersModel(
        username: 'santymg', password: 'hola123', refreshToken: 'elefante1'));

    users.add(const UsersModel(
        username: 'keviq', password: 'hola1234', refreshToken: 'elefante2'));

    return users;
  }
}
