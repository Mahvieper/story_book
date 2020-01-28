import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(Duration(seconds: 15), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())) );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
         // Image.asset("asset/splashPage.gif")
          Container(
              height: 900,
              child: Image(
                image: AssetImage("asset/SplashScreen.png"),
                fit: BoxFit.fill,
              )),
              //Image.asset("asset/splashPage.gif"))
        ],
      ),
    );

  }
}
