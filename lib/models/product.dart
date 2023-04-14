import 'dart:convert';

class Product {
  String name;
  num price;
  String picture;
  String category;
  num costPrice;
  int quantity;
  Product({this.name, this.price, this.picture, this.category, image, this.quantity, this.costPrice});

  Product copyWith({
    String name,
    int price,
    String picture,
    String category,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
      picture: picture ?? this.picture,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'picture': picture,
      'category': category,
      'costPrice': costPrice,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      price: map['price'],
      picture: map['picture'],
      category: map['category'],
      costPrice: map['costPrice'],
    );
  }
  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(name:$name, costPrice:$costPrice, price: $price,'
        'picture:$picture, category:$category)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product &&
        other.name == name &&
        other.price == price &&
        other.picture == picture &&
        other.category == category;
  }

  @override
  int get hashCode {
    return name.hashCode ^ price.hashCode ^ picture.hashCode ^ category.hashCode;
  }
}
