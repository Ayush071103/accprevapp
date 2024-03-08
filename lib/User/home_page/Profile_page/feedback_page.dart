import 'package:flutter/material.dart';
import 'package:accprevapp/User/home_page/Profile_page/profilepage.dart';
class feedback_page extends StatefulWidget {
  const feedback_page({super.key});

  @override
  State<feedback_page> createState() => _feedback_pageState();
}

class _feedback_pageState extends State<feedback_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: 320,
            child: const Text(
              "What's your Feedback",
              style:
              TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            )),
        Padding(padding: EdgeInsets.only(top: 40),
            child:
            SizedBox(
              height: 100,width: 320,
              child:TextField(decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)),
                labelText: " add your feedback " ,

              ),),)

        ),
        Padding(padding:EdgeInsets.only(top: 150),
          child: Align(alignment: Alignment.bottomCenter,
            child: SizedBox(height: 50,width: 320,
              child: ElevatedButton(onPressed: (){}, child: Text("Submit"),),),),),
      ],));
  }
}
