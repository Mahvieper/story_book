import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_8.dart';

class StoryPage7 extends StatefulWidget {
  @override
  _StoryPage7State createState() => _StoryPage7State();
}

class _StoryPage7State extends State<StoryPage7> {
  String imageAsset= "asset/STORY_PAGE_7.png";//="asset/Story_Page_1.png";
  String _narrator = "Ibrahim is about to catch Malaak when she runs to daddy, and hides behind him. ";
  List<String> _narratorList = ["Ibrahim is about to catch Malaak when she runs to daddy, and hides behind him."];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.popUntil(context, ModalRoute.withName('/homePage'));
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage8()));
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
