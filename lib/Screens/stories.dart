import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  String imageAsset="asset/Story_Page_1.png";
  List<String> storyPages = ["asset/homePage.png","asset/splashPage.png","asset/Story_Page_1.png"];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            setState(() {
              imageAsset = storyPages[index];
              index++;
            });
          }else {
            setState(() {
              if(index != 0)
              index--;
              imageAsset = storyPages[index];
            });
          }
        },

        child: Container(
            height: 700,
            child: Image(
              image: AssetImage(imageAsset),
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
