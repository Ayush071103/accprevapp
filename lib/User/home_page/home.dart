import 'package:accprevapp/User/home_page/Profile_page/profilepage.dart';
import 'package:accprevapp/User/home_page/buy.dart';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:accprevapp/User/home_page/homepageinner.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_profilepage.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    // TODO: implement createState
    return homepagestate();
  }

}

class homepagestate extends State<Homepage>{
  int selectedpage =0;
  final _pageNo = [homepageinner(), ProductPageStandalone() ,  profilepage()  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pageNo[selectedpage],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Color(0xFF032737),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add_shopping_cart, title: 'Buy'),
          TabItem(icon: Icons.person, title: 'Profile'),

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

