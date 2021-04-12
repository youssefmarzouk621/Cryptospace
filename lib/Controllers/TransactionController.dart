import 'dart:convert';

import 'package:flutter_universe/Models/BalanceResponse.dart';
import 'package:flutter_universe/Models/HistoryTransaction.dart';
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

  Future<String> getBalance(myaccount) async{
    final response = await post(
      Uri.http(baseURL,"api/token/getBalance"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': myaccount,
      }),
    );

    var parse = jsonDecode(response.body);
    return parse["balance"];
  }

  Future <List<HistoryTransaction>>getTransactions(myaccount) async{

    final response = await post(
      Uri.http(baseURL,"api/token/history"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': myaccount,
      }),
    );
    var jsonData = json.decode(response.body);
    List<HistoryTransaction> transactions = [];

    for(var u in jsonData){
      HistoryTransaction transaction = HistoryTransaction(u["from"], u["to"], u["tokens"]);
      transactions.add(transaction);
    }

    return transactions;


  }

  Future<String> importAccount(privateKey) async {
    final response = await post(
      Uri.http(baseURL,"api/token/importAccount"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'privatekey': privateKey,
      }),
    );
    var parse = jsonDecode(response.body);
    return parse["account"];
  }
}