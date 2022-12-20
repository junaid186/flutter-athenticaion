import 'package:flutter/material.dart';

class DeliverScreen extends StatefulWidget {
  const DeliverScreen({Key? key}) : super(key: key);

  @override
  State<DeliverScreen> createState() => _DeliverScreenState();
}

class _DeliverScreenState extends State<DeliverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delivery screen")),
    );
  }
}
