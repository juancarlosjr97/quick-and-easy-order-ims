import 'package:flutter/material.dart';


class OrderWidget extends StatefulWidget {

  @override
  OrderWidgetApp createState() => new OrderWidgetApp();
}

class OrderWidgetApp extends State<OrderWidget>
{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
				body: Center(
				child: Text('ORDER WIDGET',style: TextStyle( color: Colors.black87),),
		),
		);
  }

}