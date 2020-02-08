import 'package:flutter/material.dart';
import 'SocketUtil.dart';

class SocketDemo extends StatefulWidget {
  //
  SocketDemo() : super();

  final String title = "AppState Demo";

  @override
  SocketDemoState createState() => SocketDemoState();
}

class SocketDemoState extends State<SocketDemo> with WidgetsBindingObserver {
  //
  String _status;
  SocketUtil _socketUtil;

  List<String> _messages;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _messages = List<String>();
    _socketUtil = SocketUtil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: ,
          ),
          FlatButton(
            child: Text("Connect"),
            onPressed: () {
              _socketUtil.connect();
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.users == null ? 0 : users.users.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  users.users[index].name,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
