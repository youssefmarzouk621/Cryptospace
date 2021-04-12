import 'package:flutter/material.dart';
import 'package:flutter_universe/0.%20Login/PhraseAuth.dart';
import 'package:flutter_universe/Controllers/AuthentificationController.dart';
import 'package:flutter_universe/index.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:flushbar/flushbar.dart';
import 'dart:async';
import  'package:circular_countdown/circular_countdown.dart';

import 'Importblockchain.dart';

class validationEmail extends StatefulWidget {
  final String code;
  final String email;

  validationEmail(this.code, this.email);

  @override
  _validationEmailState createState() => _validationEmailState();
}

class _validationEmailState extends State<validationEmail> {

  bool verif=true;
  final AuthentificationController authController = AuthentificationController();
  Future<String> _futureResponse;
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
        //resizeToAvoidBottomPadding: false,
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
                                'IDENTITY',
                                style:
                                TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff)),
                              ),
                            ]
                        ),
                        Row(
                            children: [
                              SizedBox(width: 35.0),
                              Text(
                                'VERIFICATION.',
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
                                  ' Please enter the activation \n code sent to your mail.',
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
                            fieldsCount: 5,
                            onSubmit: (String pin) => _showSnackBar(pin, context,widget.code,verif),
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

                      ]
                  ),

                ],
              ),
            ),
            SizedBox(height: 5.0),
            Center(
              child: Container(
                height: 170,
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(65, 45, 135, 0.3),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TimeCircularCountdown(
                      unit: CountdownUnit.second,
                      countdownTotal: 60,
                      diameter: 70,
                      onUpdated: (unit, remainingTime) => print('Updated'),
                      onFinished: () => {
                        verif=changeverif(verif),
                        print("verif"),
                        print(verif),
                      },
                    ),
                    SizedBox(height: 5.0),
                    // Align however you like (i.e .centerRight, centerLeft)
                    Center(
                      child:
                      Text("The activation key \n lasts only 1 minute.",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),),
                    ),
                  ],
                ),
              ),
            ),

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


  void _showSnackBar(String pin, BuildContext context, String code, bool verif) {
    print("hereee");
    //_pinPutFocusNode.unfocus();
    if((pin == code)&&(verif == true)){
      Flushbar(flushbarStyle: FlushbarStyle.GROUNDED,message: "Correct. Redirecting...",).show(context);
      //verification
      _futureResponse = authController.verifyAccount(widget.email);
      _futureResponse.then((value) => {
        if(value.toString()=="success"){
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
          ),
        }else if(value.toString()=="error"){
          print("error while verifying")
        }else{
          print("internal server error")
        }
      });

    }
    else if (verif == false){
      Flushbar(flushbarStyle: FlushbarStyle.GROUNDED,message: "Your code expired.",).show(context);
    }
    else if (pin != code){
      Flushbar(flushbarStyle: FlushbarStyle.GROUNDED,message: "Wrong code.",).show(context);
    }


  }

}
