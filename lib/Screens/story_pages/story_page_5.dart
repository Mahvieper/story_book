import 'package:flutter/material.dart';
import 'package:story_book/Screens/story_pages/story_page_6.dart';

class StoryPage5 extends StatefulWidget {
  Image myImageGet;

  StoryPage5(this.myImageGet);
  @override
  _StoryPage5State createState() => _StoryPage5State();
}

class _StoryPage5State extends State<StoryPage5> {
  String imageAsset= "asset/STORY_PAGE_5.png";//="asset/Story_Page_1.png";
  String _narrator = "BABA ABOOD Says (laughing) : My dear, you will grow up slowly but surely. Right now, is the time for you to play and enjoy your life.";
  List<String> _narratorList = ["Malaak (almost shrieking) : But… but daddy I want to grow up now."];
  int index = 0;
  Image myImage;

  void initState() {
    // TODO: implement initState
    super.initState();
    myImage= Image.asset("asset/STORY_PAGE_6.png");
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage6(myImage)));
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
