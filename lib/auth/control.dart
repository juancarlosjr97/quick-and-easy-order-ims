import 'package:flutter/material.dart';
import 'package:flutter_ims/screens/home_page.dart';
import 'package:flutter_ims/auth/authentification.dart';
import 'package:flutter_ims/screens/auth/sign_in.dart';
import 'package:flutter_ims/screens/auth/register.dart';

class RootPage extends StatefulWidget {
  const RootPage({required this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => _RootPageState();
}

enum AuthStatus { authenticated, signIn, register }

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.signIn;

  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        authStatus =
            userId == null ? AuthStatus.signIn : AuthStatus.authenticated;
      });
    });
  }

  onSignIn() {
    setState(() {
      authStatus = AuthStatus.authenticated;
    });
  }

  onRegister() {
    setState(() {
      authStatus = AuthStatus.authenticated;
    });
  }

  Future<void> onSignOut() async {
    try {
      await widget.auth.signOut();
    } catch (e) {
      print('Error $e');
    }

    setState(() {
      authStatus = AuthStatus.signIn;
    });
  }

  switchSignIn() {
    setState(() {
      authStatus = AuthStatus.signIn;
    });
  }

  switchRegister() {
    setState(() {
      authStatus = AuthStatus.register;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.signIn:
        return SignIn(
            onSignIn: onSignIn, switchPage: switchRegister, auth: widget.auth);

      case AuthStatus.register:
        return Register(
            onRegister: onRegister,
            switchPage: switchSignIn,
            auth: widget.auth);

      case AuthStatus.authenticated:
        return HomePage(onSignOut: onSignOut, auth: widget.auth);
    }
  }
}
