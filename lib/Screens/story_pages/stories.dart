import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_2.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  String imageAsset= "asset/Story_Page_1.png";//="asset/Story_Page_1.png";
  String _narrator = "Daddy has arrived home early from his work. Kids are playing in the sitting room, and mummy is making food in the kitchen.";
  String _babaAbood = "BABA ABOOD Says : Can someone please bring me a glass of water?";

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
    return  Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) { // For Right Swipe Direction
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage2()));
            }else {

            }
          },

          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image(
                      image: AssetImage(imageAsset),
                      fit: BoxFit.fill,
                    ),
                  ),

                  Align(
                    alignment: Alignment.topCenter,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white
                          ),
                          child: Text(_narrator,style: TextStyle(fontSize: 18,color: Colors.black),))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Text(_babaAbood,style: TextStyle(fontSize: 18,color: Colors.black),)))
                ],
              )),
        ),
      ),
    );
  }
}