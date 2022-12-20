import 'package:flutter/material.dart';
import '../models/Products.dart';

class ProductProvider with ChangeNotifier {
  List<Products> _items = [
    Products(
        id: "1",
        price: 599,
        title: "iphone",
        image: "assets/images/iphone.jpg",
        description: "dummy description"),
    Products(
        id: "2",
        price: 999,
        title: "macbook",
        image: "assets/images/macbook.jpg",
        description: "dummy description"),
    Products(
        id: "3",
        price: 299,
        title: "watch",
        image: "assets/images/appleWatch.jpg",
        description: "dummy description"),
    Products(
        id: "4",
        price: 799,
        title: "ipad",
        image: "assets/images/ipad.jpg",
        description: "dummy description"),
  ];

  List<Products> get items {
    return [..._items];
  }

  void addItems() {
    // _items.add(value);
    notifyListeners();
  }

  Products findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
