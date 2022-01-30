import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
import 'package:flutter_ims/auth/control.dart';
import 'package:flutter_ims/auth/authentification.dart';
import 'package:flutter_ims/screens/auth/sign_in.dart';
import 'package:flutter_ims/screens/auth/register.dart';
import 'package:flutter_ims/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quick  & Easy Order - IMS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: RootPage(auth: Authentification()),
      // routes: <String, WidgetBuilder>{
      //   '/auth/sign_in': (BuildContext context) =>
      //       const MyHomePage(title: "Test"),
      //   '/auth/register': (BuildContext context) =>
      //       const MyHomePage(title: "Test"),
      // }
    );
  }
}
