import 'package:flutter/material.dart';
import 'package:flutter_app/pages/cart.dart';
import 'package:flutter_app/pages/dashboard.dart';
import 'package:flutter_app/Elements/fruitscat.dart';
import 'package:flutter_app/Elements/veggiescat.dart';
import 'package:flutter_app/Elements/exoticcat.dart';
import 'package:flutter_app/providers/productProvider.dart';

class CategoryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff5663ff),
            title: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Dashboard()));
                },
                child: Text('Home')),
            actions: <Widget>[
              new IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
              new IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new CartPage()));
                  })
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "FRUITS",
                ),
                Tab(
                  text: "VEGETABLES",
                ),
                Tab(
                  text: "EXOTIC",
                ),
                Tab(
                  text: "GROCERIES",
                ),
                Tab(
                  text: "OTHERS",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Fruits(
                productList: Products.productList.where((element) => element.category == 'fruits').toList(),
              ),
              Veggies(
                productList: Products.productList.where((element) => element.category == 'vegetables').toList(),
              ),
              Exotic(
                productList: Products.productList.where((element) => element.category == 'exotic').toList(),
              ),
              Fruits(
                productList: Products.productList.where((element) => element.category == 'groceries').toList(),
              ),
              Fruits(
                productList: Products.productList.where((element) => element.category == 'others').toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
