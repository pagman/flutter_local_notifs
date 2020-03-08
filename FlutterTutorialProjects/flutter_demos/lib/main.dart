import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/HomeScreen.dart';
import 'package:provider/provider.dart';
import 'Provider/ItemAddNotifier.dart';
import 'Provider/ShopNameNotifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ItemAddNotifier>(
        builder: (context) => ItemAddNotifier(),
      ),
      ChangeNotifierProvider<ShopNameNotifier>(
        builder: (context) => ShopNameNotifier(),
      ),
    ],
    child: HomeApp(),
  ));
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: ChangeNotifierProvider(
      //   builder: (context) => ToDoModel(),
      //   child: ScreenOne(),
      // ),
      home: HomeScreen(),
    );
  }
}
