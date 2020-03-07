import 'package:flutter/material.dart';
import 'package:flutter_demos/Provider/ShopNameNotifier.dart';
import 'package:provider/provider.dart';

import 'ItemModel.dart';

class ScreenTwo extends StatefulWidget {
  //
  ScreenTwo() : super();

  final String title = "Screen Two";

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  //
  final TextEditingController _controllerTaskTxt = TextEditingController();
  final TextEditingController _controllerShopTxt = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controllerTaskTxt,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Your task',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              child: Text('ADD'),
              onPressed: () async {
                if (_controllerTaskTxt.text.isEmpty) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Empty Task'),
                    ),
                  );
                  return;
                }
                await Provider.of<ItemModel>(context)
                    .addTask(_controllerTaskTxt.text);
                Navigator.pop(context);
              },
            ),
            RaisedButton(
              child: Text('THIRD SCREEN'),
              onPressed: () async {
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
            ),
            TextField(
              controller: _controllerShopTxt,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Your task',
              ),
            ),
            RaisedButton(
              child: Text('UPDATE SHOP NAME'),
              onPressed: () async {
                if (_controllerShopTxt.text.isEmpty) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text('Empty Shop name'),
                    ),
                  );
                  return;
                }
                await Provider.of<ShopNameNotifier>(context)
                    .updateShopName(_controllerShopTxt.text);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
