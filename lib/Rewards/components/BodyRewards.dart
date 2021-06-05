import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<String> categories = [];
  List<Product> products = [];
  List<Product> filteredProducts = [];
  int selectedIndex = 0;


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
                    child:


                    FutureBuilder(
                      future: productsController.getCategories(),
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
                          categories = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) =>

                            //categories
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  List<Product> localProducts=[];
                                  print("selected Category :"+categories[index]);
                                  if(categories[index]=="All"){
                                    filteredProducts = products;
                                    print("All clicked");
                                  }else{
                                    print("filtering products filteredProducts before filter");
                                    print(filteredProducts);
                                    for (var i = 0; i < filteredProducts.length; i++) {
                                      if(filteredProducts[i].categoryTitle==categories[index]){
                                        localProducts.add(filteredProducts[i]);
                                      }
                                    }

                                    print("filteredProducts after filter");
                                    filteredProducts = localProducts;
                                    print(filteredProducts);
                                  }

                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data[index],
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
                          );
                        }
                      },
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

                            products = snapshot.data;
                            filteredProducts = snapshot.data;
                            return GridView.builder(
                                itemCount: filteredProducts.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: kDefaultPaddin,
                                  crossAxisSpacing: kDefaultPaddin,
                                  childAspectRatio: 0.75,
                                ),
                                itemBuilder: (context, index) => ItemCard(
                                  product: filteredProducts[index],
                                  press: () =>
                                      productsController.getProduct(filteredProducts[index].id).then((value) =>
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
