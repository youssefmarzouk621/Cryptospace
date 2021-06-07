import 'package:flutter/cupertino.dart';
import 'package:flutter_universe/4.%20Settings/CirclePage.dart';
import 'package:flutter_universe/4.%20Settings/FAQPage.dart';
import 'package:flutter_universe/4.%20Settings/ProfilePage.dart';
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
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: ColorConstants.yellowColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Profile",1),
            buildAccountOptionRow(context, "FAQ",3),
            buildAccountOptionRow(context, "Your Circle",4),
            SizedBox(
              height: 70,
            ),

            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                color: const Color.fromRGBO(65, 45, 135, 0.7),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () async {
                  await DatabaseCreator().initDatabase();
                  Future<List<CoreUser>> users;
                  users = UsersRepository.getAllUsers();
                  users.then((value) async => {
                    await UsersRepository.deleteUser(value.first),
                    Navigator.popAndPushNamed(context, "/home"),
                  });
                },
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title,int choice) {
    return GestureDetector(
      onTap: () {
        switch (choice) {
          case 1:
            {
              Navigator.pushNamed(context, '/Profile');
              break;
            }
          case 3:
            {
              Navigator.pushNamed(context, '/FAQ');
              break;
            }
          case 4:
            {
              Navigator.pushNamed(context, '/Affiliate');
              break;
            }
          default:
            {
              Navigator.pushNamed(context, '/Profile');
              break;
            }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xDAFFFFFF),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
