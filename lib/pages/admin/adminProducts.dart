import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_app/models/product.dart';

class AdminProduct {
  String name;
  num price;
  String picture;
  String category;
  String productId;
  num costPrice;
  AdminProduct(
      {@required this.name,
      @required this.price,
      @required this.picture,
      @required this.category,
      @required this.productId,
      this.costPrice});

  AdminProduct copyWith({
    String name,
    num price,
    String picture,
    String category,
    String productId,
  }) {
    return AdminProduct(
      name: name ?? this.name,
      price: price ?? this.price,
      picture: picture ?? this.picture,
      category: category ?? this.category,
      productId: productId ?? this.productId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'picture': picture,
      'category': category,
      'productId': productId,
    };
  }

  factory AdminProduct.fromMap(Map<String, dynamic> map) {
    return AdminProduct(
        name: map['name'],
        price: map['price'],
        picture: map['picture'],
        category: map['category'],
        productId: map['productId'],
        costPrice: map['costPrice']);
  }

  String toJson() => json.encode(toMap());

  factory AdminProduct.fromJson(String source) => AdminProduct.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminProduct(name: $name, price: $price, picture: $picture, category: $category, productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdminProduct &&
        other.name == name &&
        other.price == price &&
        other.picture == picture &&
        other.category == category &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    return name.hashCode ^ price.hashCode ^ picture.hashCode ^ category.hashCode ^ productId.hashCode;
  }
}

class AdminProducts with ChangeNotifier {
  static List<AdminProduct> adminProductList = [];
}
