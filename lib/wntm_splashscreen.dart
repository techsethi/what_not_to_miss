import 'package:flutter/material.dart';
import 'dart:async';
import 'package:what_not_to_miss/home.dart';


class WNTMSplashScreen extends StatefulWidget {
  @override
  _WNTMSplashScreenState createState() => _WNTMSplashScreenState();
}

class _WNTMSplashScreenState extends State<WNTMSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), ()=> moveToHome() );
  }

  void moveToHome() {
Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Home(),
      ),
    );    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: 
            BoxDecoration(color: Colors.blueAccent),
            
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.restaurant,
                          color: Colors.redAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "What not to Miss !",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            fontSize: 28.0),
                      )
                    ],
                  ))),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Food you shouldn't miss in the city!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
