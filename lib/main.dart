import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kamus3bahasa/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Kamus 3 Bahasa',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const Splash());
  }
}
