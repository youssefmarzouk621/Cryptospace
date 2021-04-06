import 'package:flutter_universe/staticdata/constants.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TransactionListWidget extends StatelessWidget {
  final String titleTxt, subtitleTxt, subtitleTxt2;
  final String amount;
  final Icon icon;
  TransactionListWidget({
    Key key,
     @required this.icon,
    @required this.titleTxt,
    this.subtitleTxt,
    this.subtitleTxt2,
    @required this.amount,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final numberFormat = new NumberFormat("##,###", "en_US");
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromRGBO(65, 45, 135, 0.2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff8f79db),
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      child: Center(
                        child: icon,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          titleTxt,
                          style: GoogleFonts.spartan(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.kwhiteColor,

                          ),
                        ),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Text(
                        //   subtitleTxt,
                        //   style: GoogleFonts.spartan(
                        //     fontSize: 5,
                        //     fontWeight: FontWeight.w500,
                        //     color: const Color(0xffBEBEF4),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(amount+" Vault",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.kwhiteColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
