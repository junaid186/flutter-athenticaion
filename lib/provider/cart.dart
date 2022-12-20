import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  double price;
  String image;
  String title;
  double qunatity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.qunatity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _item = {};

  Map<String, CartItem> get item {
    return {..._item};
  }

  void addCart(String productId, double price, String image, String title) {
    if (_item.containsKey(productId)) {
    } else {
      _item.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                image: image,
                qunatity: 1,
              ));
    }
  }
}
