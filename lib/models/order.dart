import 'dart:convert';

import 'package:flutter/foundation.dart';

class Order {
  List<String> products;
  String id;
  int orderNo;
  DateTime date;
  num deliveryFee;
  num amount;
  String status;
  String deliveryName;
  String deliveryAddress;
  String deliveryTime;
  String deliveryPhoneNumber;
  Order(
      {@required this.products,
      @required this.id,
      @required this.orderNo,
      @required this.date,
      @required this.deliveryFee,
      @required this.amount,
      @required this.status,
      @required this.deliveryName,
      @required this.deliveryAddress,
      @required this.deliveryTime,
      @required this.deliveryPhoneNumber});

  Order copyWith(
      {List<String> products,
      String id,
      int orderNo,
      DateTime date,
      num deliveryFee,
      num amount,
      String status,
      String deliveryName,
      String deliveryAddress,
      String deliveryTime,
      String deliveryPhoneNumber}) {
    return Order(
      products: products ?? this.products,
      id: id ?? this.id,
      orderNo: orderNo ?? this.orderNo,
      date: date ?? this.date,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      deliveryName: deliveryName ?? this.deliveryName,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      deliveryPhoneNumber: deliveryPhoneNumber ?? this.deliveryPhoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'products': products,
      'id': id,
      'orderNo': orderNo,
      'date': date.millisecondsSinceEpoch,
      'deliveryFee': deliveryFee,
      'amount': amount,
      'status': status,
      'deliveryName': deliveryName,
      'deliveryAddress': deliveryAddress,
      'deliveryTime': deliveryTime,
      'deliveryPhoneNumber': deliveryPhoneNumber
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        products: List<String>.from(map['products']),
        id: map['id'],
        orderNo: map['orderNo'],
        date: map['date'].toDate(),
        deliveryFee: map['deliveryFee'],
        amount: map['amount'],
        status: map['status'],
        deliveryName: map['deliveryName'],
        deliveryAddress: map['deliveryAddress'],
        deliveryTime: map['deliveryTime'],
        deliveryPhoneNumber: map['deliveryPhoneNumber']);
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Order(products: $products, id: $id, orderNo: $orderNo, date: $date, deliveryFee: $deliveryFee, amount: $amount, status: $status, deliveryName: $deliveryName, deliveryAddress: $deliveryAddress, deliveryTime: $deliveryTime,deliveryPhoneNumber:$deliveryPhoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Order &&
        listEquals(other.products, products) &&
        other.id == id &&
        other.orderNo == orderNo &&
        other.date == date &&
        other.deliveryFee == deliveryFee &&
        other.amount == amount &&
        other.status == status &&
        other.deliveryName == deliveryName &&
        other.deliveryAddress == deliveryAddress &&
        other.deliveryTime == deliveryTime &&
        other.deliveryPhoneNumber == deliveryPhoneNumber;
  }

  @override
  int get hashCode {
    return products.hashCode ^
        id.hashCode ^
        orderNo.hashCode ^
        date.hashCode ^
        deliveryFee.hashCode ^
        amount.hashCode ^
        status.hashCode ^
        deliveryName.hashCode ^
        deliveryAddress.hashCode ^
        deliveryTime.hashCode ^
        deliveryPhoneNumber.hashCode;
  }
}
