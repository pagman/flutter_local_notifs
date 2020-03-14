import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/ItemAddNotifier.dart';
import 'package:flutter_demos/Provider/ShopNameNotifier.dart';
import 'package:provider/provider.dart';

class AddItemsScreen extends StatelessWidget {
  //
  AddItemsScreen() : super();

  final String title = 'Add Items';

  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Item Name',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('ADD ITEM'),
              onPressed: () async {
                if (_itemNameController.text.isEmpty) {
                  return;
                }
                await Provider.of<ItemAddNotifier>(context, listen: false)
                    .addItem(_itemNameController.text);
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('ADD ITEM SCREEN'),
              onPressed: () async {
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
            ),
            TextField(
              controller: _shopNameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Shop Name',
              ),
            ),
            RaisedButton(
              child: Text('UPDATE SHOP'),
              onPressed: () async {
                if (_shopNameController.text.isEmpty) {
                  return;
                }
                await Provider.of<ShopNameNotifier>(context, listen: false)
                    .updateShopName(_shopNameController.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
