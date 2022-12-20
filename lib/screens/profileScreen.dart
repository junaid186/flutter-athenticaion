import 'package:flutter/material.dart';
import '../models/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final elevationOfButton = 15.0;
  @override
  Widget build(BuildContext context) {
    final heightBackGroudCon = MediaQuery.of(context).size.height * 0.22;
    final heightProfileCon = MediaQuery.of(context).size.height * 0.161;
    final widthProfilecon = MediaQuery.of(context).size.height * 0.161;
    final heightName = MediaQuery.of(context).size.height * 0.034;
    final buttonRowHeight = MediaQuery.of(context).size.height * 0.17;

    final containBottom = heightProfileCon / 2;
    final top = heightBackGroudCon - (heightProfileCon / 2);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: ListView(
        children: [
          topBuild(heightBackGroudCon, top, heightProfileCon, widthProfilecon),
          const SizedBox(
            height: 8,
          ),
          buildNameContainer(heightName),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: buttonRowHeight,
            color: Colors.transparent,
            child: Row(
              children: [
                buildQrScan(),
                buildOrders(),
                buildpoints(),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            height: MediaQuery.of(context).size.height * 0.17,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 36),
                        child: Text(
                          "Become a",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Gold Member",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Subscribe Now",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationThickness: 2),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage:
                          AssetImage("assets/images/img_avatar.png"),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Junaid",
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110, top: 20),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.only(right: 20),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Subscribe Now",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Edit Profile"),
            onTap: () {},
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.point_of_sale),
            title: Text("My Loyalty Points"),
            onTap: () {},
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.note),
            title: Text("Total Orders"),
            onTap: () {},
          ),
          SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Padding buildpoints() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        height: 70,
        width: 120,
        //padding: const EdgeInsets.only(left: 15),
        // color: Colors.pink,
        decoration: const BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(15))),

        // color: Colors.transparent,
        child:
            // SizedBox(
            //   // height: 30,
            //   // width: 30,
            //   child:
            ElevatedButton(
          // elevation: elevationOfButton,
          // color: Colors.white,
          onPressed: () {},
          child: Column(
            children: [
              Text(
                "0",
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              SizedBox(height: 8),
              Text(
                'Loylity Points',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        //),
      ),
    );
  }

  Padding buildOrders() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        height: 70,
        width: 120,
        //padding: const EdgeInsets.only(left: 15),
        // color: Colors.pink,
        decoration: const BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(15))),

        // color: Colors.transparent,
        child:
            // SizedBox(
            //   // height: 30,
            //   // width: 30,
            //   child:
            ElevatedButton(
          // elevation: elevationOfButton,
          // color: Colors.white,
          onPressed: () {},
          child: Column(
            children: [
              Text(
                "0",
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              SizedBox(height: 8),
              Text(
                'Total Orders',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        //),
      ),
    );
  }

  Padding buildQrScan() {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
      ),
      child: Container(
        height: 70,
        width: 120,
        //padding: const EdgeInsets.only(left: 15),
        // color: Colors.pink,
        decoration: const BoxDecoration(
            // color: Colors.amber,
            borderRadius: BorderRadius.all(Radius.circular(15))),

        // color: Colors.transparent,
        child:
            // SizedBox(
            //   // height: 30,
            //   // width: 30,
            //   child:
            ElevatedButton(
          // elevation: elevationOfButton,
          // color: Colors.white,
          onPressed: () {},
          child: Column(
            children: [
              Text(
                "0",
                style: TextStyle(color: Colors.blue, fontSize: 25),
              ),
              SizedBox(height: 8),
              Text(
                'QR Scans',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        //),
      ),
    );
  }

  Container buildNameContainer(double heightName) {
    return Container(
      height: heightName,
      alignment: Alignment.center,
      // width: double.infinity,
      color: Colors.transparent,
      child: Text(
        "Junaid",
        style: TextStyle(
            color: Colors.black,
            fontSize: heightName,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0.0,
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
        // Container(
        //   padding: EdgeInsets.only(right: 15),
        //   child: Icon(
        //     Icons.shopping_cart,
        //     // color: Color.fromARGB(171, 18, 1, 1),
        //   ),
        // ),
      ],
    );
  }

  Stack topBuild(double heightBackGroudCon, double top, double heightProfileCon,
      double widthProfilecon) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: heightProfileCon / 2),
          child: Container(
            height: heightBackGroudCon,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          top: top,
          left: 0.0,
          right: 0.0,
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 130),
              height: heightProfileCon,
              width: widthProfilecon,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/images/img_avatar.png"),
                      fit: BoxFit.cover))),
        )
      ],
    );
  }
}
