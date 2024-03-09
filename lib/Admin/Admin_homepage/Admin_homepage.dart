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
        body:  Center(child: Text("Fourth Page Code")),
      drawer: Drawer(
      child: Column(children:[
        UserAccountsDrawerHeader(
          accountName: Text("Admin"),
          accountEmail: Text("admin@gmail.com"),
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
        ListTile(title:Text("Manage Users"),leading: Icon(Icons.people),),
        ListTile(title:Text("Manage Devices"), leading: Icon(Icons.device_hub),),
        ListTile(title:Text("Complaints"), leading: Icon(Icons.mail),),
        ListTile(title:Text("Feedback"), leading: Icon(Icons.feedback),),
        ListTile(title:Text("Profile"), leading: Icon(Icons.person),),
        ListTile(title:Text("Logout"), leading: Icon(Icons.logout),onTap: (){
          showDialog(context: context, builder: (context) => ExitConfirmationDialog());
        },),
      ]
      )
      )
    );
  }
}
