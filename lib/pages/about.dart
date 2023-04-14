import 'package:flutter/material.dart';
import 'package:flutter_app/pages/dashboard.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context).pushReplacement(MaterialPageRoute(builder:
            (ctx) => Dashboard()));
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xff5663ff),
          title: Text('About'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 17, vertical: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("images/about.jpg"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: 360,
                child: Wrap(
                  children: [
                    Text(
                      "E-Market is an e-commerce mobile application with easy and"
                "interactive user interface that focuses on providing organic products"
                "to it's users. Vendors upload their products to sell and interested"
                          " buyers"
                      "purchasing from them. it is safe and convenient to use.",
                      style: TextStyle(fontSize: 21, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Divider(),
        new ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
            child: new Text(
              "Contact Us",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        ),
              new Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 0.0, 5.0, 5.0),
                  child: new Text(
                    "Telephone",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text("0501659382/0501659382"),
                )
              ]),

              new Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(4.0, 5.0, 5.0, 5.0),
                  child: new Text(
                    "email",
                    style: TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                //remember to create brand
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: new Text("mag@gmail.com"),
                )
              ]),
      ],
    ),
    ),
      ),
    );
  }
}
