import 'package:flutter/cupertino.dart';

class Products with ChangeNotifier {
  String id;
  double price;
  String image;
  String title;
  String description;
  Products(
      {required this.id,
      required this.price,
      required this.title,
      required this.image,
      required this.description});
}
