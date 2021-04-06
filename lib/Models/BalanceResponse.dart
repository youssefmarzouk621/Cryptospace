import 'package:flutter/foundation.dart';

class BalanceResponse {
  final int balance;


  BalanceResponse({
    @required this.balance,
  });


  factory BalanceResponse.fromJson(Map<String, dynamic> json) {
    return BalanceResponse(
      balance: json['balance'] as int,
    );
  }
}