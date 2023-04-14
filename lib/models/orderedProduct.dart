import 'dart:convert';

import 'package:flutter_app/models/product.dart';

class OrderedProduct {
  Product product;
  int quantity;
  num price;
  OrderedProduct({
    this.product,
    this.quantity,
    this.price,
  });

  OrderedProduct copyWith({
    Product product,
    int quantity,
    int price,
  }) {
    return OrderedProduct(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'product': product.toMap(),
      'quantity': quantity,
      'price': price,
    };
  }

  factory OrderedProduct.fromMap(Map<String, dynamic> map) {
    return OrderedProduct(
      product: Product.fromMap(map['product']),
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderedProduct.fromJson(String source) => OrderedProduct.fromMap(json.decode(source));

  @override
  String toString() => 'OrderedProduct(product: $product, quantity: $quantity, price: $price)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderedProduct && other.product == product && other.quantity == quantity && other.price == price;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode ^ price.hashCode;
}
