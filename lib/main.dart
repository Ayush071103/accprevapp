import 'package:flutter/material.dart';
import 'package:accprevapp/User/onboarding.dart';
import 'package:accprevapp/User/splashscreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF032737),
        primarySwatch: Colors.blue,
      ),
      home: splashscreen(),
    );
  }
}