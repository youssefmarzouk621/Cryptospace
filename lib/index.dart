import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_universe/current_screen_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'staticdata/constants.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
//State class
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

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
        body: CurrentScreenIndex(_page),

    );
  }
}


