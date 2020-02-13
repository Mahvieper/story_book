import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_7.dart';
import 'package:story_book/Screens/story_pages/story_page_9.dart';
import 'package:story_book/size_config.dart';

class StoryPage8 extends StatefulWidget {
  @override
  _StoryPage8State createState() => _StoryPage8State();
}

class _StoryPage8State extends State<StoryPage8> {
  String imageAsset= "asset/STORY_PAGE_8.png";//="asset/Story_Page_1.png";
  String _narrator = "Lana is so desperate to grow up. She loves watching her mummy, and wants to be just like her mummy. But no one seems to understand.";
  List<String> _narratorList = ["Lana Says : Everyone… daddy, mummy, Ibrahim just don’t understand."];
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage9()));
                index++;
              });
            },
           /* onPanUpdate: (details) {
              if (details.delta.dx < 0) {

                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage9()));
              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage7()));
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
