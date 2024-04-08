import 'dart:async';
import 'dart:convert';
import 'package:accprevapp/User/home_page/widgets/textFromField.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class edit_ProfilePage extends StatefulWidget {
  const edit_ProfilePage({super.key});

  @override
  State<edit_ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<edit_ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String userName = "";
  String userEmail = "";
  String userPhone = "";

  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    setState(() {
      nameController = TextEditingController(text:setpreference.getString('name')!);
      phoneController = TextEditingController(text:setpreference.getString('phone')!);
      emailController = TextEditingController(text: setpreference.getString('email')!);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  readOnly: true,
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
                  readOnly: true,
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
                        onPressed:_submit,
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

  Future<void> _submit() async {
    SharedPreferences setpreference =
    await SharedPreferences.getInstance();
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://accprevappp.000webhostapp.com/API/updateprofile.php");
      final response = await http
          .post(login_url, body: {
        "l_id": setpreference.getString('id'),
        "l_name": nameController.text,
        "l_phone": phoneController.text,
        "l_email": emailController.text,
      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
          setpreference.setString('name', nameController.text);
          setpreference.setString('email', emailController.text);
          setpreference.setString('phone', phoneController.text);
          Navigator.of(context).pop();
        }else{
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2
          );
        }
      }
    }

  }

}


