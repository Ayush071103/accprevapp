import 'dart:convert';

import 'package:accprevapp/User/home_page/widgets/textFromField.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:accprevapp/User/home_page/Profile_page/user_data.dart';
import 'package:http/http.dart' as http;

class edit_ProfilePage extends StatefulWidget {
  const edit_ProfilePage({super.key});

  @override
  State<edit_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<edit_ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(
        Uri.parse("https://accprevapp.000webhostapp.com/API/registration.php"));

    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        isLoading = false;
        data = jsonDecode(data!)['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = UserData.myUser;
    return Scaffold(
      appBar:  AppBar(
        backgroundColor:Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(36),
            bottomLeft: Radius.circular(36),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color:Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:Row(
          children: [
            Text("My Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body:  isLoading ? Center(child: CircularProgressIndicator(color:Theme.of(context).primaryColor)) : SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  errorMsg: 'Please enter Name',
                  keyboardType: TextInputType.name,
                  textEditingController: nameController,
                  icon: Icons.person,
                  hint: "Name",
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  errorMsg: 'Please enter contact',
                  keyboardType: TextInputType.number,
                  textEditingController: phoneController,
                  icon: Icons.phone,
                  hint: "Contact",
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  errorMsg: 'Please enter email',
                  keyboardType: TextInputType.text,
                  textEditingController: emailController,
                  icon: Icons.email,
                  hint: "Email",
                ),
              ),

              SizedBox(height:50 ,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0,),
                child: Column(
                  children: <Widget>[
                    Container(
                      child :MaterialButton(
                        height: 55.0,
                        minWidth: MediaQuery.of(context).size.width/2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                                bottomLeft: Radius.circular(16.0),
                                bottomRight: Radius.circular(16.0))
                        ),
                        onPressed:(){},
                        child: Text('Update Profile'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),),
                        color:Color(0xff08364B),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,


        );




  }
}


