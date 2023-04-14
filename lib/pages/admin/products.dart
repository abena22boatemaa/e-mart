import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Elements/alert.dart';
import 'package:flutter_app/pages/admin/addProduct.dart';
import 'package:flutter_app/pages/admin/adminProducts.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct(edit: false)));
              },
              child: Text(
                'Add New',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("products").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return Center(child: Text('${snapshot.error.toString()}'));
            if (!snapshot.hasData) return Center(child: Text('Loading ...'));
            var output = snapshot.data.docs.map((doc) => doc.data()).toList();
            List<String> documentID = snapshot.data.docs.map((doc) => doc.id).toList();

            AdminProducts.adminProductList = (output as List).map((item) => AdminProduct.fromMap(item)).toList();
            for (var i = 0; i < AdminProducts.adminProductList.length; i++) {
              AdminProducts.adminProductList[i].productId = documentID[i].toString();
            }
            AdminProducts.adminProductList.sort((a, b) {
              return a.name.toLowerCase().compareTo(b.name.toLowerCase());
            });
            return ListView.separated(
                padding: EdgeInsets.symmetric(vertical: 20),
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: Image.network(
                        AdminProducts.adminProductList[index].picture,
                        width: 50,
                        height: 50,
                      ),
                      title: Text('${AdminProducts.adminProductList[index].name}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price : GHS ${AdminProducts.adminProductList[index].price}"),
                          Text("Category : ${AdminProducts.adminProductList[index].category}"),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddProduct(
                                              edit: true,
                                              product: AdminProducts.adminProductList[index],
                                            )));
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                alertTwo(
                                    context,
                                    "Delete Product?",
                                    deleteProduct(AdminProducts.adminProductList[index].productId,
                                        AdminProducts.adminProductList[index].picture));
                              },
                              icon: Icon(Icons.delete))
                        ],
                      ));
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: AdminProducts.adminProductList.length);
          }),
    );
  }
}

Future deleteProduct(String productId, String productImage) async {
  await FirebaseFirestore.instance.collection('orders').doc(productId).delete();
  await FirebaseStorage.instance.refFromURL(productImage).delete();
}
