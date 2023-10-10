class LoginModel {
  final String email;
  final String password;
  final String tokenFingerPrint;

  const LoginModel({
    required this.email,
    required this.password,
    this.tokenFingerPrint = '',
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
      tokenFingerPrint: json['tokenFingerPrint'],
    );
  }
}
