import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class UserListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UserListPageState();
  }
}

class _UserListPageState extends State<UserListPage> {
  String? data;
  var all_data;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response = await http.get(
        Uri.parse("https://accprevapp.000webhostapp.com/API/fetch_smoke_sensor.php"));

    if (response.statusCode == 200) {
      data = response.body;
      print(data);
      setState(() {
        isLoading = false;
        all_data = jsonDecode(data!)['data'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor ,
        title: Text('User List'),
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 20),
        shadowColor: Colors.white,
        elevation: 10,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: Colors.white.withAlpha(20),
            ),
            child: Icon(Icons.arrow_back, color:Colors.white, size: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: <Widget>[
          SizedBox(width: 20,),
        ],
      ),
      body:isLoading ? Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)) : ListView.builder(
        itemCount: all_data == null ? 0 : all_data.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (BuildContext context, int index) {
          return Card(
              margin: EdgeInsets.only(bottom: 24),
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  side: new BorderSide(color: Color(0xFFF4CC1F), width: 3.0),
                  borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                      bottomLeft: Radius.circular(24.0),
                      bottomRight: Radius.circular(24.0))
              ),
              elevation: 8,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 24,bottom: 8),
                    child: Row(
                      children: [
                        Text("Reading Time: ", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        Text(jsonDecode(data!)['data'][index]['timestamp'],
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 24),
                    child: Row(
                      children: [
                        Text("Value: ", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                        Text(jsonDecode(data!)['data'][index]['smoke_value'],
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal))
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
