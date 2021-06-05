import 'package:flutter/material.dart';
import 'package:flutter_universe/Models/Product.dart';
import 'package:flutter_universe/staticdata/constants.dart';
import 'package:flutter_universe/Rewards/details/components/bodyDetails.dart';

class DetailsReward extends StatelessWidget {
  final Product product;

  const DetailsReward({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Color(int.parse(product.hexColor)),
      appBar: buildAppBar(context),
      body: BodyDetails(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(int.parse(product.hexColor)),
      elevation: 0,
      leading: IconButton(
        icon: Image.asset('assets/images/bag_1.png'),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[

      ],
    );
  }
}
