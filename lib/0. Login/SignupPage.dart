import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/0. Login/validationField.dart';
import 'package:flutter_universe/0. Login/validationEmail.dart';
import 'package:flutter_universe/0.%20Login/SignupPassword.dart';
import 'dart:math';
import 'package:string_validator/string_validator.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState  extends State<SignupPage> with TickerProviderStateMixin  {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final myController = TextEditingController();
  final phoneController = TextEditingController();
  final FirstnameController = TextEditingController();
  final LastnameController = TextEditingController();
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)  {
    bool connectivity;
     checkconnectivity() async {
      bool result = await DataConnectionChecker().hasConnection;
      if(result == true) {
        connectivity = true;
      } else {
        print('No internet :( Reason:');
        print(DataConnectionChecker().lastTryResults);
        connectivity = false;
      }
    }
    checkconnectivity();

    String code = "";
    var rng = new Random();
    for (var i = 0; i < 5; i++) {
      String chiffre = rng.nextInt(10).toString();
      code = code+ chiffre;
    }
    return Container (
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          colors: [const Color(0xFF543CBA),const Color(0xFF3FA5B1)],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0x00000000),
        //resizeToAvoidBottomPadding: false,
        body:  SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            SizedBox(height: MediaQuery.of(context).size.height / 50.1),
            IconButton(
              icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 90.1),
            Container(
              child: Stack(
                children: <Widget>[
                  Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 14.1,),
                        RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),

                            children: <TextSpan>[
                              new TextSpan(text: "SIGN ",style:
                              TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff)),),

                              new TextSpan(text: "UP", style:
                              TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold,color:const Color(0xFFf9d505))),
                            ],
                          ),
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

                        controller: FirstnameController,
                        autofocus: false,
                        style: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFffffff),
                          fontSize: 16,),
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: TextStyle( fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFa2c0fc),
                            fontSize: 16,),
                          hintText: 'Firstname',
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

                    SizedBox(height: 15.0),
                    Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(

                        controller: LastnameController,
                        autofocus: false,
                        style: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFffffff),
                          fontSize: 16,),
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: TextStyle( fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFa2c0fc),
                            fontSize: 16,),
                          hintText: 'Lastname',
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

                    SizedBox(height: 15.0),
                    Theme(
                      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                      child: TextField(

                        controller: myController,
                        autofocus: false,
                        style: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFffffff),
                          fontSize: 16,),
                        decoration: InputDecoration(

                          filled: true,
                          fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                          hintStyle: TextStyle( fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFa2c0fc),
                            fontSize: 16,),
                          hintText: 'Email',
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

                    SizedBox(height: 15.0),
                    IntlPhoneField(

                      countryCodeTextColor: Colors.white,
                      dropDownArrowColor: Colors.white,
                      controller: phoneController,
                      style: TextStyle( fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFffffff),
                        fontSize: 16,),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                        hintStyle: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFa2c0fc),
                          fontSize: 16,),
                        hintText: 'Phone Number',
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
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(height: 15.0),
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
                              child: Text('Sign Up',
                                  style: TextStyle( fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFFffffff),
                                    fontSize: 19,)
                              ),
                              onPressed: () {
                                final bool isValid = EmailValidator.validate(myController.text);
                                print('Email is valid? ' + (isValid ? 'yes' : 'no'));
                                if((isValid == true)&&(connectivity == true)&&(phoneController.text.length>0)&&(isAlpha(FirstnameController.text)== true)&&(isAlpha(LastnameController.text)== true)){

                                  print(FirstnameController.text);
                                    print(nameRegExp.hasMatch(FirstnameController.text));
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
                                      pageBuilder: (context, a, b) => SignupPassword(FirstnameController.text,LastnameController.text,phoneController.text,myController.text),

                                    ),
                                  );
                                }
                                else if (isValid == false){
                                  EasyLoading.init();
                                  EasyLoading.showError('Invalid Email.');
                                }

                                else if (phoneController.text.length==0){
                                  EasyLoading.init();
                                  EasyLoading.showError('Please put your phone number.');
                                }

                                else if (isAlpha(FirstnameController.text)== false){
                                  EasyLoading.init();
                                  EasyLoading.showError('Invalid Firstname.');
                                }

                                else if (isAlpha(LastnameController.text)== false){
                                  EasyLoading.init();
                                  EasyLoading.showError('Invalid Lastname.');
                                }

                                else {
                                EasyLoading.init();
                                EasyLoading.showError('Please check your internet connection.');
                                }


                              },
                            ),
                          ),
                        ]
                    ),

                  ],
                )),
          ]),
        ),
      ),
    );
  }





}