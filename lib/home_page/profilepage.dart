import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:accprevapp/home_page/user_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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

                      onPressed: () {},
                      child: Icon(Icons.camera_alt_sharp, size: 25),
                    ),
                  ),
                )
              ],
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
              subtitle: Text("Enter your name"),

            ),
            Divider(height: 7,),
            ListTile(
              title: Text("Email"),
              leading: Icon(Icons.email),
              trailing: Icon(Icons.edit),
              subtitle: Text("Enter your email"),

            ),
            Divider(height: 7),
             ListTile(
             title: Text("Phone"),
              leading: Icon(Icons.phone),
              trailing: Icon(Icons.edit),
               subtitle:Text("Enter your phone number") ,
             ),
            Divider(height: 7),
            ListTile(
              title: Text("Address"),
              leading: Icon(Icons.house),
              trailing: Icon(Icons.edit),
              subtitle:Text("Enter your address") ,
            ),


      ])
        ),

    );
  }
}
class edit_name extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return edit_namestate();
  }

}
class edit_namestate extends State<edit_name>{
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = UserData.myUser;

  void updateUserValue(String name) {
    user.name = name;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(),
     body: Form(
       key: _formKey,
       child: Column(crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
     children: [SizedBox(
       width: 350,
       height: 30,
       child: const Text("What's Your Name?",
         style: TextStyle(
             fontSize: 25,
             fontWeight: FontWeight.bold),),
     ),
       Padding(
         padding: const EdgeInsets.all(16.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Expanded(
                 child: Container(
                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.white,
                   ),
                   child: TextFormField(
                     // Handles Form Validation for First Name
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your first name';
                       }
                       return null;
                     },
                     decoration:
                     InputDecoration(labelText: 'First Name',border: InputBorder.none),
                     controller: firstNameController,
                   ),
                 )),
             SizedBox(width: 16,),
             Expanded(
                 child: Container(

                   padding: EdgeInsets.all(8),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     color: Colors.white,

                   ),
                   child: TextFormField(
                     // Handles Form Validation for First Name
                     validator: (value) {
                       if (value == null || value.isEmpty) {
                         return 'Please enter your Last name';
                       }
                       return null;
                     },
                     decoration:
                     InputDecoration(labelText: 'Last Name',border: InputBorder.none),
                     controller:secondNameController ,
                   ),
                 )
          )
           ],
         ),
       ),
     Padding(padding: EdgeInsets.only(top: 160),
       child: Align(
           alignment:Alignment.bottomCenter,
       child:  Expanded(child: ElevatedButton(
         onPressed: (){
           if (_formKey.currentState!.validate() &&
               isAlpha(firstNameController.text +
                   secondNameController.text)) {
             updateUserValue(firstNameController.text +
                 " " +
                 secondNameController.text);
             Navigator.pop(context);
           }
         }, child: const Text("Update",style: TextStyle(fontSize: 15),),
       ),),
       
       
       ),)
     ]

     ,),
     
     ),
   );

  }

}