import 'dart:convert';
import 'dart:io';
import 'package:flutter_demos/others/SocketIOChat/ChatMessageModel.dart';

import 'User.dart';
import 'package:adhara_socket_io/adhara_socket_io.dart';

class SocketUtils {
  //
  static String SERVER_IP =
      Platform.isIOS ? 'http://localhost' : 'http://10.0.2.2';
  static const int SERVER_PORT = 4002;
  static String _CONNECT_URL = '$SERVER_IP:$SERVER_PORT';

  // Events
  static const String ON_MESSAGE_RECEIVED = 'receive_message';
  static const String SUB_EVENT_MESSAGE_SENT = 'message_sent_to_user';
  static const String IS_USER_CONNECTED_EVENT = 'is_user_connected';
  static const String IS_USER_ONLINE_EVENT = 'check_online';
  static const String SUB_EVENT_MESSAGE_FROM_SERVER = 'message_from_server';

  // Status
  static const int STATUS_MESSAGE_NOT_SENT = 10001;
  static const int STATUS_MESSAGE_SENT = 10002;
  static const int STATUS_MESSAGE_DELIVERED = 10003;
  static const int STATUS_MESSAGE_READ = 10004;

  // Type of Chat
  static const String SINGLE_CHAT = 'single_chat';

  User _fromUser;

  SocketIO _socket;
  SocketIOManager _manager;

  initSocket(User fromUser) async {
    print('Connecting user: ${fromUser.name}');
    this._fromUser = fromUser;
    await _init();
  }

  _init() async {
    _manager = SocketIOManager();
    _socket = await _manager.createInstance(_socketOptions());
  }

  _socketOptions() {
    final Map<String, String> userMap = {
      'from': _fromUser.id.toString(),
    };
    return SocketOptions(
      _CONNECT_URL,
      enableLogging: true,
      transports: [Transports.WEB_SOCKET],
      query: userMap,
    );
  }

  sendSingleChatMessage(ChatMessageModel chatMessageModel, User toChatUser) {
    print('Sending Message to: ${toChatUser.name}, ID: ${toChatUser.id}');
    if (null == _socket) {
      print("Socket is Null, Cannot send message");
      return;
    }
    _socket.emit("single_chat_message", [chatMessageModel.toJson()]);
  }

  setOnMessageBackFromServer(Function onMessageBackFromServer) {
    _socket.on(SUB_EVENT_MESSAGE_FROM_SERVER, (data) {
      onMessageBackFromServer(data);
    });
  }

  checkOnline(ChatMessageModel chatMessageModel) {
    print('Checking Online: ${chatMessageModel.to}');
    if (null == _socket) {
      print("Socket is Null, Cannot send message");
      return;
    }
    _socket.emit(IS_USER_ONLINE_EVENT, [chatMessageModel.toJson()]);
  }

  connectToSocket() {
    if (null == _socket) {
      print("Socket is Null");
      return;
    }
    print("Connecting to socket...");
    _socket.connect();
  }

  setConnectListener(Function onConnect) {
    _socket.onConnect((data) {
      print("connected...$data");
      pprint(data);
      onConnect(data);
    });
  }

  setOnConnectionErrorListener(Function onConnectError) {
    _socket.onConnectError((data) {
      onConnectError(data);
    });
  }

  setOnConnectionErrorTimeOutListener(Function onConnectTimeout) {
    _socket.onConnectTimeout((data) {
      onConnectTimeout(data);
    });
  }

  setOnErrorListener(Function onError) {
    _socket.onError((error) {
      print("Error: " + error);
      onError(error);
    });
  }

  setOnDisconnectListener(Function onDisconnect) {
    _socket.onDisconnect((data) {
      print("onDisconnect $data");
      onDisconnect(data);
    });
  }

  setOnChatMessageReceivedListener(Function onChatMessageReceived) {
    _socket.on(ON_MESSAGE_RECEIVED, (data) {
      print("Received $data");
      onChatMessageReceived(data);
    });
  }

  setOnMessageSentToChatUserListener(Function onMessageSentListener) {
    _socket.on(SUB_EVENT_MESSAGE_SENT, (data) {
      print("onMessageSentListener $data");
      onMessageSentListener(data);
    });
  }

  setOnUserConnectionStatusListener(Function onUserConnectionStatus) {
    _socket.on(IS_USER_CONNECTED_EVENT, (data) {
      onUserConnectionStatus(data);
    });
  }

  pprint(data) {
    if (data is Map) {
      data = json.encode(data);
    }
    print(data);
  }

  closeConnection() {
    if (null != _socket) {
      print("Close Connection");
      _manager.clearInstance(_socket);
    }
  }
}
