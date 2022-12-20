import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/ProductProvider.dart';
import 'package:shopping/provider/cart.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<ProductProvider>(context, listen: false)
        .findById(productId);
    var cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                  height: 500,
                  width: double.infinity,
                  child: Image.asset(loadedProduct.image))
            ]),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cart.addCart(loadedProduct.id, loadedProduct.price,
                loadedProduct.image, loadedProduct.title);
            print("The title of cart is: ");
            print(cart.item["title"]);
          });
        },
        backgroundColor: Colors.blue,
        child: Text(
          "Buy",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
