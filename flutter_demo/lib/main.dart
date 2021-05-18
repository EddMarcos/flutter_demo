import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: NotificaltionApp(),
    );
  }
}
class NotificaltionApp extends StatefulWidget {
  @override
  _NotificaltionAppState createState() => _NotificaltionAppState();
}

class _NotificaltionAppState extends State<NotificaltionApp> {
  //add a package to use notification
  //add permission for android
  // notification system creation

  
  // local notification object
FlutterLocalNotificationsPlugin LocalNotification;

//initialize thr object
@override
  void initState() {
    
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    //function to initialize android setting, which takes the icon name parameter
    // make sute to add the icon in the drawable folder to avoid error

    var iOSIntialize = new IOSInitializationSettings();
    var initialzationSettings = new InitializationSettings(
      android: androidInitialize, iOS: iOSIntialize);
      LocalNotification = new FlutterLocalNotificationsPlugin();
      LocalNotification.initialize(initialzationSettings);
  }
  //show notification function
  Future _showNotification() async{
    var androidDetails = new AndroidNotificationDetails(
      "channelId", 
      "Local Notification", 
      "This is the description of the Notification, you can write anything", importance: Importance.high);
    var iosDetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await LocalNotification.show(0, "Notif Title",
        "The bodu of the notification", generalNotificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text("Click the button to recieve a notification"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNotification,
        child: Icon(Icons.notifications),
      ),
    );
  }
}