import 'dart:io';

import 'package:flutter/material.dart';
import 'package:accprevapp/home_page/Profile_page/user_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class edit_image extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return edit_imagestate();
  }

}

class edit_imagestate extends State<edit_image> {
  var user = UserData.myUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
              width: 330,
              child: const Text(
                "Upload a photo of yourself:",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 330,
                  child: GestureDetector(
                    onTap: () async {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (image == null) return;

                      final location = await getApplicationDocumentsDirectory();
                      final name = basename(image.path);
                      final imageFile = File('${location.path}/$name');
                      final newImage =
                      await File(image.path).copy(imageFile.path);
                      setState(
                              () => user = user.copy(imagePath: newImage.path));
                    },
                    child: Image.network(user.image),
                  ))),
          Padding(
              padding: EdgeInsets.only(top: 40),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 330,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Update',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}