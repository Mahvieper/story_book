import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'file:///C:/Workspace/brew_crew/story_book/lib/Screens/story_pages/stories.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  List<String> storyPages = [];

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

    return Scaffold(
       /* title: Text("Story School",style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Color.fromRGBO(230, 99, 80, 100)),*/

   /*   drawer: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                Image.asset("asset/story_school_drawer.jpg"),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text('Story 1',style: TextStyle(color: Colors.orange,fontSize: 20),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),*/
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
            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.width * 0.12 ,
                child: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: FlatButton(color: Colors.transparent,onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Stories()));
                    },))
            ),

            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.width * 0.16 ,
              child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text("Growing Up!",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: "Dancing Script"),))
        )


        /*ListView.builder(
          itemCount: _storiesCount.length,
            itemBuilder: (context,index) {
              return InkWell(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Stories()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    child: Card(
                      color: Color.fromRGBO(230, 99, 80, 100),
                      elevation: 2.0,
                      child: ListTile(
                        leading: FlutterLogo(),
                        title: Text(_storiesCount[index],style: TextStyle(color: Colors.white),),
                      ),
                    ),
                  ),
                ),
              );
            })*/
        ]
      )
      ),
    );
  }
}
