import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:gais/binding/global_binding.dart';
import 'package:flutter/material.dart';
import 'package:gais/config/env.dart';
import 'package:gais/gais.dart';

void main() {
  FlavorConfig(
      name: "STG",
      color: Colors.green,
      location: BannerLocation.topEnd,
      variables: stgEnvironment
  );

  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();
  runApp(const Gais());

}
