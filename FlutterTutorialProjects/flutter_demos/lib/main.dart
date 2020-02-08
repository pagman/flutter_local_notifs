import 'package:flutter/material.dart';
import 'SocketDemo/SocketDemo.dart';

void main() {
  runApp(
    HomeApp(),
  );
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SocketDemo(),
    );
  }
}
