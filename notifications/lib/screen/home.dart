import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications/widget/Text.dart';


class home extends StatefulWidget {
  const home({ Key? key }) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var task;
  TextEditingController tc = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    flutterLocalNotificationsPlugin = new  FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('app_icon');
     var iOSinitilize = IOSInitializationSettings();
    var initSettings = new InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initSettings,
       onSelectNotification: notificationSelected);
    super.initState();
  }
    notificationSelected(String ? payload) async {
    debugPrint("payload : $payload");
    await showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          content: Text("Message : $payload"),
    );
      },
    );
  }
   Future _showNotification() async {
   var androidPlatformChannelSpecifics =
        const AndroidNotificationDetails("Channel id","your channel id",);
     var platformChannelSpecifics =
        NotificationDetails(android:  androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        0, "New Notification", "You created a Notification", platformChannelSpecifics, payload: '${tc.text}',
    );
  } 

   @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Local Notifications"),
      backgroundColor: Color.fromARGB(255, 43, 43, 43),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 20,
          // ),
          TextBox("Message", tc, deviceSize),
          ElevatedButton(
            onPressed: () {
              _showNotification();
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.black),
            child: const Text(
              'Set Task WIth Notification',
              style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          )
        ],
      ),
    );
  }
}
 
