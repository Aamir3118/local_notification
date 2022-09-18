import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationApi {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  //static final onNotifications = BehaviorSubject<String?>();

  //static final _notifications = FlutterLocalNotificationsPlugin();
  final AndroidInitializationSettings _androidInitializationSettings =
      AndroidInitializationSettings('@drawable/app_icon');

  void initializeNoti() async {
    tz.initializeTimeZones();
    InitializationSettings initializationSettings =
        InitializationSettings(android: _androidInitializationSettings);
    await _notifications.initialize(
      initializationSettings,
    );
  }

  Future<void> showNotification(String? title, String? body) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'this is our channel',
            importance: Importance.max,
            icon: "@drawable/app_icon",
            priority: Priority.high));
    await _notifications.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  Future<void> showScheduleNotification(
      String? title, String? body, int seconds) async {
    NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'this is our channel',
            importance: Importance.max,
            icon: "@drawable/app_icon",
            priority: Priority.high));
    await _notifications.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.from(
          DateTime.now().add(Duration(seconds: seconds)),
          tz.local,
        ),
        notificationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
  }

  // void initializeNoti() async {
  // InitializationSettings initializationSettings = InitializationSettings(
  //   android: AndroidInitializationSettings("@drawable/app_icon"));
  //}

  /*static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channel id',
          'channel name',
          icon: "@drawable/app_icon",
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final iOS = IOSInitializationSettings();
    final android = AndroidInitializationSettings('@drawable/app_icon');
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );*/
}
