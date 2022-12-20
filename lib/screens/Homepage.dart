import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shopping/models/Products.dart';
import 'package:shopping/provider/ProductProvider.dart';
import 'package:shopping/provider/cart.dart';
import 'package:shopping/widget/Body.dart';
import '../models/constants.dart';
import 'profileScreen.dart';
import 'cartScreen.dart';
import '../models/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Products>(context, listen: false);
    // final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark),
        elevation: 0,
        title: Row(
          children: [
            Container(child: Icon(Icons.location_pin)),
            // SizedBox(
            //   width: 5,
            // ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "Current location",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17.5,
                      decoration: TextDecoration.underline),
                ))
          ],
        ),
        // title: const Text("Shopping"),
        // elevation: 0,
        // backgroundColor: Colors.transparent,
        backgroundColor: Colors.blue,
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            child: const Icon(Icons.notifications
                // color: Color.fromARGB(171, 18, 1, 1),
                ),
          ),
          SizedBox(
            width: kDefaulPadding / 2,
          ),
          Container(
            padding: EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                // cart.addCart(
                //     product.id, product.price, product.image, product.title);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
                // Navigator.pushNamed(context, "cartScreen");
              },
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const Body(),
    );
  }
}
