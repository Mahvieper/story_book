import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //To Set the Screen Orientation to Landscape.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]); // To Hide the Status Bar
    //Timer(Duration(seconds: 10), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())) );
    Timer(Duration(seconds: 10), () => Navigator.pushReplacementNamed(context, '/homePage') );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage("asset/SplashScreen.png"),
                fit: BoxFit.fill,
              )),
        ],
      ),
    );
  }
}
