import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/ScreenTwo.dart';
import 'package:flutter_demos/Provider/Item.dart';
import 'package:flutter_demos/Provider/ItemModel.dart';
import 'package:provider/provider.dart';
import 'ShopNameNotifier.dart';

class ScreenOne extends StatefulWidget {
  //
  ScreenOne() : super();

  final String title = "Screen One";

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  //
  List<Item> _items;

  @override
  void initState() {
    super.initState();
    _items = List();
    Item item = Item('item 1');
    _items.add(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return ScreenTwo();
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
              child: Consumer<ItemModel>(
                builder: (context, todos, child) {
                  return ListView.builder(
                    padding: EdgeInsets.all(10.0),
                    itemCount: todos.taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          todos.taskList[index].task,
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
