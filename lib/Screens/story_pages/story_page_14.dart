import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_pages/story_page_13.dart';
import 'package:story_book/Screens/story_pages/story_page_15.dart';
import 'package:story_book/size_config.dart';

class StoryPage14 extends StatefulWidget {
  @override
  _StoryPage14State createState() => _StoryPage14State();
}

class _StoryPage14State extends State<StoryPage14> {
  String imageAsset= "asset/STORY_PAGE_14.png";//="asset/Story_Page_1.png";
  String _narrator = "In the morning, she tells her dream to everyone. Everyone start laughing.";
  List<String> _narratorList = ["BABA ABOOD Says : Now you see, how horrible it is to be grown up when it’s not the right time. Right now, is your time to play, and have fun. Everything is good when happens on time.",
    "Mummy Says : Always look at the brighter side of what you have got."];
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage15()));
                index++;
              });
            },
         /*   onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage15()));

              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage13()));
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
