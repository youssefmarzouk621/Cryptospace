import 'package:flutter/material.dart';
import 'package:flutter_universe/Models/Product.dart';
import 'package:flutter_universe/staticdata/constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);


  final Product product;



  @override
  Widget build(BuildContext context) {
    print('inside build');
    print(baseUploadsURL+"/uploads/"+product.image);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: product.price.toString()+" DT",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: primaryTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: product.image,
                  child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: NetworkImage(baseUploadsURL+"/uploads/"+product.image),
                          )
                      )
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
