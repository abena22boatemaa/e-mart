import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  String name;
  String email;
  String phoneNumber;
  String profileImage;
  String address;
  int noOfOrders;
  String userType;
  DateTime dateSignedUp;
  UserModel(
      {@required this.name,
      @required this.email,
      @required this.phoneNumber,
      @required this.profileImage,
      @required this.address,
      @required this.noOfOrders,
      @required this.userType,
      this.dateSignedUp});

  UserModel copyWith({
    String name,
    String email,
    String phoneNumber,
    String profileImage,
    String address,
    int noOfOrders,
    String userType,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
      noOfOrders: noOfOrders ?? this.noOfOrders,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'address': address,
      'noOfOrders': noOfOrders,
      'userType': userType,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'],
        email: map['email'],
        phoneNumber: map['phoneNumber'],
        profileImage: map['profileImage'],
        address: map['address'],
        noOfOrders: map['numberOfOrders'],
        userType: map['userType'],
        dateSignedUp: map['dateSignedUp'].toDate());
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, phoneNumber: $phoneNumber, profileImage: $profileImage, address: $address, noOfOrders: $noOfOrders, userType: $userType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.profileImage == profileImage &&
        other.address == address &&
        other.noOfOrders == noOfOrders &&
        other.userType == userType;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        profileImage.hashCode ^
        address.hashCode ^
        noOfOrders.hashCode ^
        userType.hashCode;
  }
}
