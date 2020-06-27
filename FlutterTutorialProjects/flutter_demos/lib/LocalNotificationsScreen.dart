import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NotificationPlugin.dart';

class LocalNotificationsScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<LocalNotificationsScreen> {
  //

  int _pendingNotfCount;

  @override
  void initState() {
    super.initState();
    _pendingNotfCount = 0;
    _initNotifications();
  }

  _initNotifications() async {
    await notificationPlugin.init();
    await notificationPlugin.setNotificationCallback(onNotificationClick);
    await notificationPlugin
        .setListernerForLowerVersion(onNotificationClickForLowerVersion);
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
            // await notificationPlugin.repeatNotification();
            // await notificationPlugin.showDailyAtTime();
            // await notificationPlugin.showNotification();
            int count = await notificationPlugin.getPendingCount();
            print('Pending Notification Count $count');
          },
        ),
      ),
    );
  }

  onNotificationClick(String payload) {
    print('Click $payload');
  }

  onNotificationClickForLowerVersion(
      ReceivedNotification receivedNotification) {
    print('receivedNotification ${receivedNotification.title}');
  }
}
