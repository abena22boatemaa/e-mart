import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/admin/orders.dart';
import 'package:flutter_app/pages/admin/products.dart';
import 'package:flutter_app/pages/admin/users.dart';
import 'package:flutter_app/reports/reports.dart';

class AdminLanding extends StatefulWidget {
  AdminLanding({Key key}) : super(key: key);

  @override
  _AdminLandingState createState() => _AdminLandingState();
}

class _AdminLandingState extends State<AdminLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Admin"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage()));
                      },
                      child: AdminItem(
                          color: Color(0xffff8b00),
                          itemIcon: Icon(Icons.shopping_cart, color: Colors.white),
                          itemName: "Products"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminOrders()));
                      },
                      child: AdminItem(
                          color: Color(0xff8BD3E6),
                          itemIcon: Icon(Icons.shopping_basket, color: Colors.white),
                          itemName: "Orders"),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminUsers()));
                      },
                      child: AdminItem(
                          color: Color(0xffff69b4),
                          itemIcon: Icon(Icons.group, color: Colors.white),
                          itemName: "Users"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Reports()));
                      },
                      child: AdminItem(
                          color: Color(0xff000000),
                          itemIcon: Icon(Icons.file_copy, color: Colors.white),
                          itemName: "Reports"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("products").snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int productListCount = snapshot.data.docs.length;
                              return Text("Total Number of Products : $productListCount");
                            }
                            return Text('Loading ...');
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("users").snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int userListCount = snapshot.data.docs.length;
                              return Text("Total Number of Users : $userListCount");
                            }
                            return Text('Loading ...');
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("orders").snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              int orderListCount = snapshot.data.docs.length;
                              return Text("Total Number of Orders : $orderListCount");
                            }
                            return Text('Loading ...');
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class AdminItem extends StatelessWidget {
  const AdminItem({Key key, @required this.color, @required this.itemIcon, @required this.itemName}) : super(key: key);
  final Color color;
  final String itemName;
  final Icon itemIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: MediaQuery.of(context).size.height * 0.2,
      padding: EdgeInsets.only(top: 45, left: 30, right: 30, bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          itemIcon,
          Text(
            itemName,
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
