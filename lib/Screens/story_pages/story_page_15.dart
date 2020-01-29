import 'package:flutter/material.dart';

class StoryPage15 extends StatefulWidget {
  @override
  _StoryPage15State createState() => _StoryPage15State();
}

class _StoryPage15State extends State<StoryPage15> {
  String imageAsset= "asset/STORY_PAGE_15.png";//="asset/Story_Page_1.png";
  String _narrator = "Malaak listens to her daddy and mummy. She finally understands.";
  List<String> _narratorList = ["She gives her daddy and mummy a big hug, and runs to her room to have fun, and play with her brother Ibrahim.(She runs outside with Ibrahim to play and have fun)"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
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
                index++;
              });
            },
            onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text("Alert Dialog"),
                        content: Text("Story Completed"),
                      );
                    }
                );
              }else {
                Navigator.pop(context);
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
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white
                          ),
                          child: Text(_narrator,style: TextStyle(fontSize: 18,color: Colors.black),)),
                    ),

                  ],
                )),
          ),
        ),
      ),
    );
  }
}
