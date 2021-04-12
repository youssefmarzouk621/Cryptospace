import 'package:flutter_universe/Storage/database_creator.dart';

class CoreUser {
  int id;
  String database_id;
  String firstName;
  String lastName;
  String email;
  String password;
  String phone;
  String token;
  String publickey;
  String pincode;

  CoreUser(
      this.id,
      this.database_id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.token,
      this.publickey,
      this.pincode
  );

  CoreUser.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.id];
    this.database_id = json[DatabaseCreator.database_id];
    this.firstName = json[DatabaseCreator.firstName];
    this.lastName = json[DatabaseCreator.lastName];
    this.email = json[DatabaseCreator.email];
    this.password = json[DatabaseCreator.password];
    this.phone = json[DatabaseCreator.phone];
    this.token = json[DatabaseCreator.token];
    this.publickey = json[DatabaseCreator.publickey];
    this.pincode = json[DatabaseCreator.pincode];
  }
}