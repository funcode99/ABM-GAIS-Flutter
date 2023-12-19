import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUtil{
  static Future<String?> getFCMToken()async{

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String? token = await messaging.getToken();

    return token;
  }

  static Future<void> deleteFCMToken()async{

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    return messaging.deleteToken();
  }
}