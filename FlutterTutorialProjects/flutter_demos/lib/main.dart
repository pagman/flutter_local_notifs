import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/ItemAddNotifier.dart';
import 'package:flutter_demos/Provider/ShopNameNotifier.dart';
import 'package:provider/provider.dart';
import 'Provider/HomeScreen.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemAddNotifier>(
          create: (BuildContext context) {
            return ItemAddNotifier();
          },
        ),
        ChangeNotifierProvider<ShopNameNotifier>(
          create: (BuildContext context) {
            return ShopNameNotifier();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
