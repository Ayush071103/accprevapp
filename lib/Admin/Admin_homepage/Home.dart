
import 'package:accprevapp/Admin/Admin_homepage/Admin_homepage.dart';
import 'package:accprevapp/Admin/Admin_homepage/Admin_message.dart';
import 'package:accprevapp/Admin/Admin_homepage/Admin_profilepage.dart';
import 'package:accprevapp/Admin/Admin_homepage/Admin_userrequest.dart';


import 'package:flutter/material.dart';


class admin_Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return admin_homepagestate();
  }

}

class admin_homepagestate extends State<admin_Homepage>{
  int selectedpage =0;
  final _pageNo = [Admin_profilepage(), Admin_userreqest() , Admin_homepage() , Admin_messagepage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageNo[selectedpage],
      drawer: Drawer(

          child: ListView(
            padding: EdgeInsets.zero,
            children:[
          DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            ' Admin Page',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update UI based on item 1
            Navigator.pop(context); // Close the drawer
          },
        ),

    ])

    ));
  }


}

