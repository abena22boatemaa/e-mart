import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/pages/admin/adminOrder.dart';
import 'package:flutter_app/pages/orders/details.dart';

class AdminOrders extends StatefulWidget {
  AdminOrders({Key key}) : super(key: key);

  @override
  _AdminOrdersState createState() => _AdminOrdersState();
}

class _AdminOrdersState extends State<AdminOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("orders").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Center(child: Text('${snapshot.error.toString()}'));
            if (!snapshot.hasData) return Center(child: Text('Loading ...'));

            var output = snapshot.data.docs.map((doc) => doc.data()).toList();
            AdminOrder.adminOrderList = (output as List).map((e) => Order.fromMap(e)).toList();

            return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      order: AdminOrder.adminOrderList[index],
                                      admin: true,
                                    )));
                      },
                      title: Text('${AdminOrder.adminOrderList[index].id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Status : ${AdminOrder.adminOrderList[index].status}"),
                          Text("Amount : GHS ${AdminOrder.adminOrderList[index].amount}"),
                          Text("Date : ${AdminOrder.adminOrderList[index].date}"),
                        ],
                      ),
                      trailing: Icon(Icons.keyboard_arrow_right));
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: AdminOrder.adminOrderList.length);
          }),
    );
  }
}
