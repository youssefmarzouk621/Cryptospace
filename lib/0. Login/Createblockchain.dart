import 'package:flutter/material.dart';
import 'package:flutter_universe/0. Login/SignupPage.dart';
import 'package:flutter_universe/index.dart';
import 'package:flutter_universe/0.%20Login/PhraseAuth.dart';
import 'package:flutter_universe/0. Login/Importblockchain.dart';
import 'package:flutter/services.dart';



class Createblockchain extends StatefulWidget {
  @override
  _CreateblockchainState createState() => _CreateblockchainState();
}



class _CreateblockchainState extends State<Createblockchain> {
  String privatekey = "privatekey";
  @override
  Widget build(BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [const Color(0xFF543CBA),const Color(0xFF3FA5B1)],
              ),
            ),
            child: Scaffold(
              backgroundColor: Color(0x00000000),
              // resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: true,
              body:  SingleChildScrollView(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
                  SizedBox(height: 45.0),
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Column(
                            children: [

                              Row(
                                  children: [
                                    SizedBox(width: 5.0),
                                    IconButton(
                                      iconSize: 25,
                                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    Text(
                                      'CREATE',
                                      style:
                                      TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff)),
                                    ),
                                  ]
                              ),
                              Row(
                                  children: [
                                    SizedBox(width: 35.0),
                                    Text(
                                      'ACCOUNT.',
                                      style:
                                      TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold,color:const Color(0xFFf9d505)),
                                    ),
                                  ]
                              ),

                            ]
                        ),

                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width / 1.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color.fromRGBO(65, 45, 135, 0.3),
                            ),
                            child: Center(
                              child: Text(
                                privatekey,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 35.0),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 1.0),
                                OutlineButton(
                                  disabledBorderColor: const Color(0xffffffff),
                                  highlightedBorderColor: const Color(0xffffffff),
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                  onPressed: () => {
                                    setState(() {
                                      Clipboard.setData(new ClipboardData(text: privatekey));
                                    }),
                                  },

                                  child: Row( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.copy,color: const Color(0xffffffff),),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Copy",style: TextStyle(color: const Color(0xffffffff),))
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  child: FlatButton(
                                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                                    height: MediaQuery.of(context).size.height/11.0,


                                    // splashColor: Colors.red,
                                    color: const Color.fromRGBO(65, 45, 135, 0.7),
                                    // textColor: Colors.white,
                                    child: Text('Continue',
                                        style: TextStyle( fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w300,
                                          color: const Color(0xFFffffff),
                                          fontSize: 14,)
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          transitionDuration: Duration(seconds: 1),
                                          transitionsBuilder: (context, animation, animationTime, child) {
                                            animation = CurvedAnimation(
                                                parent: animation, curve: Curves.decelerate);
                                            return FadeTransition(
                                              opacity: animation,
                                              child: child,
                                            );
                                          },
                                          pageBuilder: (context, a, b) => PhraseAuth(),

                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height/7.1),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration: Duration(seconds: 1),
                                  transitionsBuilder: (context, animation, animationTime, child) {
                                    animation = CurvedAnimation(
                                        parent: animation, curve: Curves.decelerate);
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                  pageBuilder: (context, a, b) => Importblockchain(),

                                ),
                              );
                            },
                            child:  Text(
                              'Import your account >',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),


                        ],
                      )),

                ]),
              ),
            ),
          );

}
}