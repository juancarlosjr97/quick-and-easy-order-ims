import 'package:flutter/material.dart';
import 'package:flutter_ims/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_ims/stock_widget.dart';
import 'package:flutter_ims/order_widget.dart';
import 'package:flutter_ims/support_widget.dart';

class MyHomePage extends StatelessWidget //Home Page
{
  MyHomePage({this.auth, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Home Page'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Log out',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                child: Text(
                  "Menu",
                  textAlign: TextAlign.justify,
                  textScaleFactor: 2.0,
                ),
                decoration: BoxDecoration(color: Colors.red),
              ),
              ListTile(
                  title: Text("HOME"),
                  trailing: new Icon(Icons.home),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home');
                  }),
              ListTile(
                title: Text("Stock List"),
                trailing: new Icon(Icons.home),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/home');
                },
              ),
              ListTile(
                  title: Text("Order Page"),
                  trailing: new Icon(Icons.reorder),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home');
                  }),
              ListTile(
                  title: Text("Support Page"),
                  trailing: new Icon(Icons.contact_mail),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).pushNamed('/home');
                  }),
              ListTile(
                title: Text("Log Out"),
                trailing: new Icon(Icons.dashboard),
                onTap: () {
                  _signOut();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        body: new DefaultTabController(
          length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              actions: <Widget>[],
              title: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(FontAwesomeIcons.warehouse)),
                  new Tab(icon: new Icon(FontAwesomeIcons.firstOrder)),
                  new Tab(icon: new Icon(Icons.contact_mail))
                ],
                indicatorColor: Colors.white,
              ),
            ),
            body: new TabBarView(
              children: <Widget>[
                new Tab(
                  child: new StockWidget(),
                ),
                new Tab(
                  child: new OrderWidget(),
                ),
                new Tab(
                  child: new SupportWidget(),
                ),
              ],
            ),
          ),
        ));
  }
}
