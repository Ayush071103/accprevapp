import 'package:flutter/material.dart';
import 'package:accprevapp/Admin/Admin_homepage/Admin_homepage.dart';

class Admin_userreqest extends StatefulWidget {
  const Admin_userreqest({super.key});

  @override
  State<Admin_userreqest> createState() => Admin_userreqestState();
}

class Admin_userreqestState extends State<Admin_userreqest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ListView.builder(
        itemCount:4,
        itemBuilder: (context, index) {
          return
            Card(elevation: 9.0,
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

                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'User name : margi',

                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'email :margi2074@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Phone: 8128520209',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ]
              ),

            ),);
        }


        ),],),
    );
  }
}

