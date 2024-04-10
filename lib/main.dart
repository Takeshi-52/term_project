import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/homepage.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Term Project Mobile Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
          useMaterial3: true,
          //scaffoldBackgroundColor: Color(0xFF0C0F14), //ตั้งสี background
        ),
        home: HomePage());
  }
}
