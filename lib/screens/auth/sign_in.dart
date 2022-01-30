import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ims/auth/authentification.dart';

class SignIn extends StatefulWidget {
  const SignIn(
      {Key? key,
      required this.auth,
      required this.switchPage,
      required this.onSignIn})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback switchPage;
  final VoidCallback onSignIn;

  @override
  State<SignIn> createState() => _SignInState();
}

enum FormType { login, register }

class _SignInState extends State<SignIn> {
  String title = 'Quick  & Easy Order - IMS';

  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();
  FormType formType = FormType.login;

  bool isFormValid() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void submitForm() async {
    if (isFormValid()) {
      try {
        User? user =
            await widget.auth.signInWithEmailAndPassword(_email, _password);

        print('User: $user');

        widget.onSignIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buildInputs() + buildSubmitButtons(),
                ))));
  }

  List<Widget> buildInputs() {
    return [
      Image.asset(
        'images/flutter-logo-round.png',
        width: 200.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: const InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email cannot be empty';
          }
          return null;
        },
        onSaved: (value) => _email = value!,
      ),
      TextFormField(
        decoration: const InputDecoration(
            hintText: 'Password',
            icon: Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        obscureText: true,
        autofocus: false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password cannot be empty';
          }

          return null;
        },
        onSaved: (value) => _password = value!,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    return [
      ElevatedButton(
        child: const Text('Login', style: TextStyle(fontSize: 20.0)),
        onPressed: submitForm,
      ),
      TextButton(
        child: Builder(builder: (context) {
          return const Text('Create an account',
              style: TextStyle(fontSize: 20.0));
        }),
        onPressed: () {
          widget.switchPage();
        },
      )
    ];
  }
}
