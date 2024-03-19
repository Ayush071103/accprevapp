import 'package:accprevapp/Admin/Admin_homepage/ComplaintsListPage.dart';
import 'package:accprevapp/Admin/Admin_homepage/FeedbackListPage.dart';
import 'package:accprevapp/Admin/Admin_homepage/UserListPage.dart';
import 'package:accprevapp/Admin/Admin_homepage/manage_device.dart';
import 'package:accprevapp/User/home_page/widgets/exit_confirmation_dialog.dart';
import 'package:flutter/material.dart';
class Admin_homepage extends StatefulWidget {
  const Admin_homepage({super.key});

  @override
  State<Admin_homepage> createState() => _Admin_homepageState();
}

class _Admin_homepageState extends State<Admin_homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.list,color: Colors.white,),
            onPressed: (){
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Color(0xFF032737),
          iconTheme: IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                color: Color(0xff08364B),
                margin: EdgeInsets.only(left: 50,top: 16,bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),)
                ),
                elevation: 8,
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserListPage()),
                    );
                  },
                  child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text("User List",style: TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
              Card(
                color:Color(0xff08364B),
                margin: EdgeInsets.only(right:50,top: 16,bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),)
                ),
                elevation: 8,
                child:InkWell(
                  onTap: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => booking_request()),
                     );
                  },
                  child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text("Manage Bookings",style: TextStyle(color: Colors.white,  fontSize: 20),)),
                ),
              ),
              Card(
                color:Color(0xff08364B),
                margin: EdgeInsets.only(left: 50,top: 16,bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),)
                ),
                elevation: 8,
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ComplaintsListPage()),
                    );
                  },
                  child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text("Complaints List",style: TextStyle(color: Colors.white,  fontSize: 20))),
                ),
              ),
              Card(
                color:Color(0xff08364B),
                margin: EdgeInsets.only(right:50,top: 16,bottom: 16),
                shape: RoundedRectangleBorder(
                    borderRadius:  BorderRadius.only(
                      topRight: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),)
                ),
                elevation: 8,
                child:InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackListPage()),
                    );
                  },
                  child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: Text("Feedback List",style: TextStyle(color: Colors.white,  fontSize: 20))),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
            child: Column(children:[
              UserAccountsDrawerHeader(
                accountName: Text("Admin"),
                accountEmail: Text("admin7@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "AD",
                    style: TextStyle(color:  Color(0xFF032737)),
                  ),
                ),
                decoration: BoxDecoration(color:  Color(0xFF032737)),
              ),
              ListTile(title:Text("ADMIN PAGE", style: TextStyle(fontSize: 20),)),
              ListTile(title:Text("Manage Users"),leading: Icon(Icons.people),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UserListPage()));
                },),
              ListTile(title:Text("Manage Devices"), leading: Icon(Icons.device_hub),
                  onTap: (){
                  }),
              ListTile(title:Text("Complaints"), leading: Icon(Icons.mail),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ComplaintsListPage()));
                  }),
              ListTile(title:Text("Feedback"), leading: Icon(Icons.feedback),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FeedbackListPage()));
                  }),
              ListTile(title:Text("Logout"), leading: Icon(Icons.logout),onTap: (){
                showDialog(context: context, builder: (context) => ExitConfirmationDialog());
              },),
            ]
            )
        )
    );
  }
}
