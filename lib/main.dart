import 'package:flutter/material.dart';
import 'package:flutter_ims/auth.dart';
import 'package:flutter_ims/root_page.dart';
import 'package:flutter_ims/home_page.dart';
import 'package:flutter_ims/stock_widget.dart';
import 'package:flutter_ims/order_widget.dart';
import 'package:flutter_ims/support_widget.dart';

void main() => runApp(new MyIMS());

//class MyIMS extends StatelessWidget {
////	 This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Quick  & Easy Order - IMS',
//      theme: new ThemeData(
//        primarySwatch: Colors.red,
//      ),
//      home: new MyHomePage()
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      body: Center(
//        child: Text('ORDER WIDGET',style: TextStyle( color: Colors.black87),),
//      ),
//    );
//  }
//}

class MyIMS extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quick  & Easy Order - IMS',
        theme: new ThemeData(
          primarySwatch: Colors.red,
        ),
        home: new RootPage(auth: new Auth()),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new MyHomePage(),
          '/stock': (BuildContext context) => new StockWidget(),
          '/support': (BuildContext context) => new SupportWidget(),
        });
  }
}
