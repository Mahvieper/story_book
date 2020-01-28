import 'package:flutter/material.dart';

import 'Screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness:     Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
