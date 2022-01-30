import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_ims/auth/authentification.dart';
import 'package:flutter_ims/screens/stock.dart';
import 'package:flutter_ims/screens/order.dart';
import 'package:flutter_ims/screens/support.dart';

typedef FutureCallback = Future Function();

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.auth, required this.onSignOut})
      : super(key: key);

  final BaseAuth auth;
  final FutureCallback onSignOut;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Home Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: <Widget>[
            TextButton(
              child: const Text('Log out',
                  style: TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: () async {
                await widget.onSignOut();
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: Text(
                  "Quick & Easy Order",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                  title: const Text("Home"),
                  trailing: const Icon(Icons.home),
                  onTap: () {
                    print("Navigator Placeholder");
                  }),
              ListTile(
                title: const Text("Log Out"),
                trailing: const Icon(FontAwesomeIcons.signOutAlt),
                onTap: () async {
                  await widget.onSignOut();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              actions: const <Widget>[],
              title: const TabBar(
                tabs: [
                  Tab(icon: Icon(FontAwesomeIcons.warehouse)),
                  Tab(icon: Icon(FontAwesomeIcons.firstOrder)),
                  Tab(icon: Icon(Icons.contact_mail))
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: const TabBarView(
              children: <Widget>[
                Tab(
                  child: StockWidget(),
                ),
                Tab(
                  child: OrderWidget(),
                ),
                Tab(
                  child: SupportWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
