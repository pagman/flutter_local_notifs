import 'dart:async';
import 'dart:convert';
import 'dart:io';

class SocketUtil {
  //

  Socket _socket;

  void connect() async {
    Socket socket = await Socket.connect("127.0.0.1", 10002);
    print('connected');

    // listen to the received data event stream
    socket.listen((List<int> event) {
      print(utf8.decode(event));
    });

    // send hello
    socket.add(utf8.encode('hello'));

    // wait 5 seconds
    await Future.delayed(Duration(seconds: 5));

    // .. and close the socket
    socket.close();
  }

  void cleanUp() {
    if (null != _socket) {
      _socket.destroy();
    }
  }
}
