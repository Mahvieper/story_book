import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:story_book/Screens/story_selection.dart';
import 'package:story_book/size_config.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double heightSized;
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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    image: AssetImage("asset/DashBoard.png"),
                    fit: BoxFit.fill,
                  )),
            ),

            Center(
              //Invisible Flat Button for Start Call
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: SizeConfig.safeBlockHorizontal *10,),
                  Container(
                    margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal*10),
                    child: ButtonTheme(
                      minWidth: SizeConfig.blockSizeHorizontal * 20.0,
                      height: SizeConfig.blockSizeHorizontal * 7.0,
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                          Navigator.pushNamed(context, '/StorySelection');
                        },
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  SizedBox(height: SizeConfig.safeBlockVertical * 2,),
                  Container(
                    margin: EdgeInsets.only(right: SizeConfig.safeBlockHorizontal * 10),
                    child: ButtonTheme(
                      minWidth: SizeConfig.blockSizeHorizontal * 20.0,
                      height: SizeConfig.blockSizeHorizontal * 7.0,
                      child: FlatButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                          Navigator.pushNamed(context, '/about_us');
                        },
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
