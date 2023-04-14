import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/product.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> fruit = [];
  Product fruitData;
  List<Product> vegetable = [];
  Product vegetableData;
  List<Product> exotic = [];
  Product exoticData;

  Future<void> getFruitData() async {
    List<Product> newList = [];
    QuerySnapshot<Map<String, dynamic>> shirtSnapShot = await FirebaseFirestore
        .instance
        .collection("category")
        .doc("CtorpiVgAqu4n5kyqkUf")
        .collection("fruits")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        fruitData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(fruitData);
      },
    );
    fruit = newList;
    notifyListeners();
  }

  List<Product> get getFruitList {
    return fruit;
  }

  Future<void> getVegetableData() async {
    List<Product> newList = [];
    QuerySnapshot<Map<String, dynamic>> shirtSnapShot = await FirebaseFirestore
        .instance
        .collection("category")
        .doc("CtorpiVgAqu4n5kyqkUf")
        .collection("vegetable")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        fruitData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(fruitData);
      },
    );
    vegetable = newList;
    notifyListeners();
  }

  List<Product> get getVegetableList {
    return vegetable;
  }

  Future<void> getExoticData() async {
    List<Product> newList = [];
    QuerySnapshot<Map<String, dynamic>> shirtSnapShot = await FirebaseFirestore
        .instance
        .collection("category")
        .doc("CtorpiVgAqu4n5kyqkUf")
        .collection("exotic")
        .get();
    shirtSnapShot.docs.forEach(
          (element) {
        fruitData = Product(
            image: element.data()["image"],
            name: element.data()["name"],
            price: element.data()["price"]);
        newList.add(fruitData);
      },
    );
    exotic = newList;
    notifyListeners();
  }

  List<Product> get getexoticList {
    return exotic;
  }

  List<Product> searchList;
  void getSearchList({List<Product> list}) {
    searchList = list;
  }

  List<Product> searchCategoryList(String query) {
    List<Product> searchShirt = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchShirt;
  }
}
