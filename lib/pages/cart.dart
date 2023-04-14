import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/cart_product.dart';
import 'package:flutter_app/providers/cartProvider.dart';
import 'package:provider/provider.dart';

import 'orderForm.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff5663ff),
        title: Text('Shopping cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new Cart_product(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: new Text("Total"),
              subtitle: new Text(
                "GHS ${cart.totalAmount}",
                style: TextStyle(color: Colors.red),
              ),
            )),
            Expanded(
              child: new MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersPage()));
                },
                child: new Text(
                  "Check out",
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff5663ff),
              ),
            )
          ],
        ),
      ),
    );
  }
}
