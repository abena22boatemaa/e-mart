import 'package:flutter/material.dart';
import 'package:flutter_app/models/orderedProduct.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/providers/cartProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/pages/cart.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({
    this.product,
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xff5663ff),
        title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => new HomePage()));
            },
            child: Text('E-Market')),
        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(widget.product.picture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading:
                      new Text(widget.product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                  title: new Row(
                    children: <Widget>[
                      // Expanded(
                      //     child: new Text(
                      //   "\$${widget.product['old_price']}",
                      //   style: TextStyle(color: Colors.white70, decoration: TextDecoration.lineThrough),
                      // )),
                      Expanded(
                          child: new Text(
                        "GHS${widget.product.price}",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),

          //**** the first button
          Row(
            children: <Widget>[
              //*** the quantity button

              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: Colors.white,
                textColor: Colors.black,
                elevation: 0.2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Qty",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            quantity--;
                          });
                        }),
                    Text(
                      quantity.toString(),
                    ),
                    IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        }),
                  ],
                ),
              )
            ],
          ),

          //**** the second button
          Row(
            children: <Widget>[
              //*** the size button
              Expanded(
                child: MaterialButton(
                    onPressed: () {

                      OrderedProduct orderedProduct =
                          OrderedProduct(product: widget.product, quantity: quantity,
                              price: widget.product.price);
                      cart.addItem(orderedProduct);

                      Navigator.push(context, MaterialPageRoute(builder:
                          (context) => CartPage()));
                    },
                    color: Color(0xff5663ff),
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: new Text(
                      "Buy now",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                    )),
              ),

              new IconButton(icon: Icon(Icons.add_shopping_cart, color: Colors.red,),
                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:
                    (context) => CartPage()));
              }),
              new IconButton(icon: Icon(Icons.favorite_border), color:
              Colors.red, onPressed: () {}),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text(
              "Product details",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            subtitle: new Text(
              "This product contains the essential nutrients,"
              "minerals and fiber that helps to protect you and "
              "keep your immune system strong thus living a healthy life.",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15.0),
            ),
          ),
          Divider(),
          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "Product name",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: new Text(widget.product.name),
            )
          ]),

          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "product brand",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            //remember to create brand
            Padding(
              padding: EdgeInsets.all(5.0),
              child: new Text("brand x"),
            )
          ]),

          new Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
              child: new Text(
                "product condition",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: new Text("Fresh"),
            )
          ]),
        ],
      ),
    );
  }
}
