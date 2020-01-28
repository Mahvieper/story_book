import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_selection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  height: 900,
                  child: Image(
                    image: AssetImage("asset/homePage.png"),
                    fit: BoxFit.fill,
                  )),
            ),

            Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                },
                color: Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
