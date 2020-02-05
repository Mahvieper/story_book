import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_4.dart';
import 'package:story_book/size_config.dart';

import 'story_page_2.dart';

class StoryPage3 extends StatefulWidget {

  @override
  _StoryPage3State createState() => _StoryPage3State();
}

class _StoryPage3State extends State<StoryPage3> {
  String imageAsset= "asset/STORY_PAGE_3.png";//="asset/Story_Page_1.png";
  String _narrator = "BABA ABOOD Says : Why does my daughter want to grow up so fast?";
  List<String> _narratorList = ["Malaak : Because I want to cook yummy food like mummy does."];
  int index = 0;
  Image myImage,myImage2;

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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage4()));
                index++;
              });
            },

           /* onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage4()));

              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage2()));
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
