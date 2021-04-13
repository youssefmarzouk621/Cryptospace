import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/0. Login/PhraseAuth.dart';
import 'package:flutter_universe/0. Login/Fingerprint Authentification.dart';
import 'package:flutter_universe/Models/Core_User.dart';
import 'package:flutter_universe/Storage/Usersrepository.dart';
import 'package:flutter_universe/index.dart';
import 'package:local_auth/local_auth.dart';

import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:async';
import  'package:circular_countdown/circular_countdown.dart';

class Pincode extends StatefulWidget {
  @override
  _PincodeState createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  int Fingerprintchoice = 0;
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _canCheckBiometric = false;
  List<BiometricType> _availableBiometricTypes = List<BiometricType>();
  Future<void> _checkBiometric() async {
    bool canCheckBiometric = false;
    try {
      canCheckBiometric = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("available:");
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<CoreUser> _futureUser;

  @override
  void initState() {
    _checkBiometric();
    super.initState();
  }

  bool verif=true;

  bool changeverif(bool verif){
    setState(() {
      verif=false;
    });
    return verif;
  }
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }


  @override
  Widget build(BuildContext context) {

    // when it finish the onDone cb is called

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
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Column(
                      children: [
                        Row(
                            children: [
                              SizedBox(width: 35.0),
                              Text(
                                'SECURE',
                                style:
                                TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff)),
                              ),
                            ]
                        ),
                        Row(
                            children: [
                              SizedBox(width: 35.0),
                              Text(
                                'YOUR ACCOUNT.',
                                style:
                                TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,color:const Color(0xFFf9d505)),
                              ),
                            ]
                        ),

                        SizedBox(height: 5.0),

                        Row(
                            children: [
                              SizedBox(width: 35.0),
                              Align(
                                alignment: Alignment.centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                                child:  Text(
                                  ' Please set up your pin \n code to secure your transactions.',
                                  textAlign: TextAlign.left,
                                  style:
                                  TextStyle(fontSize: 17.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),
                                ),
                              ),
                            ]
                        ),
                        Container(
                          color: Color(0x00000000),
                          margin: const EdgeInsets.all(20.0),
                          padding: const EdgeInsets.all(20.0),
                          child: PinPut(
                            fieldsCount: 4,

                            focusNode: _pinPutFocusNode,
                            controller: _pinPutController,
                            submittedFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFffffff),
                            ),
                            selectedFieldDecoration: _pinPutDecoration.copyWith(
                              border: Border.all(
                                color: Color(0xFFf9d505),
                              ),
                            ),
                            followingFieldDecoration: _pinPutDecoration.copyWith(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
                                    _checkBiometric();
                                    if ((_pinPutController.text.length == 4))
                                    {
                                      _futureUser = UsersRepository.getConnectedUser();
                                      _futureUser.then((coreUser) => {
                                        coreUser.pincode=_pinPutController.text,
                                        UsersRepository.updateUser(coreUser),
                                        if (_canCheckBiometric == true){
                                          print("can check bio"),
                                          _showMyDialog(),
                                        }else{
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
                                              pageBuilder: (context, a, b) => IndexPage(),

                                            ),
                                          ),
                                        }
                                      });
                                    }else{
                                      EasyLoading.init();
                                      EasyLoading.showError('Please enter your pincode');
                                    }

                                  },
                                ),
                              ),

                            ]
                        ),

                      ]
                  ),

                ],
              ),
            ),
            SizedBox(height: 5.0),



            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[


                    SizedBox(height: MediaQuery.of(context).size.height/7.1),


                  ],
                )),

          ]),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(' Fingerprint Security '),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your device is compatible with fingerprint authentification.'),
                Text('Would you like to use your custom fingerprint to secure your transactions ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No Thanks.',style: TextStyle(color: const Color(0xffC0C0C0))),
              onPressed: () {
                //-------------------------------------------------------------
                // hné t inseri fel base valeur Fingerprintchoice
                //-------------------------------------------------------------
                Navigator.of(context).pop();
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
                    pageBuilder: (context, a, b) => IndexPage(),

                  ),
                );
              },
            ),
            TextButton(
              child: Text('Approve'),
              onPressed: () {
                setState(() {
                  Fingerprintchoice = 1;
                });
                //-------------------------------------------------------------
                //lhné t inseri valeur Fingerprintchoice fel base
                //-------------------------------------------------------------
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
                    pageBuilder: (context, a, b) => Fingerprint(),

                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}