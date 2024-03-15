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
            Card(
              color: Color(0xff08364B),
              margin: EdgeInsets.only(left: 50,top: 16,bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),)
              ),
              elevation: 8,
              child:InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmokePage()),
                  );
                },
                child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("SMOKE SENSOR",style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            Card(
              color:Color(0xff08364B),
              margin: EdgeInsets.only(right:50,top: 16,bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),)
              ),
              elevation: 8,
              child:InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlamePage()),
                  );
                },
                child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("FLAME SENSOR",style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
            ),
            Card(
              color:Color(0xff08364B),
              margin: EdgeInsets.only(left: 50,top: 16,bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),)
              ),
              elevation: 8,
              child:InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TempraturePage()),
                  );
                },
                child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("TEMPRATURE SENSOR",style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            Card(
              color:Color(0xff08364B),
              margin: EdgeInsets.only(right:50,top: 16,bottom: 16),
              shape: RoundedRectangleBorder(
                  borderRadius:  BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),)
              ),
              elevation: 8,
              child:InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MQ4Page()),
                  );
                },
                child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("CNG GAS SENSOR",style: TextStyle(color: Colors.white, fontSize: 20))),
              ),
            ),
            SizedBox(height: 42),
          ],
        ),
      ),
    );
  }

}