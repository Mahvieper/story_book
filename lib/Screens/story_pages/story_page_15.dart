import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_14.dart';
import 'package:story_book/size_config.dart';

class StoryPage15 extends StatefulWidget {
  @override
  _StoryPage15State createState() => _StoryPage15State();
}

class _StoryPage15State extends State<StoryPage15> {
  String imageAsset= "asset/STORY_PAGE_15.png";//="asset/Story_Page_1.png";
  String _narrator = "Lana listens to her daddy and mummy. She finally understands.";
  List<String> _narratorList = ["She gives her daddy and mummy a big hug, and runs outside to the back garden to play ball with her brother Ibrahim.(She runs outside with Ibrahim to play and have fun)"];
  int index = 0;
  Image myImage;

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
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, ModalRoute.withName('/StorySelection'));
      },
      child: Scaffold(
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if(index < _narratorList.length)
                  _narrator = _narratorList[index % _narratorList.length];
                else
                  {
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Thank you for Reading"),
                            content: Text("Story Completed"),
                          );
                        }
                    );
                    Timer(Duration(seconds: 1), () =>   Navigator.popUntil(context, ModalRoute.withName('/StorySelection')) );
                    /*showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Thank you for Reading"),
                            content: Text("Story Completed"),
                          );
                        }
                    );*/
                  }
                index++;
              });
            },
           /* onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Thank you for Reading"),
                        content: Text("Story Completed"),
                      );
                    }
                );
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage14()));
              }
            },*/

            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        gaplessPlayback: true,
                        image: AssetImage(imageAsset),
                        fit: BoxFit.fill,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Text(_narrator,style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal+8,color: Colors.black),)),
                    ),

                  ],
                )),
          ),
        ),
      ),
    );
  }
}
