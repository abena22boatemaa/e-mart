import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class Cart_product extends StatefulWidget {
  @override
  _Cart_productState createState() => _Cart_productState();
}

class _Cart_productState extends State<Cart_product> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return new ListView.builder(
        shrinkWrap: true,
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: cart.items.values.toList()[index].product.name,
            cart_prod_picture: cart.items.values.toList()[index].product.picture,
            cart_prod_price: cart.items.values.toList()[index].price,
            cart_prod_qty: cart.items.values.toList()[index].quantity,
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            //********LEADING SECTION
            leading: new Image.network(
              cart_prod_picture,
              width: 100.0,
              height: 100.0,
            ),
            //******TITLE SECTION
            title: new Text(cart_prod_name),
            //*****SUBTITLE SECTION
            subtitle: Text('${cart_prod_qty.toString()}'),

            //*******PRODUCT PRICE
            trailing: Container(
              child: new Text(
                "GHS ${cart_prod_price.toString()}",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                cart.removeItem(cart_prod_name);
              },
              child: Text(
                "Remove",
                style: TextStyle(color: Colors.red),
              ))
        ],
      ),
    );
  }
}
