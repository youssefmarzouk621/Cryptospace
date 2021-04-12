import 'package:flutter_universe/2.%20Wallet/qr_create_page.dart';
import 'package:flutter_universe/2.%20Wallet/qr_scan_page.dart';
import '../staticdata/constants.dart';
import 'package:flutter_universe/custom_widgets/graph_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter_universe/custom_widgets/card_widget.dart';
import 'package:flutter_universe/custom_widgets/transaction_list_widget.dart';

class Coindetails extends StatefulWidget {
  Coindetails({Key key}) : super(key: key);

  @override
  _CoindetailsState createState() => _CoindetailsState();
}

class _CoindetailsState extends State<Coindetails> {
  final numberFormat = new NumberFormat("##,###.00#", "en_US");
  Color color = ColorConstants.gblackColor;
  Color fcolor = ColorConstants.kgreyColor;
  bool isActive = false;
  int activeIndex;
  @override
  Widget build(BuildContext context) {
    return
      Container(
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
            child:
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Bitcoin",
                    style: GoogleFonts.spartan(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: ColorConstants.kwhiteColor,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Stats and Operations.",
                    style: GoogleFonts.spartan(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff60a8e2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' + "${numberFormat.format(27802.05)}",
                        style: GoogleFonts.openSans(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.kwhiteColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "15%",
                            style: GoogleFonts.spartan(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.kwhiteColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: ColorConstants.kwhiteColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  // Center(
                  //   child: Container(
                  //     height: MediaQuery.of(context).size.height / 2.5,
                  //     width: MediaQuery.of(context).size.width,
                  //     child: BezierChart(
                  //       bezierChartScale: BezierChartScale.CUSTOM,
                  //       selectedValue: 1,
                  //       xAxisCustomValues: [1, 5, 10, 15, 20, 25, 30],
                  //       series: const [
                  //         BezierLine(
                  //           label: "june",
                  //           lineColor: const Color(0xfff9d505),
                  //           dataPointStrokeColor: ColorConstants.kwhiteColor,
                  //           dataPointFillColor: ColorConstants.korangeColor,
                  //           lineStrokeWidth: 3,
                  //           data: const [
                  //             DataPoint<double>(value: 100, xAxis: 1),
                  //             DataPoint<double>(value: 130, xAxis: 5),
                  //             DataPoint<double>(value: 300, xAxis: 10),
                  //             DataPoint<double>(value: 150, xAxis: 15),
                  //             DataPoint<double>(value: 75, xAxis: 20),
                  //             DataPoint<double>(value: 100, xAxis: 25),
                  //             DataPoint<double>(value: 250, xAxis: 30),
                  //           ],
                  //         ),
                  //       ],
                  //       config: BezierChartConfig(
                  //         startYAxisFromNonZeroValue: true,
                  //         verticalIndicatorFixedPosition: false,
                  //         bubbleIndicatorColor: ColorConstants.gblackColor,
                  //         bubbleIndicatorLabelStyle:
                  //         TextStyle(color: ColorConstants.kwhiteColor),
                  //         bubbleIndicatorTitleStyle:
                  //         TextStyle(color: ColorConstants.kwhiteColor),
                  //         bubbleIndicatorValueStyle:
                  //         TextStyle(color: ColorConstants.kwhiteColor),
                  //         footerHeight: 40,
                  //         displayYAxis: false,
                  //
                  //         stepsYAxis: 15,
                  //         displayLinesXAxis: false,
                  //         xAxisTextStyle: TextStyle(
                  //           color: ColorConstants.kwhiteColor,
                  //         ),
                  //
                  //         snap: false,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 3.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: const Color(0xffF9D505),
                        ),
                        child: Center(
                          child: Text(
                            "Apr to Jun",
                            style: GoogleFonts.spartan(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff523896),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GraphCardWidget(
                        title: Constants.strList[0],
                        activeColor: Color.fromRGBO(65, 45, 135, 0.3),
                        fontColor: Colors.white,
                        isActive: isActive,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GraphCardWidget(
                        title: Constants.strList[1],
                        activeColor: Color.fromRGBO(65, 45, 135, 0.3),
                        fontColor: Colors.white,
                        isActive: isActive,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GraphCardWidget(
                        title: Constants.strList[2],
                        activeColor: Color.fromRGBO(65, 45, 135, 0.3),
                        fontColor: Colors.white,
                        isActive: isActive,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ButtonTheme(
                        minWidth: 150.0,
                      child: OutlineButton(
                  disabledBorderColor: const Color(0xffffffff),
                        highlightedBorderColor: const Color(0xffffffff),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => QRScanPage(),
                            ),
                          )
                        },

                        padding: EdgeInsets.all(10.0),
                        child: Row( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.send,color: const Color(0xffffffff),),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Send",style: TextStyle(color: const Color(0xffffffff),))
                          ],
                        ),
                      ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ButtonTheme(
                        minWidth: 150.0,
                        child: OutlineButton(
                        disabledBorderColor: const Color(0xffffffff),
                        highlightedBorderColor: const Color(0xffffffff),
                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () => {

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) => QRCreatePage(),
                            ),
                          )
                        },

                        padding: EdgeInsets.all(10.0),
                        child: Row( // Replace with a Row for horizontal icon + text
                          children: <Widget>[
                            Icon(Icons.attach_money,color: const Color(0xffffffff),),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Receive",style: TextStyle(color: const Color(0xffffffff),))
                          ],
                        ),
                      ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Income",
                        style: GoogleFonts.spartan(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.kwhiteColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "75%",
                            style: GoogleFonts.spartan(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.kwhiteColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: ColorConstants.kwhiteColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Outcome",
                        style: GoogleFonts.spartan(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorConstants.kwhiteColor,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "25%",
                            style: GoogleFonts.spartan(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.kwhiteColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: ColorConstants.kwhiteColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height:15,
                  ),
                  Divider(
                      color: const Color(0xffAD9FF4),
                  ),
                  SizedBox(
                    height:15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      top: 5,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

                                3,
                                (index) {
                              return TransactionListWidget(
                                icon: Icon(
                                      Icons.arrow_upward_rounded,
                                      color: ColorConstants.kwhiteColor,
                                    ),
                                titleTxt: "2/17/2021",
                                subtitleTxt: "#1Z10689450",
                                amount: "2010",
                              );
                            },
                          ),
                        ),


                        SizedBox(
                          height: 20,
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
}
