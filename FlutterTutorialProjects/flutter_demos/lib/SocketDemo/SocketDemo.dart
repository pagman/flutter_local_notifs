import 'package:flutter/material.dart';
import 'package:flutter_demos/SocketDemo/SocketUtil.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketDemo extends StatefulWidget {
  //
  SocketDemo() : super();

  final String title = "Socket Demo";

  @override
  State<StatefulWidget> createState() => SocketDemoState();
}

class SocketDemoState extends State<SocketDemo> {
  //
  TextEditingController _textEditingController;
  WebSocketChannel _channel;
  String _status;
  SocketUtil _socketUtil;
  List<String> _messages;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    //_connectSocketChannel();
    _status = '';
    _socketUtil = SocketUtil();
    _messages = List<String>();
  }

  _connectSocketChannel() {
    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  void sendMessage() {
    _channel.sink.add(_textEditingController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _channel.sink.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(6.0),
                  ),
                ),
                filled: true,
                fillColor: Colors.white60,
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Message',
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              child: Text('Send Message'),
              onPressed: () {
                if (_textEditingController.text.isEmpty) {
                  return;
                }
                //sendMessage();
                _socketUtil.sendMessage(_textEditingController.text,
                    connectionListener, messageListener);
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(_status),
            Expanded(
              child: ListView.builder(
                itemCount: null == _messages ? 0 : _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    _messages[index],
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  );
                },
              ),
            )
            // StreamBuilder(
            //   stream: _channel.stream,
            //   builder: (context, snapshot) {
            //     return Padding(
            //       padding: EdgeInsets.symmetric(vertical: 24.0),
            //       child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  void messageListener(String message) {
    setState(() {
      _messages.add(message);
    });
    print(_messages);
  }

  void connectionListener(bool connected) {
    setState(() {
      _status = 'Status : ' + (connected ? 'Connected' : 'Failed to connect');
    });
  }
}
