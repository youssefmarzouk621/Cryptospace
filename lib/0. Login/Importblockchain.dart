import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/0. Login/SignupPage.dart';
import 'package:flutter_universe/Controllers/TransactionController.dart';
import 'package:flutter_universe/index.dart';
import 'package:flutter_universe/0.%20Login/PhraseAuth.dart';
import 'package:flutter_universe/0. Login/Createblockchain.dart';
import 'package:flutter/services.dart';

class Importblockchain extends StatefulWidget {
  @override
  _ImportblockchainState createState() => _ImportblockchainState();
}

Future<String> getClipBoardData() async {
  ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
  return data.text;
}

class _ImportblockchainState extends State<Importblockchain> {
  final myController = TextEditingController();
  final TransactionController transactionController = TransactionController();
  Future<String> _futureResponse;

  @override
  Widget build(BuildContext context) =>
    FutureBuilder<String>(
        future: getClipBoardData(),
    initialData: 'nothing',// a previously-obtained Future<String> or null
    builder: (BuildContext context, snapShot) {
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
                                'IMPORT',
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
                    Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(
                        autofocus: false,
                        controller: myController,
                        style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: TextStyle( fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFa2c0fc),
                            fontSize: 16,),
                          hintText: 'Insert Private Key',
                          contentPadding:
                          const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0x00000000)),
                            borderRadius: BorderRadius.circular(25.7),
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
                                this.myController.text = snapShot.data.toString();
                              }),
                            },

                            child: Row( // Replace with a Row for horizontal icon + text
                              children: <Widget>[
                                Icon(Icons.copy,color: const Color(0xffffffff),),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Paste",style: TextStyle(color: const Color(0xffffffff),))
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
                                EasyLoading.init();
                                if(myController.text.length==64){
                                  _futureResponse = transactionController.importAccount(myController.text);
                                  _futureResponse.then((value) => {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        transitionDuration: Duration(seconds: 1),
                                        transitionsBuilder: (context, animation, animationTime, child) {
                                          animation = CurvedAnimation(parent: animation, curve: Curves.decelerate);
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        pageBuilder: (context, a, b) => PhraseAuth(),
                                      ),
                                    )
                                  });
                                }else{
                                  EasyLoading.showError('Please enter a valid private key, Private key must be 32 bytes long');
                                }

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
                            pageBuilder: (context, a, b) => Createblockchain(),

                          ),
                        );
                      },
                      child:  Text(
                        'Create a new account >',
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
    },
    );

}