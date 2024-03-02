import 'package:accprevapp/User/home_page/sensors/MQ4GAS_sensor.dart';
import 'package:accprevapp/User/home_page/sensors/Temperature_sensor.dart';
import 'package:accprevapp/User/home_page/sensors/flame_sensor.dart';
import 'package:accprevapp/User/home_page/sensors/smoke_sensor.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class homepageinner extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return homepageinnerstate();
  }

}
class homepageinnerstate extends State<homepageinner>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),),
      body: Column(
        children: [GestureDetector(
          onTap:  () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => flamesensor()),);},
          child:
          Container(
            width: double.infinity,
            child: Card(
              elevation: 10.0,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/flame.json',height: 100, width: 100,),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Flame Sensor',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                    ]),

              ),
            ),
          ),),GestureDetector(
          onTap:  () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => mq4gas_sensor()),);},
          child:
          Container(
            width: double.infinity,
            child:Card(
              elevation: 10.0,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/flame.json',height: 100, width: 100,),//Image.network(src)
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '	MQ4GAS Sensor',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),

                    ]),

              ),
            ),),),
          GestureDetector(
            onTap:  () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => smoke_sensor()),);},child:
          Container(
            width: double.infinity,
            child:Card(
              elevation: 10.0,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/flame.json',height: 100, width: 100,),//Image.network(src)
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Smoke Sensor',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      ),
                      SizedBox(
                        height: 8,
                      ),


                    ]),

              ),
            ),),),
    GestureDetector(
    onTap:  () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => temperature_sensor()),);},child:
    Container(
    width: double.infinity,
    child:Card(
    elevation: 10.0,
    shadowColor: Colors.green,
    margin: EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(10.0),
    topRight: Radius.circular(10.0),
    bottomLeft: Radius.circular(10.0),
    bottomRight: Radius.circular(10.0),
    )),
    child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    Lottie.asset('assets/flame.json',height: 100, width: 100,),//Image.network(src)
    SizedBox(
    height: 8,
    ),
    Text(
    'Smoke Sensor',
    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
    ),
    SizedBox(
    height: 8,
    ),


    ]),

    ),
    ),),),

  ]),
    );
  }

}