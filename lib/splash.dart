import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var _visible = true;
  var allignment = Alignment.center;
  

  AnimationController animationController;
  Animation<double> animationEase;
  Animation<double> animation2;
  Animation<double> animation3;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).push;
  }

  @override
  void initState() {
    
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    var animationController2 = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animationEase = new CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut);
    animation2 = new CurvedAnimation(
        parent: animationController2, curve: Curves.linearToEaseOut);
    animationEase.addListener(() => this.setState(() {}));
    animationController.forward();
    
    
    setState(() {
      _visible = !_visible;
      allignment = Alignment.topCenter;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new AnimatedContainer(
                duration: new Duration(seconds: 2),
                alignment: allignment,
                curve: Curves.easeInOut,
                width: animationEase.value * 400,
                height: animationEase.value * 400,
                child: new Image.asset(
                  'assets/icon/bell.png',
                  width: 250,
                  height: 250,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
