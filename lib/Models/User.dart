import 'package:flutter/foundation.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String accessToken;


  User({
  @required this.id,
  @required this.firstName,
  @required this.lastName,
  @required this.email,
  @required this.password,
  @required this.phone,
  @required this.accessToken,
  });



  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      accessToken: json['accessToken'] as String,
    );
  }
}