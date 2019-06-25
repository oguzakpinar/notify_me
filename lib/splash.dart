import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  var _visible = true;
  var allignment = 125;

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
        vsync: this, duration: new Duration(seconds: 5));
    animationEase = new CurvedAnimation(
        parent: animationController, curve: Curves.linearToEaseOut);
    animationEase.addListener(() => this.setState(() {}));
    animationController.forward();
    new Timer(new Duration(seconds: 1), () => allignment = 85);

    setState(() {
      _visible = !_visible;
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new AnimatedContainer(
                duration: new Duration(seconds: 1),
                curve: Curves.easeInOut,
                alignment: Alignment.bottomCenter,
                width: 400,
                height: (MediaQuery.of(context).size.height * 0.5) + allignment,
                child: new Image.asset(
                  'assets/icon/bell.png',
                  width: animationEase.value * 250,
                  height: 250,
                ),
              ),
              new AnimatedContainer(
                duration: new Duration(seconds: 1),
                alignment: Alignment.topCenter,
                curve: Curves.easeInOut,
                width: MediaQuery.of(context).size.width,
                height: 125.0 - allignment,
                child: new Text('Notify Me', style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.w900),),
              )
            ],
          ),
        ],
      ),
    );
  }
}
