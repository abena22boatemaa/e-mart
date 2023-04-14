import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/admin/adminProducts.dart';

class Inventory extends StatefulWidget {
  Inventory({Key key}) : super(key: key);

  @override
  _InventoryState createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  var collection = FirebaseFirestore.instance.collection('products');
  List<AdminProduct> waningInventory = [];
  getProductsLessThan3() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await collection.where('quantity', isLessThanOrEqualTo: 3).get();
    List<QueryDocumentSnapshot> docs = snapshot.docs;
    var output = docs.map((e) => e.data()).toList();
    waningInventory = (output as List).map((e) => AdminProduct.fromMap(e)).toList();
    print(waningInventory);
    return waningInventory;
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
            future: getProductsLessThan3(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("You are running out of the following products",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                waningInventory[index].picture,
                                width: 50,
                                height: 50,
                              ),
                              title: Text('${waningInventory[index].name}', style: TextStyle(color: Colors.white)),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Price : GHS ${waningInventory[index].price}",
                                      style: TextStyle(color: Colors.white)),
                                  Text("Category : ${waningInventory[index].category}",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: waningInventory.length),
                    ],
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
