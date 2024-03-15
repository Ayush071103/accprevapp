import 'dart:convert';

import 'package:accprevapp/Admin/Admin_homepage/Admin_homepage.dart';
import 'package:accprevapp/User/home_page/home.dart';
import 'package:accprevapp/User/singuppage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.blue))
            : SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Login to your account",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[700]),
                              )
                            ],
                          ),
                          Form(
                            key: formKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                children: <Widget>[
                                  inputFile(
                                      label: "Email",
                                      textFieldController: nameController,
                                      errorMsg: "Enter your email"),
                                  inputFile(
                                      label: "Password",
                                      obscureText: true,
                                      textFieldController: passwordController,
                                      errorMsg: "Enter your password")
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              padding: EdgeInsets.only(top: 3, left: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black),
                                  )),
                              child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 60,
                                  onPressed: _submit,
                                  color: Color(0xFF032737),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(45),
                                  ),
                                  child: Text(
                                    " Login",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: 18),
                                  )),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account?"),
                              GestureDetector(
                                child: Text(
                                  " Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()),
                                  );
                                },
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 100),
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/background.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ));
  }

  Future<void> _submit() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url =
          Uri.parse("https://accprevapp.000webhostapp.com/API/login.php");
      final response = await http.post(login_url, body: {
        "l_email": nameController.text,
        "l_pass": passwordController.text
      });
      if (response.statusCode == 200) {
        logindata = jsonDecode(response.body);
        data = jsonDecode(response.body)['user'];
        print(data);
        setState(() {
          isLoading = false;
        });
        if (logindata['error'] == false) {
          SharedPreferences setpreference =
              await SharedPreferences.getInstance();
          setpreference.setString('id', data['l_id'].toString());
          setpreference.setString('name', data['l_name'].toString());
          setpreference.setString('email', data['l_email'].toString());
          setpreference.setString('Role', data['l_role'].toString());
          if (setpreference.getString('Role') != null &&
              setpreference.getString('Role') == "1") {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => Admin_homepage()),
                (Route<dynamic> route) => false);
          } else {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => Homepage()),
                (Route<dynamic> route) => false);
          }
        } else {
          Fluttertoast.showToast(
              msg: logindata['message'].toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2);
        }
      }
    }
  }
}

// we will be creating a widget for text field
Widget inputFile(
    {label,
    obscureText = false,
    TextEditingController? textFieldController,
    String? errorMsg}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      TextFormField(
        controller: textFieldController,
        obscureText: obscureText,
        validator: (val) {
          if (val!.isEmpty) {
            return errorMsg;
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
