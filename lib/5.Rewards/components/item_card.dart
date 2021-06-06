import 'package:flutter/material.dart';
import 'package:flutter_universe/Models/Product.dart';

import 'package:flutter_universe/staticdata/constants.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xB4414C6B),
                  width: 1,
                ),
                color: Color(int.parse(product.hexColor)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: product.id,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(baseUploadsURL+"/uploads/"+product.image),
                        )
                    )
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight:
              FontWeight.bold,
              color: kTextColor,

            ),

          )
        ],
      ),
    );
  }
}
