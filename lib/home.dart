import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homepagestate();
  }

}

class homepagestate extends State<Homepage>{
  int selectedpage = 0 ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(  bottomNavigationBar: ConvexAppBar(
      initialActiveIndex: selectedpage,

      items: [
        TabItem(icon: Icons.people, title: 'Profile', ),
        TabItem(icon: Icons.add_shopping_cart, title: 'Buy'),
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.message, title: 'Message'),

      ],
      onTap: (int index){
        setState(() {
          selectedpage = index;
        });
      },
    ),
    );


  }

}