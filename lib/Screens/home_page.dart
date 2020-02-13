import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_selection.dart';
import 'package:story_book/size_config.dart';

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
                    image: AssetImage("asset/DashBoard.png"),
                    fit: BoxFit.fill,
                  )),
            ),

            Center(
              //Invisible Flat Button for Start Call
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50,),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    child: FlatButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                        Navigator.pushNamed(context, '/StorySelection');
                      },
                      color: Colors.transparent,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: FlatButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                        Navigator.pushNamed(context, '/about_us');
                      },
                      color: Colors.transparent,
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
