import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_universe/0.%20Login/Createblockchain.dart';
import 'package:flutter_universe/0.%20Login/Importblockchain.dart';
import 'package:flutter_universe/Storage/database_helper.dart';
import 'package:flutter_universe/index.dart';
import 'package:flutter_universe/startScreen.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/0. Login/SigninPage.dart';

import '2. Wallet/Wallet.dart';
import 'Models/Core_User.dart';
import 'Storage/Usersrepository.dart';
import 'Storage/database_creator.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // MobileAds.instance.initialize();
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    title: "App",
    initialRoute: '/home',
    routes: {
      '/home': (context) => MyApp(),
    },
    builder: EasyLoading.init()

));
EasyLoading.instance
  ..displayDuration = const Duration(milliseconds: 2000)
  ..indicatorType = EasyLoadingIndicatorType.fadingCircle
  ..loadingStyle = EasyLoadingStyle.dark
  ..indicatorSize = 45.0
  ..radius = 10.0
  ..progressColor = Colors.yellow
  ..backgroundColor = Colors.green
  ..indicatorColor = Colors.yellow
  ..textColor = Colors.yellow
  ..maskColor = Colors.blue.withOpacity(0.5)
  ..userInteractions = true
  ..dismissOnTap = false;
  myBanner.load();

}

class MyApp extends StatefulWidget {
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");
  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans");

  static const TextStyle greyStyle =
  TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "Product Sans");
  static const TextStyle whiteStyle =
  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "Product Sans");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "Product Sans",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "Product Sans",
  );

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int found;
  List<CoreUser> users;

  final pages = [
    Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/img/firstImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.grey,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "CryptoSpace",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Manage your wealth in a blockchain \n"
                      "wallet that combines solid \n"
                      "engineering and beautiful design",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Color(0xFF55006c),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/img/secondImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Daily Tasks.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Daily Rewards.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: const Color(0xffaf42b2),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Play games, do daily and weekly\n"
                      "tasks to earn tokens to add\n"
                      "to your wallet.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
    Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/img/firstImage.png"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Manage your",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "Cryptocurrencies.",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 35,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(

                  "Secure, manage, and exchange\n"
                      "your favorite cryptocurrencies\n"
                      "like Bitcoin.",

                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  ];





  @override
  Widget build(BuildContext context){
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    return FutureBuilder(
      future: UsersRepository.getConnectedUser(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data == null){
          return Container(
              child: Center(
                  child: SpinKitDoubleBounce(
                    color: Colors.blue,
                    size: 100.0,
                  )
              )
          );
        }else{
          if(snapshot.data==1){
            return IndexPage();
          }else{
            return startScreen();
          }
        }
      },
    );
    // users.then((value) => {
    //   print("length users : $found"),
    //   if(found==1){
    //     return IndexPage(),
    //   }
    //   return startScreen(),
    // });


  }
}











//animated
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:keyboard_visibility/keyboard_visibility.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           fontFamily: "Nunito"
//       ),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Container(
//           child: LoginPage(),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//
//   int _pageState = 0;
//
//   var _backgroundColor = Colors.white;
//   var _headingColor = Color(0xFFB40284A);
//
//   double _headingTop = 100;
//
//   double _loginWidth = 0;
//   double _loginHeight = 0;
//   double _loginOpacity = 1;
//
//   double _loginYOffset = 0;
//   double _loginXOffset = 0;
//   double _registerYOffset = 0;
//   double _registerHeight = 0;
//
//   double windowWidth = 0;
//   double windowHeight = 0;
//
//   bool _keyboardVisible = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     KeyboardVisibilityNotification().addNewListener(
//       onChange: (bool visible) {
//         setState(() {
//           _keyboardVisible = visible;
//           print("Keyboard State Changed : $visible");
//         });
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     windowHeight = MediaQuery.of(context).size.height;
//     windowWidth = MediaQuery.of(context).size.width;
//
//     _loginHeight = windowHeight - 270;
//     _registerHeight = windowHeight - 270;
//
//     switch(_pageState) {
//       case 0:
//         _backgroundColor = Colors.white;
//         _headingColor = Color(0xFFB40284A);
//
//         _headingTop = 100;
//
//         _loginWidth = windowWidth;
//         _loginOpacity = 1;
//
//         _loginYOffset = windowHeight;
//         _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
//
//         _loginXOffset = 0;
//         _registerYOffset = windowHeight;
//         break;
//       case 1:
//         _backgroundColor = Color(0xFFBD34C59);
//         _headingColor = Colors.white;
//
//         _headingTop = 90;
//
//         _loginWidth = windowWidth;
//         _loginOpacity = 1;
//
//         _loginYOffset = _keyboardVisible ? 40 : 270;
//         _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
//
//         _loginXOffset = 0;
//         _registerYOffset = windowHeight;
//         break;
//       case 2:
//         _backgroundColor = Color(0xFFBD34C59);
//         _headingColor = Colors.white;
//
//         _headingTop = 80;
//
//         _loginWidth = windowWidth - 40;
//         _loginOpacity = 0.7;
//
//         _loginYOffset = _keyboardVisible ? 30 : 240;
//         _loginHeight = _keyboardVisible ? windowHeight : windowHeight - 240;
//
//         _loginXOffset = 20;
//         _registerYOffset = _keyboardVisible ? 55 : 270;
//         _registerHeight = _keyboardVisible ? windowHeight : windowHeight - 270;
//         break;
//     }
//
//     return Stack(
//       children: <Widget>[
//         AnimatedContainer(
//             curve: Curves.fastLinearToSlowEaseIn,
//             duration: Duration(
//                 milliseconds: 1000
//             ),
//             color: _backgroundColor,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _pageState = 0;
//                     });
//                   },
//                   child: Container(
//                     child: Column(
//                       children: <Widget>[
//                         AnimatedContainer(
//                           curve: Curves.fastLinearToSlowEaseIn,
//                           duration: Duration(
//                               milliseconds: 1000
//                           ),
//                           margin: EdgeInsets.only(
//                             top: _headingTop,
//                           ),
//                           child: Text(
//                             "Learn Free",
//                             style: TextStyle(
//                                 color: _headingColor,
//                                 fontSize: 28
//                             ),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.all(20),
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 32
//                           ),
//                           child: Text(
//                             "We make learning easy. Join Tvac Studio to learn flutter for free on YouTube.",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 color: _headingColor,
//                                 fontSize: 16
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: 32
//                   ),
//                   child: Center(
//                     child: Image.asset("assets/images/splash_bg.png"),
//                   ),
//                 ),
//                 Container(
//                   child: GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         if(_pageState != 0){
//                           _pageState = 0;
//                         } else {
//                           _pageState = 1;
//                         }
//                       });
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(32),
//                       padding: EdgeInsets.all(20),
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: Color(0xFFB40284A),
//                           borderRadius: BorderRadius.circular(50)
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Get Started",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             )
//         ),
//         AnimatedContainer(
//           padding: EdgeInsets.all(32),
//           width: _loginWidth,
//           height: _loginHeight,
//           curve: Curves.fastLinearToSlowEaseIn,
//           duration: Duration(
//               milliseconds: 1000
//           ),
//           transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
//           decoration: BoxDecoration(
//               color: Colors.white.withOpacity(_loginOpacity),
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25)
//               )
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       "Login To Continue",
//                       style: TextStyle(
//                           fontSize: 20
//                       ),
//                     ),
//                   ),
//                   InputWithIcon(
//                     icon: Icons.email,
//                     hint: "Enter Email...",
//                   ),
//                   SizedBox(height: 20,),
//                   InputWithIcon(
//                     icon: Icons.vpn_key,
//                     hint: "Enter Password...",
//                   )
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   PrimaryButton(
//                     btnText: "Login",
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _pageState = 2;
//                       });
//                     },
//                     child: OutlineBtn(
//                       btnText: "Create New Account",
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//         AnimatedContainer(
//           height: _registerHeight,
//           padding: EdgeInsets.all(32),
//           curve: Curves.fastLinearToSlowEaseIn,
//           duration: Duration(
//               milliseconds: 1000
//           ),
//           transform: Matrix4.translationValues(0, _registerYOffset, 1),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(25),
//                   topRight: Radius.circular(25)
//               )
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   Container(
//                     margin: EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       "Create a New Account",
//                       style: TextStyle(
//                           fontSize: 20
//                       ),
//                     ),
//                   ),
//                   InputWithIcon(
//                     icon: Icons.email,
//                     hint: "Enter Email...",
//                   ),
//                   SizedBox(height: 20,),
//                   InputWithIcon(
//                     icon: Icons.vpn_key,
//                     hint: "Enter Password...",
//                   )
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   PrimaryButton(
//                     btnText: "Create Account",
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         _pageState = 1;
//                       });
//                     },
//                     child: OutlineBtn(
//                       btnText: "Back To Login",
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class InputWithIcon extends StatefulWidget {
//   final IconData icon;
//   final String hint;
//   InputWithIcon({this.icon, this.hint});
//
//   @override
//   _InputWithIconState createState() => _InputWithIconState();
// }
//
// class _InputWithIconState extends State<InputWithIcon> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: Color(0xFFBC7C7C7),
//               width: 2
//           ),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       child: Row(
//         children: <Widget>[
//           Container(
//               width: 60,
//               child: Icon(
//                 widget.icon,
//                 size: 20,
//                 color: Color(0xFFBB9B9B9),
//               )
//           ),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(vertical: 20),
//                   border: InputBorder.none,
//                   hintText: widget.hint
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
// class PrimaryButton extends StatefulWidget {
//   final String btnText;
//   PrimaryButton({this.btnText});
//
//   @override
//   _PrimaryButtonState createState() => _PrimaryButtonState();
// }
//
// class _PrimaryButtonState extends State<PrimaryButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Color(0xFFB40284A),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       padding: EdgeInsets.all(20),
//       child: Center(
//         child: Text(
//           widget.btnText,
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 16
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class OutlineBtn extends StatefulWidget {
//   final String btnText;
//   OutlineBtn({this.btnText});
//
//   @override
//   _OutlineBtnState createState() => _OutlineBtnState();
// }
//
// class _OutlineBtnState extends State<OutlineBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: Border.all(
//               color: Color(0xFFB40284A),
//               width: 2
//           ),
//           borderRadius: BorderRadius.circular(50)
//       ),
//       padding: EdgeInsets.all(20),
//       child: Center(
//         child: Text(
//           widget.btnText,
//           style: TextStyle(
//               color: Color(0xFFB40284A),
//               fontSize: 16
//           ),
//         ),
//       ),
//     );
//   }
// }
//
