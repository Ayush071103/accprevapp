import 'dart:convert';

import 'package:accprevapp/User/home_page/widgets/textFromField.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class AddFamilyDetailPage extends StatefulWidget {
  const AddFamilyDetailPage({Key? key}) : super(key: key);

  @override
  State<AddFamilyDetailPage> createState() => _AddFamilyDetailPageState();
}

class _AddFamilyDetailPageState extends State<AddFamilyDetailPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController relationController = TextEditingController();
  final formKey = new GlobalKey<FormState>();
  var logindata;
  var data;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            Text("Add Family Details",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(color:Theme.of(context).primaryColor)) : SingleChildScrollView(
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
                  errorMsg: 'Please enter Adress',
                  keyboardType: TextInputType.streetAddress,
                  textEditingController: addressController,
                  icon: Icons.location_on_rounded,
                  hint: "Address",
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  errorMsg: 'Please enter contact',
                  keyboardType: TextInputType.number,
                  textEditingController: contactController,
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
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: CustomTextField(
                  errorMsg: 'Please enter relation',
                  keyboardType: TextInputType.text,
                  textEditingController: relationController,
                  icon: Icons.account_circle_sharp,
                  hint: "Relation",
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
                        child: Text('Add Family Details'.toUpperCase(),
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final form = formKey.currentState;
    if (form!.validate()) {
      setState(() {
        isLoading = true;
      });
      final login_url = Uri.parse(
          "https://accprevapp.000webhostapp.com/API/insert_reletive_info.php");
      final response = await http
          .post(login_url, body: {
        "l_id": prefs.getString('id'),
        "r_name": nameController.text,
        "r_address": addressController.text,
        "r_phone": contactController.text,
        "r_email": emailController.text,
        "r_relation": relationController.text,
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
