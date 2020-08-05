import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/OTPScreen.dart';
import 'package:foodapp/apimodels/otpmodel.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

Future<String> sendOtp(String number) async {
  HttpClient httpClient = new HttpClient();

  final String apiUrl =
      "https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/send_otp";
//  final  response =
//      await http.post(apiUrl, body: {"phoneNumber": number}).catchError((e) {
//    print(e);
//  });
//  print(response.body.toString());
//  if (response.statusCode != null) {
//    final String responseString = response.body;
//    return otpModelFromJson(responseString);
//  } else {
//    return null;
//  }
  Map map = {"phoneNumber": '+91$number'};
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(map)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  return reply;
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    OtpModel _user;
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: pWidth,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: pHeight * 0.05,
                    ),
                    Image.asset(
                      'assets/images/logoLogin@3x.png',
                      height: pHeight * 0.07,
                    ),
                    SizedBox(
                      height: pHeight * 0.02,
                    ),
                    Text(
                      'Login as Chef',
                      style: TextStyle(
                          fontFamily: 'Calibre', fontSize: pHeight * 0.025),
                    ),
                    SizedBox(
                      height: pHeight * 0.01,
                    ),
                    Text(
                      'Please enter your phone number and we will\nsend you an “OTP” to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Calibre',
                          fontSize: pHeight * 0.022,
                          color: kTextColor),
                    ),
                    SizedBox(
                      height: pHeight * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: pWidth,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '+91',
                        style: TextStyle(
                            fontFamily: 'Calibre', fontSize: pHeight * 0.025),
                      ),
                      SizedBox(
                        width: pWidth * 0.05,
                      ),
                      Container(
                        width: pWidth * 0.5,
                        child: TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            if (value.length < 10) {
                              return 'Invalid phone number';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            hintStyle: TextStyle(
                                fontFamily: 'Calibre',
                                color: Colors.black,
                                fontSize: pHeight * 0.024),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: pHeight * 0.04,
                  ),
                  InkWell(
                    onTap: () async {
                      final String number = phoneController.text;
//                      final OtpModel user = await sendOtp(number);
                      await sendOtp(number);
                      setState(() {
//                        _user = user;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen('+91$number'),
                        ),
                      );
                    },
                    child: Container(
                      width: pWidth * 0.4,
                      height: pHeight * 0.05,
                      decoration: BoxDecoration(
                        color: kButtonColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'SEND OTP',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Calibre',
                              fontSize: pHeight * 0.022),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.05,
                  ),
                  _user == null ? Container() : Text(_user.message),
                  Text(
                    'Continue with:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.022,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: pHeight * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/facebook@3x.png',
                        height: pHeight * 0.045,
                      ),
                      SizedBox(
                        width: pWidth * 0.1,
                      ),
                      Image.asset(
                        'assets/images/googleBtn@3x.png',
                        height: pHeight * 0.045,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: pHeight * 0.34,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Not a member?',
                        style: TextStyle(
                            fontFamily: 'Calibre',
                            color: Colors.black,
                            fontSize: pHeight * 0.022),
                      ),
                      SizedBox(
                        width: pWidth * 0.02,
                      ),
                      Text(
                        'REGISTER',
                        style: TextStyle(
                            fontFamily: 'Calibre',
                            color: kButtonColor,
                            fontSize: pHeight * 0.022),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
