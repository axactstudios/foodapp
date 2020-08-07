import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/apimodels/offeringmodel.dart';
import 'add_dish.dart';
import '../Classes/Constants.dart';
import '../Classes/Constants.dart';

class List extends StatefulWidget {

  @override
  _ListState createState() => _ListState();
}


class _ListState extends State<List> {
  String message='';
  Map data;
  List userdata;

  Future<String> getitem() async {

   HttpClient httpClient = new HttpClient();
   final String apiUrl =
        "https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/getUserOfferings/5cb84df7-4bb6-4dfa-a4f6-9651ba6fd414";

   HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    request.headers.set('content-type', 'application/json');
   HttpClientResponse response = await request.close();
   response.transform(utf8.decoder).listen((contents) {
     print(contents);
     message = contents;
     print(message);
     setState(() {
       userdata=data["data"];
     });
      print(userdata.toString());
   });
    httpClient.close();
  }
//  Future getitem() async{
//    http.Response response = await http.get("https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/getUserOfferings/5cb84df7-4bb6-4dfa-a4f6-9651ba6fd414");
//    data =json.decode(response.body);
//    setState(() {
//      userData =data["User"];
//    });
//    debugPrint(userData.toString());
//  }
  @override
  void initState() {
    super.initState();
    getitem();
  }
  @override
  Widget build(BuildContext context) {
    OfferingModel _data;
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.location_on, color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Additem(),
                  ),
                );
              })
        ],
      ),
      body:Column(
        children: <Widget>[
          Text(_data.data.productName),
          Text(_data.data.price),
        Text(_data.data.quantity),

        ],
      )

    );
  }
}
