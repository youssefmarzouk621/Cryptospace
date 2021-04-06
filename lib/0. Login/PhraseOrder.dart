import 'package:flutter/material.dart';
import 'package:drag_and_drop_gridview/devdrag.dart';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_universe/index.dart';

class PhraseOrder extends StatefulWidget {
  final String allphrase;
  const PhraseOrder({Key key, this.allphrase}) : super(key: key);
  @override
  _PhraseOrderState createState() => _PhraseOrderState();
}

class _PhraseOrderState extends State<PhraseOrder> {

  Function eq = const ListEquality().equals;

  List<String> _imageUris = [];

  int variableSet = 0;
  ScrollController _scrollController;
  double width;
  double height;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    List shuffle(List items) {
      var random = new Random();

      // Go through all elements.
      for (var i = items.length - 1; i > 0; i--) {

        // Pick a pseudorandom number according to the list length
        var n = random.nextInt(i + 1);

        var temp = items[i];
        items[i] = items[n];
        items[n] = temp;
      }

      return items;
    };

    final tagName = widget.allphrase;
    final split = tagName.split('/');
    final Map<int, String> values = {
      for (int i = 0; i < split.length-1; i++)
        i: split[i]
    };
    print(values);

    for(var v in values.values) {
      _imageUris.add(v);
      //below is the solution
        }

    shuffle(_imageUris);

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
        //resizeToAvoidBottomPadding: false,
        body:
        Column(
            children:[

              SizedBox(height: MediaQuery.of(context).size.height/15.4),
              Align(
                alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                child:  Text(
                  'Your recovery phrase.',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color:const Color(0xFFffffff)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/45.4),
              Align(
                alignment: Alignment.center, // Align however you like (i.e .centerRight, centerLeft)
                child:  Text(
                  'Reorder the words of your recovery \n phrase to sign in.',
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),
                ),
              ),



              SizedBox(height: MediaQuery.of(context).size.height/25.4),
              Center(
                child: DragAndDropGridView(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 10/2.9,

                  ),
                  padding: EdgeInsets.all(20),
                  itemBuilder: (context, index) => Card(

                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: LayoutBuilder(
                      builder: (context, costrains) {
                        if (variableSet == 0) {
                          height = costrains.maxHeight;
                          width = costrains.maxWidth;
                          variableSet++;
                        }
                        return  Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color:Color.fromRGBO(65, 45, 135, 0.3),
                            child:
                            RichText(
                              textAlign: TextAlign.center,
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),

                                children: <TextSpan>[

                                  new TextSpan(text: (index+1).toString()+" ",style:
                                  TextStyle(fontSize: 14.0, fontWeight: FontWeight.w200,color:const Color(0xFFf9d505))),

                                  new TextSpan(text: _imageUris[index], style:
                                  TextStyle(fontSize: 14.0, fontWeight: FontWeight.w200,color:const Color(0xFFffffff))),
                                ],
                              ),
                            ),


                          );

                      },
                    ),
                  ),
                  itemCount: _imageUris.length,
                  onWillAccept: (oldIndex, newIndex) {
                    // Implement you own logic

                    return true; // If you want to accept the child return true or else return false
                  },
                  onReorder: (oldIndex, newIndex) {
                    final temp = _imageUris[oldIndex];
                    _imageUris[oldIndex] = _imageUris[newIndex];
                    _imageUris[newIndex] = temp;

                   // setState(() {});
                  },
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height/15.4),

              Container(
                height: 100,
                width: MediaQuery.of(context).size.width/1.1,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(65, 45, 135, 0.3),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.help_outline,color: const Color(0xfff9d505),size: 30,),
                    // Align however you like (i.e .centerRight, centerLeft)
                    Center(
                      child:
                      Text("Hold the word then drag \n and drop it in the correct spot.",textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/29.4),



              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FlatButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  height: MediaQuery.of(context).size.height/11.0,

                  // splashColor: Colors.red,
                  color: const Color.fromRGBO(65, 45, 135, 0.3),
                  // textColor: Colors.white,
                  child: Text('Sign In',
                      style: TextStyle( fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFFffffff),
                        fontSize: 19,)
                  ),
                  onPressed: () {
                    final tagName = widget.allphrase;
                    final split = tagName.split('/');
                    final Map<int, String> before = {
                      for (int i = 0; i < split.length-1; i++)
                        i: split[i]
                    };

                    List<String> newer =[];
                    for(var v in before.values) {
                      newer.add(v);
                    }

                    print(newer);
                    print(_imageUris);

                   if (eq(_imageUris, newer)  == true)
                     {
                       Navigator.push(
                         context,
                         PageRouteBuilder(
                           transitionDuration: Duration(seconds: 1),
                           transitionsBuilder: (context, animation, animationTime, child) {
                             animation = CurvedAnimation(
                                 parent: animation, curve: Curves.decelerate);
                             return FadeTransition(
                               opacity: animation,
                               child: child,
                             );
                           },
                           pageBuilder: (context, a, b) => IndexPage(),

                         ),
                       );
                     }
                   else
                     {

                       EasyLoading.init();
                     EasyLoading.showError('Incorrect Order');

                     }


                  },
                ),
              ),


              SizedBox(height: MediaQuery.of(context).size.height/39.4),


            ] ),),

    );
  }
}