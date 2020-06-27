// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_demos/LocalNotificationsScreen.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocalNotificationsScreen(),
    );
  }
}
