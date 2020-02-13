import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/size_config.dart';
import 'story_pages/stories.dart';


class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  List<String> storyPages = [];
  MediaQueryData queryData;
  List<String> _storiesCount = ["Story 1"];

  @override
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
    queryData = MediaQuery.of(context);
    double devicePixelRatio = queryData.devicePixelRatio;
    return AspectRatio(
      aspectRatio: 3/5,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:  Image(
                  image: AssetImage("asset/Levels.png"),
                  fit: BoxFit.fill,
                ),
              ),

              Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),

              ),

              Container(
                  margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.01, MediaQuery.of(context).size.width*0.1, 0,MediaQuery.of(context).size.width*0.30),
                  height: SizeConfig.blockSizeVertical * 40,
                  width: SizeConfig.blockSizeHorizontal * 20,
                  child: Column(
                    children: <Widget>[
                      FlatButton(color: Colors.transparent,
                        child: Image.asset("asset/level.PNG",width: MediaQuery.of(context).size.width*0.15,height: MediaQuery.of(context).size.height*0.15,),
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Stories()));
                      },),
                      SizedBox(height: 5,),
                Text("Growing Up!",style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal+10,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Dancing Script"),
                )
                    ],
                  )
              ),
          ]
        )
        ),
      ),
    );
  }
}
