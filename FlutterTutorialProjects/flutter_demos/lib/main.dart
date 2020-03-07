import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/ScreenOne.dart';
import 'package:provider/provider.dart';
import 'Provider/ItemModel.dart';
import 'Provider/ShopNameNotifier.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ItemModel>(
        builder: (context) => ItemModel(),
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
      // home: ChangeNotifierProvider<ToDoModel>(
      //   builder: (context) => ToDoModel(),
      //   child: ScreenOne(),
      // ),
      home: ScreenOne(),
    );
  }
}
