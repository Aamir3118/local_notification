import 'package:flutter/material.dart';
import 'package:notification/notification_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NotificationApi _noti = NotificationApi();
  @override
  void initState() {
    _noti.initializeNoti();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  _noti.showNotification(
                    'title',
                    'body',
                  );
                },
                icon: Icon(Icons.notifications, color: Colors.black),
                label: Text(
                  'Simple Notification',
                  style: TextStyle(color: Colors.black),
                )),
            ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  _noti.showScheduleNotification('title', 'body', 10);
                },
                icon: Icon(Icons.notifications_active, color: Colors.black),
                label: Text(
                  'Schedule Notification',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        )),
      ),
    );
  }
}
