import 'package:flutter/material.dart';
import 'Routes/FirstScreen.dart';
import 'Routes/SecondScreen.dart';

void main() {
  runApp(
    new HomeApp(),
  );
}

/*
// Wrap main widget inside the StreamProvider
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityResult>(
      builder: (context) => ConnectivityService().connectionStatusController,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tutorials',
        home: new ConnectivityDemo(),
      ),
    );
  }
}
*/

/*
class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tutorials',
      home: new RSSDemo(),
    );
  }
}
*/

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirstScreen.routeName,
      routes: {
        FirstScreen.routeName: (context) => FirstScreen(),
        SecondScreen.routeName: (context) => SecondScreen(),
      },
    );
  }
}