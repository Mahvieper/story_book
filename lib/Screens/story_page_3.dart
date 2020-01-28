import 'package:flutter/material.dart';

class StoryPage3 extends StatefulWidget {
  @override
  _StoryPage3State createState() => _StoryPage3State();
}

class _StoryPage3State extends State<StoryPage3> {
  String imageAsset= "asset/STORY_PAGE_3.png";//="asset/Story_Page_1.png";
  String _narrator = "BABA ABOOD Says : Why does my daughter want to grow up so fast?";
  List<String> _narratorList = ["Malaak : Because I want to cook yummy food like mummy does."];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if(index <= _narratorList.length)
              _narrator = _narratorList[index % _narratorList.length];
              index++;
            });
          },
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage3()));
            }else {
              Navigator.pop(context);
            }
          },

          child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 900,
                    child: Image(
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
    );
  }
}
