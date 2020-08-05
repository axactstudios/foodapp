import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/BasicDetailsScreen.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import 'home.dart';

class OTPScreen extends StatefulWidget {
  String phoneNumber;String parent;
  OTPScreen(this.phoneNumber,this .parent);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

TextEditingController te = new TextEditingController();

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
     String otp;
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
                  otp=pin;

                },
              ),
              SizedBox(
                height: pHeight * 0.05,
              ),
              InkWell
                  (

                  onTap: () {
                    if(widget.parent=='register'){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BasicDetails(
                                widget.phoneNumber, otp
                            ),
                      ),
                    );
                  }
                else{
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) =>
              Home(),
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
                      child:(widget.parent=='register')? Text(
                  'Register here',
                  style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Calibre',
                  fontSize: pHeight * 0.022),
                  ):Text('Login',style:TextStyle(color:Colors.white,fontFamily:'Calibre',fontSize:pHeight*0.022 ))

                    ),
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
