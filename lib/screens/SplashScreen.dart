import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nisipet/screens/login_screen.dart';

class SplashScreen extends StatefulWidget{
  SplashScreen();

  @override
  State<StatefulWidget> createState() => InitState();

}

class InitState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  Widget initWidget(){
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          //width: double.infinity,
          //height: double.infinity,
          /*decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin:  Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF000000),
                    Color(0xFF000000)
                  ]
              )
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MyImage(),
                    Text('Nisi Pet',
                      style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFffb247),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(height: 5,),
                    Text('Save All The Pets',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 30,
                        color: Color(0xFFffb247),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
  void NavigatorToLogin() {
    Timer(Duration(seconds: 5),()=> Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen())
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NavigatorToLogin();
  }
}

class MyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage image = new AssetImage("assets/images/SplashScreen.png");
    Image logo = new Image(image: image,width: 300,height: 200,);
    return logo;
  }
}
