import 'package:flutter/material.dart';
import 'package:clock_challenge/pages/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.black87,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        accentColor: Colors.white70,
      ),
    );
  }
}
