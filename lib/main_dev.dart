import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/binding/global_binding.dart';
import 'package:flutter/material.dart';
import 'package:gais/config/env.dart';
import 'package:gais/gais.dart';

void main() {
  FlavorConfig(
      name: "DEV",
      color: Colors.red,
      location: BannerLocation.topEnd,
      variables: devEnvironment
  );

  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();
  runApp(const Gais());

}
