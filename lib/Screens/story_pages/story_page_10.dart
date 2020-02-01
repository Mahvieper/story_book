import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_11.dart';
import 'package:story_book/Screens/story_pages/story_page_9.dart';
class StoryPage10 extends StatefulWidget {
  @override
  _StoryPage10State createState() => _StoryPage10State();
}

class _StoryPage10State extends State<StoryPage10> {
  String imageAsset= "asset/STORY_PAGE_10.png";//="asset/Story_Page_1.png";
  String _narrator = "Malaak Says (thinking) : No one understands me. I am going to wait to grow up.";
  List<String> _narratorList = ["As she waits, she falls asleep in her room"];
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage11()));
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage9()));
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
