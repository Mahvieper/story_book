import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_12.dart';
import 'package:story_book/Screens/story_pages/story_page_14.dart';

class StoryPage13 extends StatefulWidget {
  @override
  _StoryPage13State createState() => _StoryPage13State();
}

class _StoryPage13State extends State<StoryPage13> {
  String imageAsset= "asset/STORY_PAGE_13.png";//="asset/Story_Page_1.png";
  String _narrator = "Her dream was terrible.";
  List<String> _narratorList = ["Her dream was terrible."];
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
                else
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage14()));
                index++;
              });
            },
       /*     onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage14()));

              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage12()));
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
