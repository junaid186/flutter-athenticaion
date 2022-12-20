import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/provider/cart.dart';
import 'Homepage.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter = 1;
  void incrementCounter() {
    setState(() {
      if (_counter == 99) {
        return null;
      }
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (_counter == 0) {
        return null;
      }
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context, listen: false);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    print(cart.item["title"]);
    print(cart.item["price"]);
    return
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: SystemUiOverlayStyle(
        //     statusBarColor: Colors.transparent,
        //   ),
        //   child:
        Scaffold(
      appBar: buildAppbar(),
      body:

          // ListView.builder(
          //     itemCount: 15,
          //     itemBuilder: (BuildContext context, index) {
          //       return builListTileCard();
          //     })
          //
          //
          //
          ListView(
        children: [
          // Container(
          //   height: 40,
          //   decoration: const BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(20),
          //       bottomRight: Radius.circular(20),
          //     ),
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.72,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: cart.item.length,
                    itemBuilder: (BuildContext context, index) {
                      return builListTileCard(cart);
                    }),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Row(children: [
                  Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            "total",
                            style:
                                TextStyle(fontSize: 18, color: Colors.black87),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          "8792 \$",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                      height: 60,
                      width: 160,
                      margin: EdgeInsets.only(left: 100, bottom: 75),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Check Out",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )))
                ]),
              )
            ],
          )
        ],
      ),
      // ),
    );
  }

  GestureDetector builListTileCard(Cart cart) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        // color: Colors.transparent,
        //shadowColor: Colors.black,
        elevation: 10,
        shape: const RoundedRectangleBorder(
            // side: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          height: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      cart.item["image"].toString(),
                      // "assets/images/iphone.jpg",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Column(
                      children: [
                        Text(
                          cart.item['title'].toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${cart.item["price"]} \$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: incrementCounter,
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.blue,
                      )),
                  Text(
                    "$_counter",
                    style: TextStyle(fontSize: 15),
                  ),
                  IconButton(
                      onPressed: decrementCounter,
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.blue,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      // systemOverlayStyle:
      //     SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      elevation: 0.0,
      title: const Text(
        "My Cart",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.blue,
      leading: IconButton(
          onPressed: () {
            // Navigator.pushNamed(context, "homepage");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
          )),
    );
  }
}
