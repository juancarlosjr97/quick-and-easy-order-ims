import 'package:flutter/material.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  SupportWidgetApp createState() => SupportWidgetApp();
}

class SupportWidgetApp extends State<SupportWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'SUPPORT WIDGET',
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
