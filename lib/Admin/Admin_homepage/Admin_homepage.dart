import 'package:flutter/material.dart';
class Admin_homepage extends StatefulWidget {
  const Admin_homepage({super.key});

  @override
  State<Admin_homepage> createState() => _Admin_homepageState();
}

class _Admin_homepageState extends State<Admin_homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HOME PAGE"),

      ),body:  Center(child: Text("Fourth Page Code")),
      drawer: Drawer(
      child: Column(children:[
      ListTile(title:Text("ADMIN PAGE", style: TextStyle(fontSize: 20),)),
        ListTile(title:Text("Manage Users"),leading: Icon(Icons.people),
      ),ListTile(title:Text("Manage Devices"), leading: Icon(Icons.device_hub),),
        ListTile(title:Text("Complaints & Feedback"), leading: Icon(Icons.mail),),
        ListTile(title:Text("Profile"), leading: Icon(Icons.person),),

      ]
      )
      )
    );
  }
}
