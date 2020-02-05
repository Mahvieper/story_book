import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_6.dart';
import 'package:story_book/Screens/story_pages/story_page_8.dart';
import 'package:story_book/size_config.dart';

class StoryPage7 extends StatefulWidget {
  @override
  _StoryPage7State createState() => _StoryPage7State();
}

class _StoryPage7State extends State<StoryPage7> {
  String imageAsset= "asset/STORY_PAGE_7.png";//="asset/Story_Page_1.png";
  String _narrator = "Ibrahim is about to catch Malaak when she runs to daddy, and hides behind him. ";
  List<String> _narratorList = ["Ibrahim is about to catch Malaak when she runs to daddy, and hides behind him."];
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage8()));
                index++;
              });
            },
           /* onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage8()));
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage6()));
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
                          child: Text(_narrator,style: TextStyle(fontSize:  SizeConfig.safeBlockHorizontal+8,color: Colors.black),)),
                    ),

                  ],
                )),
          ),
        ),
      ),
    );
  }
}
