import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setPathUrlStrategy();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}
