import 'package:flutter/material.dart';

class Messagepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return messagepagestate();
  }



}
class messagepagestate extends State<Messagepage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("No Messages"),),
    );
  }

}