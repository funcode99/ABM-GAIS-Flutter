import 'package:gais/binding/global_binding.dart';
import 'package:flutter/material.dart';
import 'package:gais/gais.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalBinding().dependencies();
  runApp(const gais());
}
