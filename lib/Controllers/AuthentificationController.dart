import 'dart:convert';

import 'package:flutter_universe/Models/User.dart';
import 'package:flutter_universe/staticdata/constants.dart';
import 'package:http/http.dart';

class AuthentificationController {

  Future<String> loginService(String email,String password) async {
    Response res = await post(
      Uri.http(baseURL,"api/users/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      User connectedUser = User.fromJson(body);
      //Store connectedUser


      return "Connected";
    } else if (res.statusCode == 201) {
      return "password";
    }else if (res.statusCode == 202){
      return "notfound";
    }else if (res.statusCode == 203){
      return "verified";
    }
  }

  Future<String> registerService(String firstname,String lastname,String email,String password,String phone) async {
    Response res = await post(
      Uri.http(baseURL,"api/users/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "firstName": firstname,
        "lastName": lastname,
        "email": email,
        "password": password,
        "phone": phone,
      }),
    );

    if (res.statusCode == 200) {
      return "success";
    } else if (res.statusCode == 201) {
      return "exist";
    }
  }

  Future<String> verifyAccount(String email) async {
    Response res = await post(
      Uri.http(baseURL,"api/users/verifyAccount"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email
      }),
    );

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      User connectedUser = User.fromJson(body);
      //store in local database
      return "success";
    } else if (res.statusCode == 204) {
      return "error";
    }
  }




}