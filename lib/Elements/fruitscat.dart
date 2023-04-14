import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/singleProduct.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/product_details.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/utils/global.dart';

class Fruits extends StatefulWidget {
  final List<Product> productList;
  Fruits({@required this.productList});
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
        itemCount: widget.productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: GestureDetector(
              onTap: () async{
                await DatabaseService(uid:GlobalData.userUid).recentProducts(widget.productList[index]);
                Navigator.of(context).push(new MaterialPageRoute(
                    // passing the values of the product to product details page
                    builder: (context) => new ProductDetails(product: widget.productList[index])));
              },
              child: SingleProduct(
                prodName: widget.productList[index].name,
                prodPicture: widget.productList[index].picture,
              ),
            ),
          );
        });
  }
}


