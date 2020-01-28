import 'package:flutter/material.dart';
import 'package:story_book/Screens/stories.dart';

class StoryPage extends StatelessWidget {
  List<String> storyPages = [];
  List<String> _storiesCount = ["Story 1"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Story School",style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: new IconThemeData(color: Color.fromRGBO(230, 99, 80, 100)),
      ),
      drawer: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
          child: Drawer(
            child: ListView(
              children: <Widget>[
                Image.asset("asset/story_school_drawer.jpg"),
                ListTile(
                  title: Text('Story 1',style: TextStyle(color: Colors.orange),),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => StoryPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
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
            })
      ),
    );
  }
}
