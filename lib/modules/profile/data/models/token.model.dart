import 'dart:convert';

class TokenJWTModel {
  final String tokenJWT;

  const TokenJWTModel({
    required this.tokenJWT,
  });

  factory TokenJWTModel.fromJson(Map<String, dynamic> json) {
    return TokenJWTModel(
      tokenJWT: json['tokenJWT'],
    );
  }
}
