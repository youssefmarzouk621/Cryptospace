import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_universe/current_screen_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/src/channel.dart';
import 'staticdata/constants.dart';

class IndexPage extends StatefulWidget {
  WebSocketChannel channel;
  IndexPage({
    @required this.channel
  });

  @override
  _IndexPageState createState() => _IndexPageState(channel);
}

class _IndexPageState extends State<IndexPage> {
//State class
  int _page = 0;
  WebSocketChannel _channel;
  GlobalKey _bottomNavigationKey = GlobalKey();

  _IndexPageState(this._channel);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(_channel==null){
      print("channel null");
      _channel = IOWebSocketChannel.connect('ws://192.168.1.46:4000');
    }else{
      print("channel taada mrigel");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        bottomNavigationBar: CurvedNavigationBar(
          //color: const Color(0xff4466a5),
          //buttonBackgroundColor: const Color(0xff4466a5),
          backgroundColor: const Color(0xff3fa5b1),
          height:55,
          key: _bottomNavigationKey,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.add, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: CurrentScreenIndex(index: _page,channel: this._channel),

    );
  }
}


