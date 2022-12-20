import 'package:flutter/material.dart';
import 'package:shopping/AuthScreens/passwordChange.dart';
import 'package:shopping/models/Products.dart';
import 'package:shopping/provider/ProductProvider.dart';
import 'package:shopping/widget/Body.dart';
import 'package:shopping/screens/deliveryScreen.dart';
import 'package:shopping/screens/profileScreen.dart';
import 'models/constants.dart';
import 'AuthScreens/login.dart';
import 'AuthScreens/signUp.dart';
import 'AuthScreens/forgetPassword.dart';
import 'screens/Homepage.dart';
import 'screens/cartScreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import './AuthScreens/login.dart';
import 'package:provider/provider.dart';
import './provider/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: Cart()),
        // ChangeNotifierProvider.value(value: Products())
        // ChangeNotifierProvider(create: (context) => ProductProvider()),
        // ChangeNotifierProvider(create: (context)=>Products(id: id, price: price, title: title, image: image, description: description))
        // ChangeNotifierProvider(create: (context) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: PageControlment(),
        // initialRoute: '',

        routes: {
          'login': (context) => LogIn(),
          'signup': (context) => Signup(),
          'forgotpassword': (context) => ForgotPassword(),
          'homepage': (context) => MyHomePage(),
          'profile': (context) => ProfileScreen(),
          'cartScreen': (context) => CartScreen(),
          'changePassword': (context) => ChangePassword()
        },
      ),
    );
  }
}

class PageControlment extends StatefulWidget {
  const PageControlment({Key? key}) : super(key: key);

  @override
  State<PageControlment> createState() => _PageControlmentState();
}

class _PageControlmentState extends State<PageControlment> {
  // int index = 0;
  // final items = <Widget>[
  //   Icon(
  //     Icons.home,
  //     size: 30,
  //     color: Colors.white,
  //   ),
  //   Icon(
  //     Icons.delivery_dining,
  //     size: 30,
  //     color: Colors.white,
  //   ),
  //   Icon(
  //     Icons.person,
  //     size: 30,
  //     color: Colors.white,
  //   ),
  // ];
  // PageController _controller = PageController();
  List<Widget> _screens = [MyHomePage(), DeliverScreen(), ProfileScreen()];
  // void _onPageChanged(int index) {}
  // void _pageTapped(int currentIndex) {
  //   _controller.jumpToPage(currentIndex);
  // }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _items() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        // activeColorPrimary: CupertinoColors.activeBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.delivery_dining),
        title: ("Deliver"),
        // activeColorPrimary: CupertinoColors.activeBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        // activeColorPrimary: CupertinoColors.activeBlue,
        // inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _screens,
        items: _items(),
      ),
    );
  }
}
