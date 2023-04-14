import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/usermodel.dart';
import 'package:flutter_app/pages/categories_details.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/pages/orders/ordersPage.dart';
import 'package:flutter_app/providers/productProvider.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter_app/utils/global.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _page = 0;
  List<Widget> _mainPages() => [HomePage(), CategoryDetails(), OrdersHome()];
  void onPageSelected(int index) {
    setState(() {
      _page = index;
    });
  }

  String userUid;
  UserModel user;

  void getUserUid() {
    User myUser = FirebaseAuth.instance.currentUser;
    userUid = myUser.uid;
    GlobalData.userUid = userUid;
  }

  @override
  void initState() {
    getUserUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> mainPages = _mainPages();
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(userUid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var output = snapshot.data.data();
            print(output);
            user = UserModel.fromMap(output);
            if (user.userType == "admin") {
              GlobalData.admin = true;
            }
            GlobalData.userData = user;

            GlobalData.noOfOrders = user.noOfOrders;
            return Scaffold(
              body: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData)
                      return Center(child: Text('Something went wrong'));
                    var output =
                        snapshot.data.docs.map((doc) => doc.data()).toList();
                    Products.productList =
                        (output).map((item) => Product.fromMap(item)).toList();
                    print(Products.productList);
                    return mainPages[_page];
                  }),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _page,
                  onTap: onPageSelected,
                  selectedItemColor: Color(0xff5663ff),
                  selectedLabelStyle: TextStyle(
                      color: Color(0xff5663ff),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  unselectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.dashboard,
                      ),
                      label: 'Category',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_basket,
                      ),
                      label: 'My Orders',
                    )
                  ]),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
