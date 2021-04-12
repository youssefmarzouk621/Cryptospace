import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';


//String baseURL = "10.0.2.2:3000"; //local blockchain
String baseURL = "192.168.1.46:3000"; //deployed blockchain

Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFBD9098);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Color(0xFF08479D);
Color gradientEndColor = Color(0xFF9151BF);


class ColorConstants {
  static const kwhiteColor = Colors.white;
  static const kblackColor = Colors.black;
  static const korangeColor = Color(0xfffe752f);
  static const kgreyColor = Color(0xff909090);
  static const gblackColor = Color(0xff242424);
  static const cblackColor = Color(0xFF313131);
  static const corangeColor = Color(0xffdd601e);
}

class Constants {
  static List<Icon> iconList = [
    Icon(
      Icons.arrow_upward_rounded,
      color: ColorConstants.kwhiteColor,
    ),
  ];


  static List<String> titleList = [
    "2/17/2021",
  ];


  static List<String> subtitleList = [
    "#1Z10689450",
  ];

  static List<String> subtitleList2 = [
    "0.2565482 BTC",
    "0.4253245 ETH",
    "1.2756954 LTC",
  ];
  static List<int> amountList = [
    2010,
  ];

  static List<String> strList = [
    "1 \n Month",
    "6 \n Month",
    "1 \n Year",
  ];

  static List<String> titleList2 = [
    "Bitcoin",
    "Ethereum",
    "LiteCoin",
  ];
}
