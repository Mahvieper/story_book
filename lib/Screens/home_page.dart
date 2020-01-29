import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_selection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage("asset/homePage.png"),
                    fit: BoxFit.fill,
                  )),
            ),

            Center(
              //Invisible Flat Button for Start Call
              child: FlatButton(
                onPressed: () {
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                  Navigator.pushNamed(context, '/StorySelection');
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
