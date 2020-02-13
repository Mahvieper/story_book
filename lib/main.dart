import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/about_us.dart';
import 'package:story_book/Screens/home_page.dart';
import 'Screens/splash_screen.dart';
import 'Screens/story_pages/stories.dart';
import 'Screens/story_selection.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/homePage': (BuildContext context) => new HomePage(),
        '/StorySelection': (BuildContext context) => new StoryPage(),
        '/about_us': (BuildContext context) => new AboutUs(),
        //'/dashboardscreen': (BuildContext context) => new DashboardScreen()
      },
      home: SplashScreen(),
    );
  }
}
