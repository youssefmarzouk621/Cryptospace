import 'package:flutter/material.dart';
import 'package:flutter_universe/0. Login/SignupPage.dart';
import 'package:flutter_universe/index.dart';
import 'package:flutter_universe/Controllers/AuthentificationController.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final AuthentificationController authController = AuthentificationController();
  Future<String> _futureResponse;
  final emailValue = TextEditingController();
  final passwordValue = TextEditingController();
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
        //resizeToAvoidBottomPadding: false,
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
                        Text('HELLO',style:TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff))),
                      ]
                    ),
                    Row(
                      children: [
                        SizedBox(width: 35.0),
                        Text('THERE.', style:TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold,color:const Color(0xFFf9d505))),
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
                controller: emailValue,
                style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
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

                  SizedBox(height: 14.0),
                  Theme(
                    data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                    child: TextField(
                      obscureText: true,
                      autofocus: false,
                      controller: passwordValue,
                      style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                        hintStyle: TextStyle( fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFa2c0fc),
                        fontSize: 16,),
                        hintText: 'Password',
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
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          height: MediaQuery.of(context).size.height/11.0,

                          // splashColor: Colors.red,
                          color: const Color.fromRGBO(65, 45, 135, 0.7),
                          // textColor: Colors.white,
                          child: Text('Sign In',
                              style: TextStyle( fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFffffff),
                                fontSize: 19,)
                          ),
                          onPressed: () {
                            setState(() {
                              if(emailValue.text.isEmpty || passwordValue.text.isEmpty){
                                EasyLoading.showError('please fill your inputs.');
                              }else{
                                _futureResponse = authController.loginService(emailValue.text,passwordValue.text);
                                _futureResponse.then((value) => {
                                  EasyLoading.init(),
                                  if(value.toString()=="notfound"){
                                    EasyLoading.showError('The email or mobile number you entered isn’t connected to an account. Find your account and log in.'),
                                  }else if(value.toString()=="password"){
                                    EasyLoading.showError('The password you’ve entered is incorrect.'),
                                  }else if(value.toString()=="verified"){
                                    EasyLoading.showError('Please verify your account.'),
                                  }else if(value.toString()=="Connected"){
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
                                    )
                                  }
                                });
                              }


                            });









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
                  pageBuilder: (context, a, b) => SignupPage(),

                ),
              );
                },
                child:  Text(
                  'Not a member yet ? Sign Up.',
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