import 'package:flutter/material.dart';
import 'package:flutter_demos/ErrorHandling/HomeScreen.dart';
import 'package:flutter_demos/others/SocketIOChat/ChatScreen.dart';
import 'ChatUsersScreen.dart';
import 'Global.dart';
import 'User.dart';

class LoginScreen extends StatefulWidget {
  //
  LoginScreen() : super();

  // This screen's ID, can be used later in navigation
  static const String ROUTE_ID = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  TextEditingController _usernameController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    G.initDummyUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LOGIN'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
                child: Text('LOGIN'),
                onPressed: () {
                  _loginBtnTap();
                })
          ],
        ),
      ),
    );
  }

  _loginBtnTap() async {
    if (_usernameController.text.isEmpty) {
      return;
    }

    User me = G.dummyUsers[0];
    if (_usernameController.text != 'a') {
      me = G.dummyUsers[1];
    }

    G.loggedInUser = me;

    openHomeScreen(context);
  }

  static openHomeScreen(BuildContext context) async {
    await Navigator.pushReplacementNamed(
      context,
      ChatUsersScreen.ROUTE_ID,
    );
  }
}
