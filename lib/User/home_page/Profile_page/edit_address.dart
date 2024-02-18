import 'package:flutter/material.dart';
import 'package:accprevapp/User/home_page/Profile_page/user_data.dart';

// This class handles the Page to edit the Email Section of the User Profile.
class edit_address extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return edit_addressstate();
  }


}

class edit_addressstate extends State<edit_address> {
  final _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  var user = UserData.myUser;

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void updateUserValue(String email) {
    user.email = email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 320,
                    child: const Text(
                      "What's your address",
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: SizedBox(
                        height: 100,
                        width: 320,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address:';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                              labelText: 'Your address'),
                          controller: addressController,
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                updateUserValue(addressController.text);
                                Navigator.pop(context);
                              }
                            },
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                    ))

              ]),
        ));
  }
}