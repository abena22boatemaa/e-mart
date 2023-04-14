import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/utils/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/product.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');
  final CollectionReference orderCollection = FirebaseFirestore.instance.collection('orders');

  Future updateUserDData(String name, String email, String phoneNumber, String address) async {
    return await userCollection.doc(uid).set({
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "address": address,
      "userType": "customer",
      "dateSignedUp": DateTime.now()
    });
  }

  Future recentProducts(Product product) async {
    return await userCollection.doc(uid).update({
      "recentProducts": FieldValue.arrayUnion([product.toJson()])
    });
  }

  Future updateUserPhoto(String photoUrl) async {
    return await userCollection.doc(uid).update({"photoUrl": photoUrl});
  }

  Future trackOrders(int numberofOrders) async {
    return await userCollection.doc(uid).update({"numberOfOrders": numberofOrders});
  }

  Future saveOrder(
    Order order,
  ) async {
    await DatabaseService(uid: GlobalData.userUid)
        .trackOrders(GlobalData.noOfOrders == null ? 1 : GlobalData.noOfOrders + 1);
    return await orderCollection.doc("${order.id}-${GlobalData.noOfOrders ?? 1}").set({
      "id": order.id,
      "deliveryAddress": order.deliveryAddress,
      "deliveryName": order.deliveryName,
      "deliveryTime": order.deliveryTime,
      "deliveryPhoneNumber": order.deliveryPhoneNumber,
      "amount": order.amount,
      "date": order.date,
      "deliveryFee": order.deliveryFee,
      "status": order.status,
      "orderNo": order.orderNo,
      "products": order.products
    });
  }
}
