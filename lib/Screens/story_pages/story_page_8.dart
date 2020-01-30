import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_9.dart';

class StoryPage8 extends StatefulWidget {
  Image myImageGet;

  StoryPage8(this.myImageGet);
  @override
  _StoryPage8State createState() => _StoryPage8State();
}

class _StoryPage8State extends State<StoryPage8> {
  String imageAsset= "asset/STORY_PAGE_8.png";//="asset/Story_Page_1.png";
  String _narrator = "Malaak is so desperate to grow up. She loves watching her mummy, and wants to be just like her mummy. But no one seems to understand.";
  List<String> _narratorList = ["Malaak Says : Everyone… daddy, mummy, Ibrahim just don’t understand."];
  int index = 0;
  Image myImage;

  void initState() {
    // TODO: implement initState
    super.initState();
    myImage= Image.asset("asset/STORY_PAGE_9.png");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
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
                index++;
              });
            },
            onPanUpdate: (details) {
              if (details.delta.dx < 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage9(myImage)));
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
                        gaplessPlayback: true,
                        image: widget.myImageGet.image,
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
