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

  Future<dynamic> getBalance() async{
    CoreUser _futureUser = await UsersRepository.getConnectedUser();

    Response responseVault = await post(
      Uri.http(baseURL,"api/token/getBalance"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );

    Response responseEth = await post(
      Uri.http(baseURL,"api/token/getBalanceInEth"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );


    var parseVault = jsonDecode(responseVault.body);
    var parseEth = jsonDecode(responseEth.body);


    var data = {
      'balanceVault': parseVault['balance'],
      'balanceEth':parseEth['balanceEth'],
    };


    return data;
  }

  Future<dynamic> getBalances() async{
    CoreUser _futureUser = await UsersRepository.getConnectedUser();

    Response responseVault = await post(
      Uri.http(baseURL,"api/token/getBalance"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );

    Response responseEth = await post(
      Uri.http(baseURL,"api/token/getBalanceInEth"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': _futureUser.publickey,
      }),
    );


    var parseVault = jsonDecode(responseVault.body);
    var parseEth = jsonDecode(responseEth.body);

    var totalWei= double.parse(parseVault['balanceVaultWei']) + double.parse(parseEth['balanceEthWei']);


    var vaultValue=(double.parse(parseVault['balanceVaultWei'])/totalWei)*100;
    var ethValue=(double.parse(parseEth['balanceEthWei'])/totalWei)*100;
    var data = {
      'vaultValue':vaultValue,
      'ethValue':ethValue
    };


    return data;
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

  Future<dynamic> createAccount() async {
    final response = await post(
      Uri.http(baseURL,"api/token/createAccount"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{

      }),
    );
    var account = jsonDecode(response.body);
    return account;
  }
}