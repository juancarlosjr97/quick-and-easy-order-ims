import 'package:flutter/material.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  OrderWidgetApp createState() => OrderWidgetApp();
}

class OrderWidgetApp extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ORDER WIDGET',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
