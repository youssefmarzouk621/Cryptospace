import '../staticdata/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Exchange extends StatefulWidget {
  @override
  _Exchange createState() => _Exchange();
}
String valuechoose1;
String valuechoose2;
List Listcoins = ["BTC","ETH","LTC","BCH"];

class _Exchange extends State<Exchange> {
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
                      'Exchange',
                      style: GoogleFonts.spartan(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.kwhiteColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                Text(
                  'I have 1.8934 Bitcoin',
                  style: GoogleFonts.spartan(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff60a8e2),
                  ),
                ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                    children:[
                        new Image.asset(
                          'assets/bitcoin-logo.png',
                          width: 35.0,
                          height: 35.0,
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        DropdownButton(
                          hint: Text("BTC",style: TextStyle(color: const Color(0xFFffffff)),),
                          dropdownColor:const Color(0xFF8f79db),
                          icon: Icon(Icons.arrow_drop_down,color: const Color(0xFF5194d6),),
                          iconSize: 36,
                          //isExpanded: true,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFffffff),
                            fontSize: 22,
                          ),
                          value: valuechoose1,
                          onChanged: (newValue){
                            setState(() {
                              valuechoose1= newValue;
                            });
                            },
                          items: Listcoins.map((valueItem){
                           return DropdownMenuItem(
                             value: valueItem,
                               child: Text(valueItem),
                           );
                          }).toList(),
                     ),
                ]
                        ),

                        Row(
                          children:[
                            Icon(Icons.arrow_left,color: const Color(0xFF5194d6)),
                            Text(
                              '0.65',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFfad502),
                                fontSize: 22,
                              ),
                            ),
                            Icon(Icons.arrow_right,color: const Color(0xFF5194d6)),
                        ]
                        ),
                      ],
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Container(
                            height:0.5,
                            width:MediaQuery.of(context).size.width/1.4,
                            color: const Color(0xffAD9FF4),),

                          ButtonTheme(
                            minWidth: 35.0,
                            child: OutlineButton(
                              disabledBorderColor: const Color(0xffffffff),
                              highlightedBorderColor: const Color(0xffffffff),
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () => {print("Send")},

                              padding: EdgeInsets.all(10.0),
                              child: Row( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.compare_arrows,color: const Color(0xffffffff),),
                                ],
                              ),
                            ),
                          ),
                        ]
                    ),

                    Text(
                      'I want Ethereum',
                      style: GoogleFonts.spartan(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff60a8e2),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                            children:[
                              new Image.asset(
                                'assets/ethereum.png',
                                width: 35.0,
                                height: 35.0,
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              DropdownButton(
                                hint: Text("ETH",style: TextStyle(color: const Color(0xFFffffff)),),
                                dropdownColor:const Color(0xFF8f79db),
                                icon: Icon(Icons.arrow_drop_down,color: const Color(0xFF5194d6),),
                                iconSize: 36,
                                //isExpanded: true,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFFffffff),
                                  fontSize: 22,
                                ),
                                value: valuechoose2,
                                onChanged: (newValue){
                                  setState(() {
                                    valuechoose2= newValue;
                                  });
                                },
                                items: Listcoins.map((valueItem){
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                            ]
                        ),

                        Row(
                            children:[
                              Icon(Icons.arrow_left,color: const Color(0xFF5194d6)),
                              Text(
                                '+18.55',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFFfad502),
                                  fontSize: 22,
                                ),
                              ),
                              Icon(Icons.arrow_right,color: const Color(0xFF5194d6)),
                            ]
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(65, 45, 135, 0.3),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                    children: [
                        SizedBox(
                          width: 22,
                        ),
                        Text(
                          'Exchanging',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFb3afd3),
                            fontSize: 18,
                          ),
                        ),
                      ]
              ),
                        Row(
                          children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '0.65 BTC',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFfad502),
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              '\$2,518.95',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300,
                                color: const Color(0xFFffffff),
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 22,
                        ),
                      ],
                    ),
                      ],
        ),
                    ),

                    SizedBox(
                      height: 18,
                    ),

                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width/1.1,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(65, 45, 135, 0.3),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              children: [
                                SizedBox(
                                  width: 22,
                                ),
                                Text(
                                  'Receiving',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w300,
                                    color: const Color(0xFFb3afd3),
                                    fontSize: 18,
                                  ),
                                ),
                              ]
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    '+18.55 ETH',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFFfad502),
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    '\$2,465.20',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w300,
                                      color: const Color(0xFFffffff),
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 22,
                              ),
                            ],
                          ),
                        ],
                      ),
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

