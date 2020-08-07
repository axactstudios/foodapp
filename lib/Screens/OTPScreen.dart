import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:foodapp/Screens/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/BasicDetailsScreen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'home.dart';

class OTPScreen extends StatefulWidget {
  String phoneNumber;
  String parent;
  OTPScreen(this.phoneNumber, this.parent);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

TextEditingController te = new TextEditingController();

class _OTPScreenState extends State<OTPScreen> {
  String message = '';
  String otp = '';

  Future<String> getUID() async {
    HttpClient httpClient = new HttpClient();
    final String apiUrl =
        "https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/users/${widget.phoneNumber}";
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(apiUrl));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    response.transform(utf8.decoder).listen((contents) {
      print(contents);
      message = contents;
      print(message);
    });
    httpClient.close();
  }

  Future<String> login() async {
    HttpClient httpClient = new HttpClient();
    final String apiUrl =
        "https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/login";
    Map map = {"phoneNumber": '+91${widget.phoneNumber}', "otpValue": otp};
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiUrl));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply);
    return reply;
  }

  @override
  void initState() {
    // TODO: implement initState
    getUID();
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
 String otp;String code;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Verification',
          style: TextStyle(
              fontFamily: 'Calibre',
              fontSize: pHeight * 0.03,
              color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: pHeight,
        width: pWidth,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: pHeight * 0.01,
              ),
              Text(
                'Please enter OTP, you have received on\nyour register mobile number.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Calibre',
                    fontSize: pHeight * 0.024),
              ),
              SizedBox(
                height: pHeight * 0.1,
              ),
              OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width * 0.7,
                fieldWidth: pWidth * 0.15,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
//                  Navigator.pushReplacement(
//                      context,
//                      MaterialPageRoute(
//                      builder: (context) =>
//                      BasicDetails(widget.phoneNumber, pin),
//                  ));
                  this.setState(() {

                     otp = pin;
                    print(otp);
                  final String code=otp;
                  print(code);
                 });
                },

              ),
              SizedBox(
                height: pHeight * 0.05,
              ),
              InkWell(
                onTap: () {


                  if (message == '{"message":"user Does not exists"}') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BasicDetails(widget.phoneNumber, code),
                      ),
                    );
                  } else {
                    login();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Navbar(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: pWidth * 0.7,
                  height: pHeight * 0.05,
                  decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                      child: (widget.parent == 'register')
                          ? Text(
                              'Register here',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Calibre',
                                  fontSize: pHeight * 0.022),
                            )
                          : Text('Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Calibre',
                                  fontSize: pHeight * 0.022))),
                ),
              ),
              SizedBox(
                height: pHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Didn\'t get OTP?',
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        color: Colors.black,
                        fontSize: pHeight * 0.022),
                  ),
                  SizedBox(
                    width: pWidth * 0.02,
                  ),
                  Text(
                    'RESEND',
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        color: kButtonColor,
                        fontSize: pHeight * 0.022),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
