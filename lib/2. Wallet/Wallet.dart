import 'dart:convert';

import 'package:http/http.dart';

import '../staticdata/constants.dart';
import 'package:flutter_universe/custom_widgets/card_widget.dart';
import 'package:flutter_universe/2. Wallet/Coindetails.dart';

import 'package:flutter_universe/custom_widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:http/http.dart' as http;

var myaccount;
String balance;
class Wallet extends StatefulWidget {

  @override
  _WalletdetailsState createState() => _WalletdetailsState();
}
class _WalletdetailsState extends State<Wallet> {

  int touchedIndex;
  List data;


  getTransactions(myaccount) async{

    var url = "http://10.0.2.2:3000/api/token/history";

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': myaccount,
      }),
    );

    print(response.body);
    this.setState(() {
      data = json.decode(response.body);
    });

  }

  getBalance(myaccount) async{

    var url = "http://10.0.2.2:3000/api/token/getBalance";

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'account': myaccount,
      }),
    );

    print(response.body);
    var parse;
    parse = jsonDecode(response.body);
    balance = parse["balance"];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myaccount="0xac5342d80471B1fC46E22c691B09dCDd19bE061A";
    getBalance("0xac5342d80471B1fC46E22c691B09dCDd19bE061A");
    getTransactions(myaccount);

  }
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
                        'My Wallet',
                        style: GoogleFonts.spartan(
                          fontSize: 33,
                          fontWeight: FontWeight.w700,
                          color: ColorConstants.kwhiteColor,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'You have 3 Active Accounts.',
                        style: GoogleFonts.spartan(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff60a8e2),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                padding: const EdgeInsets.only(
                  left: 3,
                  right: 15,
                  top: 10,
                ),
                child: Container(
                  child: Expanded(
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                              pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                                setState(() {
                                  if (pieTouchResponse.touchInput is FlLongPressEnd ||
                                      pieTouchResponse.touchInput is FlPanEnd) {
                                    touchedIndex = -1;
                                  } else {
                                    touchedIndex = pieTouchResponse.touchedSectionIndex;
                                  }
                                });
                              }),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 5,
                              centerSpaceRadius: 110,
                              sections: showingSections()),
                        ),
                      ),
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                        children: [
                        Column(
                          children: List.generate(
                            Constants.titleList.length,
                                (index) {
                              return new GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, a, b) => Coindetails(),
                                    ),
                                  );
                                },
                                child: TransactionListWidget(
                                  icon: Constants.iconList[index],
                                  titleTxt: "Vault",
                                  subtitleTxt: "",
                                  amount: balance,
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recent Transactions",
                                style: GoogleFonts.spartan(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: ColorConstants.kwhiteColor,
                                ),
                              ),

                              Text(
                                "See All",
                                style: GoogleFonts.spartan(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffBEBEF4),
                                ),
                              ),
                            ]
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: List.generate(
                              data == null ? 0 : data.length,
                                (index) {
                              return TransactionListWidget(
                                icon: data[index]["from"] == myaccount ? Icon(
                                  Icons.arrow_upward_rounded,
                                  color: ColorConstants.kwhiteColor,
                                ) : Icon(
                                  Icons.arrow_downward_rounded,
                                  color: ColorConstants.kwhiteColor,
                                ),
                                titleTxt: data[index]["from"] == myaccount ? "Transfered" : "Received",
                                subtitleTxt:  data[index]["to"],
                                amount:  data[index]["tokens"],
                              );
                            },
                          ),
                        ),
                      ]

                    ),

                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xFFfad502),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

