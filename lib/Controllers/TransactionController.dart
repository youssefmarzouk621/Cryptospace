import 'dart:convert';

import 'package:flutter_universe/Models/BalanceResponse.dart';
import 'package:flutter_universe/Models/User.dart';
import 'package:flutter_universe/staticdata/constants.dart';
import 'package:http/http.dart';

class TransactionController {

  Future<int> SendTokenService(String amount,String account,String receiver) async {
    Response res = await post(
      Uri.http(baseURL,"api/token/sendCoin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "amount": amount,
        "account": account,
        "receiver": receiver
      }),
    );

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      print(body['balance']);
      return 1;
    } else{
      return -1;
    }
  }

}