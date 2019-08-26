
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_not_to_miss/home.dart';
import 'package:splashscreen/splashscreen.dart';
 
class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => new _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new Home(),
      title: new Text('What Not to Miss ! v0.3',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30.0
      ),),
      image: new Image.asset('images/street-food-india-medium.jpg', fit: BoxFit.fitWidth ),       
      //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200.0,
      onClick: ()=>print("Clicked on Splash Screen"),
      loaderColor: Colors.red
    );
  }
}