import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_11.dart';
import 'package:story_book/Screens/story_pages/story_page_13.dart';
import 'package:story_book/size_config.dart';

class StoryPage12 extends StatefulWidget {
  @override
  _StoryPage12State createState() => _StoryPage12State();
}

class _StoryPage12State extends State<StoryPage12> {
  String imageAsset= "asset/STORY_PAGE_12.png";//="asset/Story_Page_1.png";
  String _narrator = "Her friends, and family are so scared of her. They do not want Malaak to come close.";
  List<String> _narratorList = ["Dad Character Says : Mummy... mummy… Ibrahim... daddy...please come here, please come back. I am not a monster."
    ,"But no one comes back, everyone stays away from her.","Malaak says : Come back! Come back!"];
  int index = 0;
  Image myImage;

  void initState() {
    // TODO: implement initState
    super.initState();

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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage13()));

                index++;
              });
            },
          /*  onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage13()));

              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage11()));
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
