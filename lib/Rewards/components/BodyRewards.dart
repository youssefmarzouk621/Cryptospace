import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_universe/Controllers/ProductsController.dart';
import 'package:flutter_universe/Models/Product.dart';
import 'package:flutter_universe/Rewards/details/detailsReward.dart';
import 'package:flutter_universe/staticdata/constants.dart';
import 'item_card.dart';

class BodyRewards extends StatefulWidget {
  @override
  _BodyRewardsState createState() => _BodyRewardsState();
}

class _BodyRewardsState extends State<BodyRewards> {
  final ProductsController productsController = ProductsController();
  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses", "Dresses", "Dresses", "Dresses"];
  int selectedIndex = 0;

  /*List<Product> products = [
    Product(
        id: "1",
        title: "Office Code",
        price: 234,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        image: "assets/images/bag_1.png",
        hexColor: 0xFF3D82AE,
    ),
    Product(
        id: "2",
        title: "Belt Bag",
        price: 234,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        image: "assets/images/bag_2.png",
        hexColor: 0xFFD3A984,
    ),
    Product(
        id: "3",
        title: "Hang Top",
        price: 234,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        image: "assets/images/bag_3.png",
        hexColor: 0xFF989493
    ),
    Product(
        id: "4",
        title: "Old Fashion",
        price: 234,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        image: "assets/images/bag_4.png",
        hexColor: 0xFFE6B398
    ),
    Product(
        id: "5",
        title: "Office Code",
        price: 234,
        description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        image: "assets/images/bag_5.png",
        hexColor: 0xFFFB7883
    ),
    Product(
      id: "6",
      title: "Office Code",
      price: 234,
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
      image: "assets/images/bag_6.png",
      hexColor: 0xFFAEAEAE,
    ),
  ];*/

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                  child: Text(
                    "Rewards",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
                  child: SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) =>

                          //categories
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    categories[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: selectedIndex == index ? kTextColor : kTextLightColor,
                                        fontSize: 18
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: kDefaultPaddin / 4), //top padding 5
                                    height: 2,
                                    width: 30,
                                    color: selectedIndex == index ? kTextColor : Colors.transparent,
                                  )
                                ],
                              ),
                            ),
                          ),



                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: FutureBuilder(
                      future: productsController.getProducts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {

                        if(snapshot.data == null){
                          return Container(
                              child: Center(
                                  child: SpinKitDoubleBounce(
                                    color: Colors.white,
                                    size: 50.0,
                                  )
                              )
                          );
                        }else{
                            return GridView.builder(
                                itemCount: snapshot.data.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: kDefaultPaddin,
                                  crossAxisSpacing: kDefaultPaddin,
                                  childAspectRatio: 0.75,
                                ),
                                itemBuilder: (context, index) => ItemCard(
                                  product: snapshot.data[index],
                                  press: () =>
                                      productsController.getProduct(snapshot.data[index].id).then((value) =>
                                      {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailsReward(
                                                product: value,
                                              ),
                                            )
                                        ),
                                      })
                                )
                            );
                      }
                      },
                    ),
                  ),
                ),
              ],
            )
        )
    );
  }
}
