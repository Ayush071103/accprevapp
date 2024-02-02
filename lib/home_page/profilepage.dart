import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profilepagestate();
  }



}
class profilepagestate extends State<Profilepage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Your Profile"),),
    );
  }

}