import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_universe/Storage/Usersrepository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_universe/Controllers/TransactionController.dart';


class QRCreatePage extends StatefulWidget {

  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {

  final TransactionController transactionController = TransactionController();
  Future<String> _futureResponse;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) =>
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
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      "Receive Vault Coin",
                      style: GoogleFonts.spartan(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  'Your Vault Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15),
                FutureBuilder(
                  future: UsersRepository.getConnectedUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.data == null){
                      return Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(65, 45, 135, 0.3),
                        ),
                        child: Center(
                          child: Text(
                            "",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }else{
                      return Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 1.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color.fromRGBO(65, 45, 135, 0.3),
                        ),
                        child: Center(
                          child: Text(
                            snapshot.data.publickey,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(height: 15),
             Row(
             children: [
               SizedBox(
                 width: MediaQuery.of(context).size.width / 3.5,
               ),
               FutureBuilder(
                 future: UsersRepository.getConnectedUser(),
                 builder: (BuildContext context, AsyncSnapshot snapshot) {
                   if(snapshot.data == null){
                     return OutlineButton(
                       disabledBorderColor: const Color(0xffffffff),
                       highlightedBorderColor: const Color(0xffffffff),
                       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                       onPressed: () => {
                          print("not yet")
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,// Replace with a Row for horizontal icon + text
                         children: <Widget>[
                           Icon(Icons.copy,color: const Color(0xffffffff),),
                           SizedBox(
                             width: 10,
                           ),
                           Text("Copy",style: TextStyle(color: const Color(0xffffffff),))
                         ],
                       ),
                     );
                   }else{
                     return OutlineButton(
                       disabledBorderColor: const Color(0xffffffff),
                       highlightedBorderColor: const Color(0xffffffff),
                       shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                       onPressed: () => {
                         setState(() {
                           Clipboard.setData(new ClipboardData(text: snapshot.data.publickey));
                         }),
                       },
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,// Replace with a Row for horizontal icon + text
                         children: <Widget>[
                           Icon(Icons.copy,color: const Color(0xffffffff),),
                           SizedBox(
                             width: 10,
                           ),
                           Text("Copy",style: TextStyle(color: const Color(0xffffffff),))
                         ],
                       ),
                     );

                   }
                 },
               ),
             ]
             ),


                SizedBox(height: 10),
                FutureBuilder(
                  future: UsersRepository.getConnectedUser(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.data == null){
                      return Container(
                          child: Center(
                              child: SpinKitDoubleBounce(
                                color: Colors.white,
                                size: 70.0,
                              )
                          )
                      );
                    }else{
                      ;

                      return new Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF9D505))
                        ),
                        child:   BarcodeWidget(
                          barcode: Barcode.qrCode(),
                          color: Colors.white,
                          data: snapshot.data.publickey,
                          width: 180,
                          height: 180,
                        ),
                      );
                    }
                  },
                ),


              ],
            ),
          ),
        ),
          ),
      );
}
