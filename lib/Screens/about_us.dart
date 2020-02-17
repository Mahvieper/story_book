import 'package:flutter/material.dart';
import 'package:story_book/size_config.dart';

class AboutUs extends StatelessWidget {
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
                    image: AssetImage("asset/AboutUs.png"),
                    fit: BoxFit.fill,
                  )),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back,color: Colors.white,size: SizeConfig.safeBlockHorizontal*5,))),
            ),

            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(40, 0, 250, 0),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: Text("Welcome to the New World of Baba Abood! A safe and wholesome place for your kids to learn Islamic concepts. "
                        "Every month we will be adding new stories. For more information, or to get involved kindly email: info@babaabood.com"
                      ,style: TextStyle(fontSize: SizeConfig.safeBlockHorizontal+12,color: Colors.black87,fontWeight: FontWeight.bold),)))
          ],

        ),
      ),
    );
  }
}
