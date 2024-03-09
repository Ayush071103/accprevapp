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
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor ,
        title: Text('DashBoard'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        shadowColor: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: <Widget>[
          SizedBox(width: 20,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              GestureDetector(
                onTap:  () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FlamePage()),
                  );},
                child:
                Container(
                  width: double.infinity,
                  child: Card(
                    elevation: 9.0,
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(10.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                          bottomLeft: Radius.circular(9.0),
                          bottomRight: Radius.circular(9.0),
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

                          ]
                      ),

                    ),
                  ),
                ),)
              ,GestureDetector(
                onTap:  () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MQ4Page()),);},
                child:
                Container(
                  width: double.infinity,
                  child:Card(
                    elevation: 10.0,
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(9.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                          bottomLeft: Radius.circular(9.0),
                          bottomRight: Radius.circular(9.0),
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
                  ),),
              ),
              GestureDetector(
                onTap:  () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SmokePage()),);},
                child:
                Container(
                  width: double.infinity,
                  child:Card(
                    elevation: 10.0,
                    shadowColor: Colors.green,
                    margin: EdgeInsets.all(9.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(9.0),
                          topRight: Radius.circular(9.0),
                          bottomLeft: Radius.circular(9.0),
                          bottomRight: Radius.circular(9.0),
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
                    MaterialPageRoute(builder: (context) => TempraturePage()),);},child:
              Container(
                width: double.infinity,
                child:Card(
                  elevation: 9.0,
                  shadowColor: Colors.green,
                  margin: EdgeInsets.all(9.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(9.0),
                        topRight: Radius.circular(9.0),
                        bottomLeft: Radius.circular(9.0),
                        bottomRight: Radius.circular(9.0),
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
                            'Temprature Sensor',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),


                        ]),

                  ),
                ),),),
              SizedBox(height: 42,),
            ]),
      ),
    );
  }

}