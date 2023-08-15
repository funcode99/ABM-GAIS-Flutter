import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gais/util/navigation/notification_navigation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

final StreamController<String?> selectNotificationStream = StreamController<String?>.broadcast();

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class FirebaseMessagingConfig{

  static Future<void> init() async{
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications for GAIS app.',
      importance: Importance.max,
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        if(notificationResponse.payload != null){
          Map<String, dynamic> data = jsonDecode(notificationResponse.payload!);
          _handleTapOnNotification(data);
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );


    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        AndroidNotification? android = message.notification?.android;

        // If `onMessage` is triggered with a notification, construct our own
        // local notification to show to users using the created channel.
        if (android != null) {
          flutterLocalNotificationsPlugin.show(
              message.notification.hashCode,
              message.notification?.title,
              message.notification?.body,
              payload: jsonEncode(message.data),
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                ),
              ));
        }
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleTapOnNotification(message.data);
    });
  }

  static void _handleTapOnNotification(Map<String, dynamic> data){
    if (data.containsKey("is_approval")) {
      if(data["is_approval"].toString() == "0"){
        NotificationNavigation.navigateToPage(
          codeDocument: data["code_document"],
          id: data["id_document"],
          typeDocument: data["type_document"],
        );
      }else{
        NotificationNavigation.navigateToPageApproval(
          codeDocument: data["code_document"],
          id: data["id_document"],
          typeDocument: data["type_document"],
        );
      }
    }
  }


}