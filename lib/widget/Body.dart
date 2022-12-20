// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping/models/Products.dart';
import 'package:shopping/models/constants.dart';
import 'package:provider/provider.dart';
import 'package:shopping/provider/ProductProvider.dart';
import 'package:shopping/screens/ProductDetailScreen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Stack(
            children: [
              Container(
                // color: Colors.blue,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color: Colors.blue.withOpacity(0.23))
                      ]),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.blue.withOpacity(0.9),
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        suffix: Icon(
                          Icons.search,
                          color: Colors.blue.withOpacity(0.9),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 0),
        //   child: Text("apple",
        //       style: Theme.of(context)
        //           .textTheme
        //           .headline5!
        //           .copyWith(fontWeight: FontWeight.bold)),
        // ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ProductGrid(),
        ),
      ],
    );
  }
}

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);
    final products = productData.items;
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: ((ctx, index) {
        return Item(
          products[index].id,
          products[index].price,
          products[index].title,
          products[index].image,
        );
      }),
    );
  }
}

class Item extends StatelessWidget {
  String id;
  double price;
  String title;
  String image;
  Item(this.id, this.price, this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(),
                settings: RouteSettings(arguments: id)));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                kDefaulPadding / 4, 0, kDefaulPadding / 4, 0),
            child: Container(
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              child: Image.asset(image, fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              const SizedBox(
                height: 6,
              ),
              Text(
                "\$${price.toString()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
