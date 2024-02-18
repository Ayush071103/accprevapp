import 'dart:async';

import 'package:accprevapp/User/home_page/Profile_page/edit_address.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_email.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_image.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_name.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_phone.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:accprevapp/User/home_page/Profile_page/user_data.dart';
import '../widgets/display_image_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    return Scaffold(
      appBar: AppBar(title: Text("My Profile"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16,top: 5),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Profile Image.png"),
                    radius: 74,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 7,
                  child: SizedBox(
                    height: 46,
                    width: 46,
                    child: FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(color: Colors.white),
                      ),

                      onPressed: (){Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => edit_image())
                      );
                      },

                      child: Icon(Icons.camera_alt_sharp, size: 25,),

                  ),
                ),

                )],
            ),
            SizedBox(
              height: 25,
            ),

            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => edit_name()));
              },

              title: Text("Name"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.edit),
              subtitle: Text(""),
            ),

            Divider(height: 7,),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>edit_email()));
              },
              title: Text("Email"),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.edit),
              subtitle: Text(""),

            ),
            Divider(height: 7),
             ListTile(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder:(context) =>edit_phone()));
               },
             title: Text("Phone"),
              leading: Icon(Icons.phone),
              trailing: Icon(Icons.edit),
               subtitle:Text("") ,
             ),
            Divider(height: 7),
            ListTile(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>edit_address()));
              },
              title: Text("Address"),
              leading: Icon(Icons.house),
              trailing: Icon(Icons.edit),
              subtitle:Text("") ,
            ),


      ])
        ),

    );
  }
}


