import 'package:flutter/material.dart';

class Buypage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return buypagestate();
  }



}
class buypagestate extends State<Buypage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Buy Device"),),
    );
  }

}