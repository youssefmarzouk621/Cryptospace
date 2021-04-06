import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_universe/0. Login/PhraseOrder.dart';
import 'package:flutter/services.dart';

class PhraseAuth extends StatefulWidget {
  @override
  _PhraseAuthState createState() => _PhraseAuthState();
}

class _PhraseAuthState extends State<PhraseAuth> {
  @override
  Widget build(BuildContext context) {
    String phrase="";
    String currentword="";

    String _incrementCounter() {
      setState(() {

        currentword = generateWordPairs().take(1).first.asString;
        while (currentword.length > 11) {
          currentword = generateWordPairs().take(1).first.asString;
        }
        print(currentword);
        phrase= phrase+currentword+"/";
        print(phrase);
      });
      return currentword;
    };
    return  Container(
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
          'Write down or copy these words in the \n right order and save them somewhere safe.',
          textAlign: TextAlign.center,
          style:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100,color:const Color(0xFFffffff)),
        ),
      ),
           SizedBox(height: MediaQuery.of(context).size.height/25.4),
           Expanded(
             child: GridView(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 10,mainAxisSpacing: 10,childAspectRatio: 6.0),
                children: [
                for (var q = 1; q<=12; q++)

     Material(
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
               color: Colors.black,
             ),

             children: <TextSpan>[
               new TextSpan(text: q.toString()+" ",style:
               TextStyle(fontSize: 14.0, fontWeight: FontWeight.w200,color:const Color(0xFFf9d505))),

               new TextSpan(text: _incrementCounter(), style:
               TextStyle(fontSize: 14.0, fontWeight: FontWeight.w200,color:const Color(0xFFffffff))),
             ],
           ),
         ),


     ),],),),
      Container(
        width: 100,
     child: OutlineButton(
          disabledBorderColor: const Color(0xffffffff),
          highlightedBorderColor: const Color(0xffffffff),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () => {Clipboard.setData(new ClipboardData(text: phrase))},

          child: Row( // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Icon(Icons.copy,color: const Color(0xffffffff),),
              SizedBox(
                width: 10,
              ),
              Text("Copy",style: TextStyle(color: const Color(0xffffffff),))
            ],
          ),
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
            Icon(Icons.warning_amber_rounded,color: const Color(0xfff9d505),size: 30,),
       // Align however you like (i.e .centerRight, centerLeft)
        Center(
            child:
            Text("Never share recovery phrase with anyone,\n store it securely !",textAlign: TextAlign.center,
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
          child: Text('Continue',
              style: TextStyle( fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: const Color(0xFFffffff),
                fontSize: 19,)
          ),
          onPressed: () {
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
                pageBuilder: (context, a, b) => PhraseOrder(allphrase: phrase),

              ),
            );
          },
        ),
      ),
      SizedBox(height: MediaQuery.of(context).size.height/39.4),


    ] ),),

    );
  }
}