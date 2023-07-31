import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/binding/global_binding.dart';
import 'package:gais/config/env.dart';
import 'package:gais/config/firebase_config.dart';
import 'package:gais/gais.dart';

void main() async{
  FlavorConfig(
      name: "PROD",
      location: BannerLocation.topEnd,
      variables: prodEnvironment
  );

  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();

  await FirebaseConfig.init();

  runApp(const Gais());

}
