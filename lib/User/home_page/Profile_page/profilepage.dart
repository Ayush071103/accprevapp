import 'package:accprevapp/User/home_page/Profile_page/aboutus_page.dart';
import 'package:accprevapp/User/home_page/Profile_page/complaints_page.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_profilepage.dart';
import 'package:accprevapp/User/home_page/Profile_page/feedback_page.dart';
import 'package:flutter/material.dart';

class profilepage extends StatefulWidget {
  const profilepage({super.key});

  @override
  State<profilepage> createState() => _profilepageState();
}

class _profilepageState extends State<profilepage> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("profile page"),),
        body:SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>edit_ProfilePage() ));},
                child: Container(
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight:Radius.circular(10),
                          bottomLeft: Radius.circular(10)),),
                    child: Padding(padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children:
                        [
                          SizedBox(height: 8,),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,),
                          ListTile(
                            title: Text("name"),
                            subtitle: Text(""),),
                          ListTile(
                            title: Text("Email"),
                            subtitle: Text(""),),
                          ListTile(
                            title: Text("Phone"),
                            subtitle: Text(""),),
                        ],

                      ),


                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>complaint_page() ));},
                child:Container(
                  width: 500,
                  height: 120,
                  child: Card(elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight:Radius.circular(10),
                          bottomLeft: Radius.circular(10)),),
                    child: Padding(padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children:
                        [
                          SizedBox(height: 6,),
                          Text(
                            "Complaints",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold

                            ),),

                          SizedBox(height: 8,)],),

                    ),),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> feedback_page()));},
                child: Container(
                  width: 500,
                  height: 120,
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    margin: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomRight:Radius.circular(10),
                          bottomLeft: Radius.circular(10)),),
                    child: Padding(padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children:
                        [
                          SizedBox(height: 8,),
                          Text("Feedback",style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold),),
                          SizedBox(height: 8,)],),

                    ),),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> aboutus_page()));
                  },
                  child:  Container(
                    width: 500,
                    height: 120,
                    child: Card(elevation: 10.0,
                      shadowColor: Colors.blueGrey,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            bottomRight:Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                      ),
                      child: Padding(padding: EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children:
                          [
                            SizedBox(height: 6,),
                            Text("AboutUs",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),),
                            SizedBox(height: 8,)],),

                      ),),)
              ),
              SizedBox(height: 42,),
            ],),
        ));}
}