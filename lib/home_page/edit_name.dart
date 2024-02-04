import 'package:accprevapp/home_page/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:accprevapp/home_page/user_data.dart';

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
      body: Form(child: Column(crossAxisAlignment: CrossAxisAlignment.center,
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
                        InputDecoration(
                            labelText: 'First Name', border: InputBorder.none),
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
                        InputDecoration(
                            labelText: 'Last Name', border: InputBorder.none),
                        controller: secondNameController,
                      ),
                    )
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 160),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      isAlpha(firstNameController.text +
                          secondNameController.text)) {
                    updateUserValue(firstNameController.text +
                        " " +
                        secondNameController.text);
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),);
                  }
                }, child: const Text("Update", style: TextStyle(fontSize: 15),),
              ),),


            ),)
        ]

        ,),

      ),
    );
  }
  }