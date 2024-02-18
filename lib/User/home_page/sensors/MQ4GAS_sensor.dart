import 'package:flutter/material.dart';

class mq4gas_sensor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return mq4gas_sensorstate();
  }

}

class mq4gas_sensorstate extends State<mq4gas_sensor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MQ4GAS SENSOR",style:  TextStyle(fontWeight: FontWeight.bold)),),
      body: Column(
        children: [
          Card(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Image.network(src)
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'MQ4GAS Sensor',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VALUE",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                        ),

                      ],
                    ),
                  ]),

            ),
          )
        ],
      ),
    );
  }
}
