import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'story_pages/stories.dart';


class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  List<String> storyPages = [];

  List<String> _storiesCount = ["Story 1"];

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
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:  Image(
                image: AssetImage("asset/Levels.png"),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                width: MediaQuery.of(context).size.height*0.3,
                top: MediaQuery.of(context).size.width * 0.10 ,
                child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: <Widget>[
                        FlatButton(color: Colors.transparent,onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Stories()));
                        },),
                        SizedBox(height: 5,),
                  Text("Growing Up!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Dancing Script"),)
                      ],
                    ))
            ),
        ]
      )
      ),
    );
  }
}
