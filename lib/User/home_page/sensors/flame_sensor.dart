import 'package:flutter/material.dart';

class flamesensor extends StatefulWidget {
  const flamesensor({super.key});

  @override
  State<flamesensor> createState() => _flamesensorState();
}

class _flamesensorState extends State<flamesensor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FLAME SENSOR",style:  TextStyle(fontWeight: FontWeight.bold)),),
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
                      'Flame Sensor',
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
