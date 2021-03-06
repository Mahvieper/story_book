import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens//story_pages/story_page_3.dart';
import 'package:story_book/Screens/story_pages/stories.dart';
import 'package:story_book/size_config.dart';

class StoryPage2 extends StatefulWidget {


  @override
  _StoryPage2State createState() => _StoryPage2State();
}

class _StoryPage2State extends State<StoryPage2> {
  String imageAsset= "asset/STORY_PAGE_2.png";//="asset/Story_Page_1.png";
  String _narrator = "Lana brings her daddy a glass of water";
  List<String> _narratorList = ["Lana : Here you go daddy.","BABA ABOOD : Thanks a lot, my little darling daughter.",
    "Lana: Daddy!","BABA ABOOD : Yes Lana","Lana : I want to grow up fast!"];
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
    return  WillPopScope(
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage3()));
                    index++;
                });

            },

          /*  onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => StoryPage3()));

              }else {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Stories()));
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
