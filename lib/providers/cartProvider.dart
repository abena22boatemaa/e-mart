import 'package:flutter_app/models/orderedProduct.dart';
import 'package:flutter_app/models/product.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {
  Map<String, OrderedProduct> _items = {};

  Map<String, OrderedProduct> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(OrderedProduct product) {
    if (_items.containsKey(product.product.name)) {
      _items.update(
          product.product.name.toString(),
          (existingCartItem) => OrderedProduct(
              product: existingCartItem.product,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(product.product.name.toString(),
          () => OrderedProduct(product: product.product, quantity: product.quantity, price: product.price));
    }
    notifyListeners();
  }

  void removeItem(String productName) {
    _items.remove(productName);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => OrderedProduct(
              product: existingCartItem.product,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
