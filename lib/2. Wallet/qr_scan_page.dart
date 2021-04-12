import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/Controllers/TransactionController.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../main.dart';

class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

Future<String> getClipBoardData() async {
  ClipboardData data = await Clipboard.getData(Clipboard.kTextPlain);
  return data.text;
}


class _QRScanPageState extends State<QRScanPage> {
  // String account = "0xac5342d80471B1fC46E22c691B09dCDd19bE061A"; //local blockchain
  // String receiver = '0x26d7d9cfABF292915e1E6f45110f24ea9341EF5E';

  String account = "0x6E4F4EB138b3e6b0E08f5f7b0e1AfAB2b0Fef7C7"; //deployed blockchain
  String receiver = '';

  final TransactionController transactionController = TransactionController();
  Future<int> _futureResponse;

  final amount = TextEditingController();

  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) =>
      FutureBuilder<String>(
        future: getClipBoardData(),
        initialData: 'nothing',// a previously-obtained Future<String> or null
        builder: (BuildContext context, snapShot) {
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
              body:
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            "Send Vault Coin",
                            style: GoogleFonts.spartan(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      Text(
                        'Vault Address',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(65, 45, 135, 0.3),
                        ),
                        child: Center(
                          child: Text(
                            '$receiver',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            OutlineButton(
                              disabledBorderColor: const Color(0xffffffff),
                              highlightedBorderColor: const Color(0xffffffff),
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                              onPressed: () => {
                                setState(() {
                                  this.receiver = snapShot.data.toString();
                                }),
                              },

                              child: Row( // Replace with a Row for horizontal icon + text
                                children: <Widget>[
                                  Icon(Icons.copy,color: const Color(0xffffffff),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Paste",style: TextStyle(color: const Color(0xffffffff),))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RaisedButton (
                              onPressed: () => scanreceiver(),
                              color: const Color(0xffF9D505),
                              child: Text("Start QR scan"),
                            ),
                          ]
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          autofocus: false,
                          controller: amount,
                          keyboardType: TextInputType.number,
                          style: TextStyle(fontSize: 22.0, color: Color(0xFFbdc6cf)),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(65, 45, 135, 0.3),
                            hintStyle: TextStyle( fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFFa2c0fc),
                              fontSize: 16,),
                            hintText: 'Amount to send',
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
                      SizedBox(height: 20),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                      height: MediaQuery.of(context).size.height/11.0,
                      // splashColor: Colors.red,
                      color: const Color.fromRGBO(65, 45, 135, 0.7),
                      // textColor: Colors.white,
                      child: Text('Send',
                          style: TextStyle( fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                            color: const Color(0xFFffffff),
                            fontSize: 19,)
                      ),
                      onPressed: () {
                        setState(() {
                          if(receiver.isEmpty){
                            EasyLoading.showError('please specify the receiver');

                          }else if(amount.text.isEmpty){
                            EasyLoading.showError('please specify the amount of tokens you want to transfer');
                          }else{
                            _verificationModalBottomSheet(context);
                          }

                        });
                      },
                    )),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  Future<void> scanreceiver() async {
    try {
      final receiver = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.receiver = receiver;
      });
    } on PlatformException {
      receiver = 'Failed to get platform version.';
    }
  }

  // Edit Modal
  void _verificationModalBottomSheet(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return Container(
          height: MediaQuery.of(context).size.height * .60,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Text("Identity verification"),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.cancel, color: Colors.orange, size: 25,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )

                  ],
                ),
                Row(
                    children: [
                      Text(
                        "Please enter the security code",
                        style: TextStyle(fontSize: 20, color: Color(0xFF367F8D)),
                      ),
                    ]
                ),
                Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    child: PinPut(
                      fieldsCount: 4,
                      onSubmit: ((String pin) => {
                        EasyLoading.init(),
                        if(pin=="5555"){
                          _futureResponse = transactionController.SendTokenService(amount.text,account,receiver),
                          _futureResponse.then((val) => {
                            if(val==-1){
                              EasyLoading.showError('please try again later'),
                            }else{
                              Navigator.of(context).pop(),
                              EasyLoading.showSuccess('Transaction approved'),
                            }
                          })

                        }else{
                          EasyLoading.showError('Wrong security code'),
                          print("wrong pincode")
                        }

                      }),
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      selectedFieldDecoration: _pinPutDecoration.copyWith(
                        border: Border.all(
                          color: Color(0xFF3FA5B1),
                        ),
                      ),
                      followingFieldDecoration: _pinPutDecoration.copyWith(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Color(0xFF3FA5B1),
                        ),
                      ),
                    )
                ),
              ],
            ),
          )
      );
    });
  }

}
