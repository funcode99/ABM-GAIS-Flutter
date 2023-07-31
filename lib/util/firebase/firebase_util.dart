import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUtil{
  static Future<String?> getFCMToken()async{

    FirebaseMessaging messaging = FirebaseMessaging.instance;

    String? token = await messaging.getToken();

    return token;
  }
}