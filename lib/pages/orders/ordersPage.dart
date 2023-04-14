import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/pages/orders/ordersTab.dart';
import 'package:flutter_app/utils/global.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class OrdersHome extends StatefulWidget {
  OrdersHome({Key key}) : super(key: key);

  @override
  _OrdersHomeState createState() => _OrdersHomeState();
}

class _OrdersHomeState extends State<OrdersHome> {
  var collection = FirebaseFirestore.instance.collection('orders');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("My Orders"),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: collection.where("id", whereIn: ["${GlobalData.userData.email}"]).snapshots(),
              builder: (_, snapshot) {
                if (snapshot.hasError) return Text('Error = ${snapshot.error}');
                if (snapshot.hasData) {
                  var output = snapshot.data.docs.map((doc) => doc.data()).toList();
                  if (output != null) {
                    print(output);

                    List<Order> orders = (output as List).map((item) => Order.fromMap(item)).toList();
                    //print(orders);
                    return Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TabBar(
                              labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelColor: Theme.of(context).primaryColor,
                              indicator: MaterialIndicator(
                                  color: Theme.of(context).primaryColor,
                                  topLeftRadius: 10,
                                  topRightRadius: 10,
                                  height: 4,
                                  tabPosition: TabPosition.bottom),
                              tabs: [
                                Tab(
                                  text: 'All',
                                ),
                                Tab(
                                  text: 'Delivered',
                                ),
                                Tab(
                                  text: 'Pending',
                                )
                              ]),
                          Expanded(
                            child: TabBarView(children: [
                              OrderTab(orders: orders),
                              OrderTab(orders: orders.where((element) => element.status == 'complete').toList()),
                              OrderTab(orders: orders.where((element) => element.status != 'complete').toList())
                            ]),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
