import 'dart:async';
import 'package:accprevapp/User/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
  theme:
  ThemeData(primaryColor: Color(0xFF08364B)),
  debugShowCheckedModeBanner: false,
  home: splashscreen(),
));

class splashscreen extends StatefulWidget {
  @override
  _splashscreenstate createState() => _splashscreenstate();
}

class _splashscreenstate extends State<splashscreen> with SingleTickerProviderStateMixin{
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, checkFirstSeen);
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString('id') != null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => onboarding()), (Route<dynamic> route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (BuildContext context) => onboarding()), (
          Route<dynamic> route) => false);
    }
  }

  @override
  void initState(){
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 5));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(24),
                child:Lottie.asset("assets/Animation - 1706849204338.json",repeat: false) ,),
              Text('Accident Prevention App ',
                style: TextStyle(
                    color: Color(0xFF032737),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}