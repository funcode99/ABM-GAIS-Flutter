import 'package:firebase_core/firebase_core.dart';
import 'package:gais/firebase_options.dart';

class FirebaseConfig{

  static Future<void> init()async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

}