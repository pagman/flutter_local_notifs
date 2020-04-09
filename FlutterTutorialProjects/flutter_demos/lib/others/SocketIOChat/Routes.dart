import 'package:flutter_demos/others/SocketIOChat/ChatScreen.dart';
import 'package:flutter_demos/others/SocketIOChat/ChatUsersScreen.dart';
import 'package:flutter_demos/others/SocketIOChat/LoginScreen.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTE_ID: (context) => LoginScreen(),
      ChatUsersScreen.ROUTE_ID: (context) => ChatUsersScreen(),
      ChatScreen.ROUTE_ID: (context) => ChatScreen(),
    };
  }

  static initScreen() {
    return LoginScreen.ROUTE_ID;
  }
}
