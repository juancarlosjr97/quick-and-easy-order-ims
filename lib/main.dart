import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quick_easy_order/auth.dart';
import 'package:quick_easy_order/home_page.dart';
import 'package:quick_easy_order/root_page.dart';
import 'package:quick_easy_order/stock_widget.dart';
import 'package:quick_easy_order/support_widget.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyIMS());
}

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
