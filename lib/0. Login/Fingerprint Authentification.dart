import 'package:flutter/material.dart';
import 'package:flutter_universe/0. Login/SignupPage.dart';
import 'package:flutter_universe/0. Login/Pincode.dart';
import 'package:flutter_universe/0.%20Login/PhraseAuth.dart';
import 'package:flutter_universe/0. Login/Importblockchain.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';


class Fingerprint extends StatefulWidget {
  @override
  _FingerprintState createState() => _FingerprintState();
}



class _FingerprintState extends State<Fingerprint> {

  int index=0;

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String _authorizedOrNot = "Not Authorized";
  List<BiometricType> _availableBiometricTypes = List<BiometricType>();

  Future<void> _getListOfBiometricTypes() async {
    List<BiometricType> listofBiometrics;

      listofBiometrics = await _localAuthentication.getAvailableBiometrics();


    if (!mounted) return;
    setState(() {
      _availableBiometricTypes = listofBiometrics;
    });

    if (_availableBiometricTypes.contains(BiometricType.fingerprint))
    {
      setState(() {
        index = 1;
      });
    }
  }

  Future<void> _authorizeNow() async {

    bool isAuthorized = false;
    try {
      isAuthorized = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: "Please authenticate to complete your transaction",
        useErrorDialogs: true,
        stickyAuth: true,
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      if (isAuthorized) {

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

        _authorizedOrNot = "Authorized";
      } else {
        _authorizedOrNot = "Not Authorized";
      }
    });
  }


  @override
  void initState() {
    _getListOfBiometricTypes();
    super.initState();
  }


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

                      ]
                  ),

                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    _buildCategoryCards(context,index),


                    SizedBox(height: 35.0),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 1.0),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: FlatButton(
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              height: MediaQuery.of(context).size.height/11.0,

                              // splashColor: Colors.red,
                              color: const Color.fromRGBO(65, 45, 135, 0.7),
                              // textColor: Colors.white,
                              child: Text('Authenticate',
                                  style: TextStyle( fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFFffffff),
                                    fontSize: 14,)
                              ),
                              onPressed: () {
                                _getListOfBiometricTypes();
                                print("pls");
                                print("List Of Biometric : ${_availableBiometricTypes.toString()}");
                                print(_availableBiometricTypes);
                                _authorizeNow();
                              },
                            ),
                          ),
                        ]
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/7.1),

                  ],
                )),

          ]),
        ),
      ),
    );

  }
  Widget _buildCategoryCards(BuildContext context, int index) {
    if (index == 0)
      { return Container(
        height: 150,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(65, 45, 135, 0.3),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded,color: const Color(0xfff9d505),size: 30,),
            // Align however you like (i.e .centerRight, centerLeft)
            Center(
              child:
              Text(" No fingerprint is detected yet in this device. Please go to Settings > Security > Fingerprints and add your fingerprint.",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),),
            ),
          ],
        ),
      );}

    else {
      return Container(
        height: 100,
        width: MediaQuery.of(context).size.width/1.1,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(65, 45, 135, 0.3),
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline,color: const Color(0xff32CD32),size: 30,),
            // Align however you like (i.e .centerRight, centerLeft)
            Center(
              child:
              Text(" Your device already contains fingerprints. Click on authenticate to continue.",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),),
            ),
          ],
        ),
      );
    }

  }
}