import 'package:flutter_universe/Models/Core_User.dart';
import 'package:flutter_universe/Storage/Usersrepository.dart';
import 'package:flutter_universe/Storage/database_creator.dart';
import 'package:flutter_universe/Storage/database_helper.dart';
import 'package:flutter_universe/index.dart';

import '../staticdata/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
      child: Container(
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 35,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Settings',
                      style: GoogleFonts.spartan(
                        fontSize: 33,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.kwhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
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
                    child: Text('Logout',
                        style: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFffffff),
                          fontSize: 19,)
                    ),
                    onPressed: () async {
                      await DatabaseCreator().initDatabase();
                      Future<List<CoreUser>> users;
                      users = UsersRepository.getAllUsers();
                      users.then((value) async => {
                        await UsersRepository.deleteUser(value.first),
                        Navigator.popAndPushNamed(context, "/home"),
                      });
                    },
                  )
                ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
