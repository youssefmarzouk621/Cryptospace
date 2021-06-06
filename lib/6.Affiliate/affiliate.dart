import 'package:flutter/material.dart';
import 'package:flutter_universe/6.Affiliate/scrollable_widget.dart';
import 'package:flutter_universe/Models/User.dart';

class AffiliatePage extends StatefulWidget {
  @override
  _AffiliatePageState createState() => _AffiliatePageState();
}

class _AffiliatePageState extends State<AffiliatePage> {

  List<User> users;
  final allUsers = <User>[
    User(id:"",firstName: "Youssef",lastName: "Marzouk",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Mehdi",lastName: "Behira",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Salsabil",lastName: "Racil",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Chaima",lastName: "Sebai",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Youssef",lastName: "Marzouk",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Mehdi",lastName: "Behira",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Salsabil",lastName: "Racil",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Chaima",lastName: "Sebai",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Youssef",lastName: "Marzouk",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Mehdi",lastName: "Behira",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Salsabil",lastName: "Racil",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Chaima",lastName: "Sebai",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Youssef",lastName: "Marzouk",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Mehdi",lastName: "Behira",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Salsabil",lastName: "Racil",email: "",password: "",accessToken: "",phone: ""),
    User(id:"",firstName: "Chaima",lastName: "Sebai",email: "",password: "",accessToken: "",phone: ""),
  ];

  int sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [const Color(0xFF543CBA),const Color(0xFF3FA5B1)],
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height:5),
                Text(
                  "You have invited 0 new users.Your team of associates (Circle) has 1 members",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xDAFFFFFF),
                  ),
                ),
                SizedBox(height:20),
                Text(
                  "Invite people to join CryptoSpace to add them to your team of associates (Circle) or send a notification to inactive members",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xDAFFFFFF),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                    height: MediaQuery.of(context).size.height/16.0,
                    color: const Color.fromRGBO(65, 45, 135, 0.7),
                    child: Text('Inviter des membres',
                        style: TextStyle( fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFffffff),
                          fontSize: 19,)
                    ),
                    onPressed: () {

                    },
                  )
                ),
                DataTable(
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: getColumns(['Nom et Prenom', 'Flag']),
                  rows: getRows(users),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }



  List<DataColumn> getColumns(List<String> columns){
    return columns.map((String column) => DataColumn(
      label: Text(
        column,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: Color(0xFFFFFFFF),
        ),
      ),
      onSort: onSort,)).toList();
  }

  List<DataRow> getRows(List<User> users){
    return users.map((User user) {
      final cells = [user.firstName +" "+user.lastName, "Invited you"];
      return DataRow(cells: getCells(cells));
    }).toList();
  }

  List<DataCell> getCells(List<dynamic> cells) {
    return cells.map((data) =>
        DataCell(
          Text(
            '$data',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xDCFFFFFF),
            ),
          )
        )
    ).toList();
  }


  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) => compareString(ascending, user1.firstName, user2.firstName));
    } else if (columnIndex == 1) {
      users.sort((user1, user2) => compareString(ascending, user1.lastName, user2.lastName));
    }
    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2){
    ascending ? value1.compareTo(value2) : value2.compareTo(value1);
  }




}










AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color(0xFF543CBA),
    elevation: 0,
    leading: IconButton(
      icon: Image.asset('assets/images/back.png'),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text("Affiliate Circle"),
  );
}




