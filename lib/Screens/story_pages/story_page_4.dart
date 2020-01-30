import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_5.dart';

class StoryPage4 extends StatefulWidget {
  Image myImageGet;

  StoryPage4(this.myImageGet);

  @override
  _StoryPage4State createState() => _StoryPage4State();
}

class _StoryPage4State extends State<StoryPage4> {
  String imageAsset= "asset/STORY_PAGE_4.png";//="asset/Story_Page_1.png";
  String _narrator = "BABA ABOOD Says : That is so sweet of you if you want to cook food, but my dear, you don’t need to be all grown up to help your mummy.For now, you can help your mummy in other things, like washing vegetables.";
  List<String> _narratorList = ["Malaak : I don’t want to just wash vegetables!"];
  int index = 0;
  Image myImage;

  void initState() {
    // TODO: implement initState
    super.initState();
    myImage= Image.asset("asset/STORY_PAGE_5.png");
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage5(myImage)));
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
