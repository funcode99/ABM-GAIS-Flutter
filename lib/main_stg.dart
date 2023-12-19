import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/binding/global_binding.dart';
import 'package:gais/config/env.dart';
import 'package:gais/config/firebase_config.dart';
import 'package:gais/data/network_core.dart';
import 'package:gais/gais.dart';

void main() async{
  FlavorConfig(
      name: "STG",
      color: Colors.green,
      location: BannerLocation.topEnd,
      variables: stgEnvironment
  );

  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();

  await FirebaseConfig.init();

  HttpOverrides.global = MyHttpOverrides();
  runApp(const Gais());

}
