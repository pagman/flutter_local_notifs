import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/AddItemsScreen.dart';
import 'package:flutter_demos/Provider/ItemAddNotifier.dart';
import 'package:provider/provider.dart';
import 'ShopNameNotifier.dart';

class HomeScreen extends StatelessWidget {
  //
  HomeScreen() : super();

  final String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ItemAddNotifier>(
          builder: (context, list, _) {
            return Text('Items ${list.itemList.length}');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return AddItemsScreen();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Consumer<ItemAddNotifier>(
                builder: (context, todos, _) {
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: todos.itemList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          todos.itemList[index].task,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Consumer<ShopNameNotifier>(
              builder: (context, shopNameNotifier, child) {
                return Text('Shop Name: ${shopNameNotifier.shopName}');
              },
            ),
          ],
        ),
      ),
    );
  }
}
