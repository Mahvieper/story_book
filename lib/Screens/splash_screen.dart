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
    Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())) );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
         // Image.asset("asset/splashPage.gif")
          Container(
              height: 700,
              child: Image(
                image: AssetImage("asset/splashPage.png"),
                fit: BoxFit.fill,
              )),
              //Image.asset("asset/splashPage.gif"))
        ],
      ),
    );

  }
}
