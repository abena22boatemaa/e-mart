import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
    {
      "name": "Apple",
      "picture": "images/recent products/apple.jpg",
      "price": 2.0,
    },
    {
      "name": "Pineapple",
      "picture": "images/recent products/pineapple.png",
      "price": 6.0,
    },
    {
      "name": "Beetroot",
      "picture": "images/recent products/beetroot.jpg",
      "price": 3.5,
    },
    {
      "name": "Strawberry",
      "picture": "images/recent products/images.jpg",
      "price": 4.0,
    },
    {
      "name": "Pawpaw",
      "picture": "images/recent products/pawpaw.jpg",
      "price": 2.0,
    },
    {
      "name": "Mango",
      "picture": "images/recent products/mango.jpg",
      "price": 3.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: orientation == Orientation.portrait ? 0.8 : 0.9),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(0.0),
            child: Single_prod(
              product: product_list[index],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final product;

  Single_prod({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              // passing the values of the product to product details page
              builder: (context) => new ProductDetails(
                    product: product,
                  ))),
          child: Container(
            color:Colors.white,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset(
                      product['picture'],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Colors.white,
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text(
                          product['name'],
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                      new Text(
                        "GHS ${product['price']}",
                        style: TextStyle(color: Colors.red, fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
