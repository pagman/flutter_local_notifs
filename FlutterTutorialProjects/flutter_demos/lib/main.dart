import 'package:flutter/material.dart';
import 'package:flutter_demos/widgets/EasyJsonParse/JsonParseDemo.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonParseDemo(),
    );
  }
}
