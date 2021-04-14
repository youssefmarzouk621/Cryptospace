import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_universe/1. Home/home_page.dart';
import 'package:flutter_universe/4. Settings/settings.dart';
import 'package:flutter_universe/2. Wallet/Wallet.dart';
import 'package:flutter_universe/3. Exchange/Exchange.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class CurrentScreenIndex extends StatelessWidget {
  final int index;
  final WebSocketChannel channel;
  CurrentScreenIndex({
    @required this.index,
    @required this.channel,
  });

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        {
          return HomePage(channel: channel);
        }
      case 1:
        {
          return Wallet(channel: channel);
        }
        break;
      case 2:
        {
          return Exchange(channel: channel);
        }
        break;
      case 3:
        {
          return Settings();
        }
        break;
      default:
        {
          return HomePage(channel: channel);
        }
        break;
    }
  }
}
