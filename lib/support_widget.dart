import 'package:flutter/material.dart';

class SupportWidget extends StatefulWidget {
  @override
  SupportWidgetApp createState() => new SupportWidgetApp();
}

class SupportWidgetApp extends State<SupportWidget> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Text(
          'SUPPORT WIDGET',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
