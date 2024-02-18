
import 'package:accprevapp/Admin/Admin_homepage/Admin_profilepage.dart';
import 'package:accprevapp/User/home_page/buy.dart';
import 'package:accprevapp/User/home_page/message.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:accprevapp/User/home_page/homepageinner.dart';
import 'package:accprevapp/User/home_page/Profile_page/profilepage.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homepagestate();
  }

}

class homepagestate extends State<Homepage>{
  int selectedpage =0;
  final _pageNo = [Admin_profilepage(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(icon: Icons.person, title: 'Profile'),
          TabItem(icon: Icons.request_page, title:'User request'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.message, title: 'Message'),
        ],
        initialActiveIndex: selectedpage,
        onTap: (int index){
          setState(() {
            selectedpage = index;
          });
        },
      ),
    );
  }


}

