import 'dart:convert';

import 'package:flutter_universe/Models/BalanceResponse.dart';
import 'package:flutter_universe/Models/Core_User.dart';
import 'package:flutter_universe/Models/HistoryTransaction.dart';
import 'package:flutter_universe/Models/User.dart';
import 'package:flutter_universe/Storage/Usersrepository.dart';
import 'package:flutter_universe/staticdata/constants.dart';
import 'package:http/http.dart';

class TransactionController {

  Future<int> SendTokenService(String amount,String receiver) async {
    CoreUser _futureUser = await UsersRepository.getConnectedUser();
    Response res = await post(
      Uri.http(baseURL,"api/token/sendCoin"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "amount": amount,
        "account": _futureUser.publickey,
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

  Future<String> getBalance() async{
    CoreUser _futureUser = await UsersRepository.getConnectedUser();

    Response response = await post(
      Uri.http(baseURL,"api/token/getBalance"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );

    var parse = jsonDecode(response.body);
    return parse["balance"];
  }

  Future <List<HistoryTransaction>>getTransactions() async{
    CoreUser _futureUser = await UsersRepository.getConnectedUser();

    final response = await post(
      Uri.http(baseURL,"api/token/history"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );
    var jsonData = json.decode(response.body);
    List<HistoryTransaction> transactions = [];

    for(var u in jsonData){
      HistoryTransaction transaction;
      if(u["from"]==_futureUser.publickey){
        transaction = HistoryTransaction(u["from"], u["to"], u["tokens"],"Transfered");
      }else{
        transaction = HistoryTransaction(u["from"], u["to"], u["tokens"],"Received");
      }
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