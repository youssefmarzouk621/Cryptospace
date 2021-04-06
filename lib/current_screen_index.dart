import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_universe/1. Home/home_page.dart';
import 'package:flutter_universe/4. Settings/settings.dart';
import 'package:flutter_universe/2. Wallet/Wallet.dart';
import 'package:flutter_universe/3. Exchange/Exchange.dart';


class CurrentScreenIndex extends StatelessWidget {
  final int index;

  CurrentScreenIndex(
      this.index,
      );

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        {
          return HomePage();
        }
      case 1:
        {
          return Wallet();
        }
        break;
      case 2:
        {
          return Exchange();
        }
        break;
      case 3:
        {
          return Settings();
        }
        break;
      default:
        {
          return HomePage();
        }
        break;
    }
  }
}
