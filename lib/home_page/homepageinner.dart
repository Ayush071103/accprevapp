import 'package:flutter/material.dart';

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
      body: Card(
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
                      "RATING",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                    ),
                    Row(
                      children: [
                        Text(
                          "4.5",
                        ),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star_half),
                      ],
                    )
                  ],
                ),
              ]),
        ),
      )
    );
  }

}