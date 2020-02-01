import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_3.dart';
import 'package:story_book/Screens/story_pages/story_page_5.dart';

class StoryPage4 extends StatefulWidget {
  @override
  _StoryPage4State createState() => _StoryPage4State();
}

class _StoryPage4State extends State<StoryPage4> {
  String imageAsset= "asset/STORY_PAGE_4.png";//="asset/Story_Page_1.png";
  String _narrator = "BABA ABOOD Says : That is so sweet of you if you want to cook food, but my dear, you don’t need to be all grown up to help your mummy.For now, you can help your mummy in other things, like washing vegetables.";
  List<String> _narratorList = ["Malaak : I don’t want to just wash vegetables!"];
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage5()));
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage3()));
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
