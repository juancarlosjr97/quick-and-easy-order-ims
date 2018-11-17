import 'package:flutter/material.dart';
import 'package:flutter_ims/auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final formKey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print('Singed in: $userId');
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print('Registered  user in: $userId');
        }
        widget.onSignedIn();
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Quick  & Easy Order - IMS'),
        ),
        body: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Form(
                key: formKey,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: buildInputs() + buildSubmitButtons(),
                ))));
  }

  List<Widget> buildInputs() {
    return [
      new Image.asset(
        'images/flutter-logo-round.png',
        width: 200.0,
        height: 150.0,
        fit: BoxFit.cover,
      ),
      new TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        obscureText: true,
        autofocus: false,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Create an account',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        new RaisedButton(
          child: new Text('Create an account',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text('Login if you have an account ',
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }

//	Widget _logo() {
//		return new Hero(
//			tag: 'logo',
//			child: CircleAvatar(
//				backgroundColor: Colors.transparent,
//				radius: 100.0,
//				child: Image.asset('images/flutter-logo-round.png'),
//			),
//		);
//	}

}
