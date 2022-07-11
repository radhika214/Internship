import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebasenotification/widgets/TextField.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  String get title => "Firebase Notification";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
    late AndroidNotificationChannel channel ;
     TextEditingController textEditingController = TextEditingController();
      TextEditingController tc = TextEditingController();


   getNotifications() {
    print("inside getnotification");
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });
   
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
      
      }
    });
  }
   void loadFCM() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.high,
        enableVibration: true,
      );
        flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      /// Create an Android Notification Channel.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }
    
   

  @override
  void initState() {
    getNotifications();
    super.initState();
    loadFCM();
  }
  @override
  Widget build(BuildContext context) {
  Size deviceSize = MediaQuery.of(context).size;
  // var title;
  return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
           backgroundColor: Color.fromARGB(255, 43, 43, 43),),
        
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           TextBox("Message", tc, deviceSize),
            // TextField(
            //   controller: textEditingController,
            // ),
            ElevatedButton(
                onPressed: () async {
                  var fcmToken =
                      await FirebaseMessaging.instance.getToken() ?? "";
                      print("token $fcmToken");
                  var dio = Dio();
                  var body = {
                    "to": fcmToken,
                    "notification": {
                      "body": tc.text,
                      "title": "Notification"
                    }
                  };
                  dio.options.headers["Authorization"] =
                      "key=AAAAyxem98o:APA91bGXlruvv61m5JwPCGQQZ0a2yjpc8bdUWIn42NcQ1f7t4_yGzulCpRRuJJbezxbMOUckROnwosphVCd9oR_T7UdnGFtwdCm8KqYroi44vvb1hLwVzGOC6vQWj3ySvg79H_ELGaln";
                  var response = await dio.post(
                      'https://fcm.googleapis.com/fcm/send',
                      data: json.encode(body));
                  print(response.data);
                },
                 style: ElevatedButton.styleFrom(
                primary: Colors.black),
                child: Text("Send", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
            )
            
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}