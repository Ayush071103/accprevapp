import 'package:accprevapp/User/home_page/Profile_page/aboutus_page.dart';
import 'package:accprevapp/User/home_page/Profile_page/add_family_details.dart';
import 'package:accprevapp/User/home_page/Profile_page/complaints_page.dart';
import 'package:accprevapp/User/home_page/Profile_page/edit_profilepage.dart';
import 'package:accprevapp/User/home_page/Profile_page/feedback_page.dart';
import 'package:accprevapp/User/home_page/widgets/exit_confirmation_dialog.dart';
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor ,
          title: Text('Profile'),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
          shadowColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: <Widget>[
            InkWell(
              onTap: (){
                showDialog(context: context, builder: (context) => ExitConfirmationDialog());
              },
              child: Icon(Icons.logout,color: Colors.white,),
            ),
            SizedBox(width: 20,),
          ],
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>edit_ProfilePage() ));
                  },
                child: Container(
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    margin: EdgeInsets.only(left: 16,right: 16,top: 32,bottom: 16),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Profile",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),),
                              Icon(Icons.arrow_forward_ios,color: Color(0xFF032737),)
                            ],
                          ),
                        ],

                      ),


                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>AddComplaintsPage() ));},
                child:Container(
                  child: Card(elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    color: Color(0xFF032737),
                    margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 16),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Complaints",
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold
                                ),),
                              Icon(Icons.arrow_forward_ios,color: Colors.white,)
                            ],
                          ),

                         ],),

                    ),),),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=> AddFeedbackPage()));},
                child: Container(
                  child: Card(
                    elevation: 10.0,
                    shadowColor: Colors.blueGrey,
                    margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 16),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Feedback",
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold
                                ),),
                              Icon(Icons.arrow_forward_ios,color: Color(0xFF032737),)
                            ],
                          ),
                         ],),

                    ),),
                ),
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> About()));
                  },
                  child:  Container(
                    child: Card(elevation: 10.0,
                      shadowColor: Colors.blueGrey,
                      color: Color(0xFF032737),
                      margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 16),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Icon(Icons.arrow_forward_ios,color: Colors.white,)
                              ],
                            ),
                         ],),

                      ),),)
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddFamilyDetailPage()));
                  },
                  child:  Container(
                    child: Card(elevation: 10.0,
                      shadowColor: Colors.blueGrey,
                      margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Add Family Details",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Icon(Icons.arrow_forward_ios,color: Color(0xFF032737),)
                              ],
                            ),
                         ],),

                      ),),)
              ),
              SizedBox(height: 42,),
            ],),
        ));}
}