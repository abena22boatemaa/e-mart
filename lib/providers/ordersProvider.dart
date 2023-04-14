import 'package:flutter/foundation.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/services/database.dart';
import 'package:flutter_app/utils/global.dart';

class Orders with ChangeNotifier {
  static List<Order> madeOrders = [];
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  Future<void> addOrder(List<String> cartProducts, num deliveryFee, String deliveryName, String deliveryAddress,
      String deliveryPhoneNumber, String deliveryTime, double total) async {
    final timeStamp = DateTime.now();
    try {
      _orders.insert(
          0,
          Order(
              id: '${GlobalData.userData.email}',
              deliveryAddress: deliveryAddress,
              deliveryName: deliveryName,
              deliveryTime: deliveryTime,
              deliveryPhoneNumber: deliveryPhoneNumber,
              amount: total,
              date: timeStamp,
              deliveryFee: deliveryFee,
              status: 'awaitingPayment',
              orderNo: GlobalData.noOfOrders ?? 1,
              products: cartProducts));
      await DatabaseService(uid: "${GlobalData.userData.email}-${GlobalData.noOfOrders ?? 1}").saveOrder(_orders[0]);
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
