import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'NotificationPlugin.dart';

class LocalNotificationsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LocalNotificationsScreen> {
  //

  BehaviorSubject<String> _selectNotificationSubject;

  @override
  void initState() {
    super.initState();
    _selectNotificationSubject = BehaviorSubject<String>();
    _initNotifications();
  }

  _initNotifications() async {
    await notificationPlugin.init();
    await notificationPlugin
        .setNotificationCallback(_selectNotificationSubject);
    _configureSelectNotificationSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Notifications'),
      ),
      body: Center(
        child: FlatButton(
          child: Text('Send Notification'),
          onPressed: () async {
            await notificationPlugin.showNotification(
              0,
              'My title',
              'My Subtitle',
              'Payload',
            );
          },
        ),
      ),
    );
  }

  void _configureSelectNotificationSubject() {
    _selectNotificationSubject.stream.listen((String payload) async {
      print('Here $payload');
    });
  }

  @override
  void dispose() {
    _selectNotificationSubject.close();
    super.dispose();
  }
}
