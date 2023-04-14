import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/models/orderedProduct.dart';

class Profit {
  num costPrice;
  num salePrice;
  int profit;
  Profit({@required this.costPrice, @required this.salePrice, @required this.profit});
}

class ProfitMade extends StatefulWidget {
  final DateTimeRange dateTimeRange;

  ProfitMade({Key key, @required this.dateTimeRange}) : super(key: key);

  @override
  _ProfitMadeState createState() => _ProfitMadeState();
}

class _ProfitMadeState extends State<ProfitMade> {
  var collection = FirebaseFirestore.instance.collection('orders');
  Profit profitDetails;
  List<Order> orders = [];
  getProfitfromFirebase() async {
    num costPrice = 0;
    num salesPrice = 0;

    QuerySnapshot<Map<String, dynamic>> snapshot = await collection
        .where('date', isGreaterThanOrEqualTo: widget.dateTimeRange.start)
        .where("date", isLessThanOrEqualTo: widget.dateTimeRange.end)
        .get();
    List<QueryDocumentSnapshot> docs = snapshot.docs;
    var output = docs.map((e) => e.data()).toList();
    orders = (output as List).map((e) => Order.fromMap(e)).toList();

    for (var i = 0; i < orders.length; i++) {
      List<OrderedProduct> products = [];
      salesPrice = salesPrice + orders[i].amount - 10;

      for (var j = 0; j < orders[i].products.length; j++) {
        products.add(OrderedProduct.fromJson(orders[i].products[j]));
      }
      if (products.isNotEmpty)
        for (var x = 0; x < products.length; x++) {
          costPrice = costPrice + products[x].product.costPrice;
        }
    }
    profitDetails = Profit(costPrice: costPrice, salePrice: salesPrice, profit: (salesPrice - costPrice).toInt());
    return profitDetails;
  }

  @override
  void initState() {
    getProfitfromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: FutureBuilder(
            future: getProfitfromFirebase(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text("Sales", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ListTile(
                      title: Text('Total Sales : ', style: TextStyle(color: Colors.white)),
                      trailing: Text('${profitDetails.salePrice}', style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      title: Text(
                        'Total Cost : ',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text('${profitDetails.costPrice}', style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      title: Text('Total Orders : ', style: TextStyle(color: Colors.white)),
                      trailing: Text('${orders.length}', style: TextStyle(color: Colors.white)),
                    ),
                    ListTile(
                      title: Text('Profit : ', style: TextStyle(color: Colors.white)),
                      trailing: Text('${profitDetails.profit}', style: TextStyle(color: Colors.white)),
                    )
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
