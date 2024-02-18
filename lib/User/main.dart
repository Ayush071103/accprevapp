import 'package:flutter/material.dart';
import 'package:accprevapp/User/onboarding.dart';
import 'package:accprevapp/User/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}