import 'package:flutter/material.dart';
import 'package:flutter_universe/5.Rewards/components/BodyRewards.dart';

class Rewards extends StatelessWidget {
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
            body: BodyRewards(),
          )
        )
    );
  }

}
