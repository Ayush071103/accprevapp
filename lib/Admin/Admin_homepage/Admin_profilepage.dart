import 'package:flutter/material.dart';
class Admin_profilepage extends StatefulWidget {
  const Admin_profilepage({super.key});

  @override
  State<Admin_profilepage> createState() => Admin_profilepageState();
}

class Admin_profilepageState extends State<Admin_profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("My Profile"),
    ),
       body: SingleChildScrollView(
         child: Column(
           children: [
             Stack(alignment: Alignment.center,
             children: [
               Padding(padding: EdgeInsets.only(bottom:16,top: 5),
                 child: CircleAvatar(backgroundImage: AssetImage(""),radius: 74,),
               ),


             ],),
             SizedBox(height: 25,),

             ListTile(title: Text("Name"),
             leading: Icon(Icons.person),
             subtitle: Text(""),),

             Divider(height: 7,),

             ListTile(title: Text("Email"),
               leading: Icon(Icons.email),
               subtitle: Text(""),),

             Divider(height: 7,),

             ListTile(title: Text("Phone"),
               leading: Icon(Icons.phone),
               subtitle: Text(""),),

            
           ],
         ),
       ),);
  }
}
