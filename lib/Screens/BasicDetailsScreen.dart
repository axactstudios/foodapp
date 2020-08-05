import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/AddAddressScreen.dart';

class BasicDetails extends StatefulWidget {
  String phoneNumber, otp;
  BasicDetails(this.phoneNumber, this.otp);
  @override
  _BasicDetailsState createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  TextEditingController nameController = new TextEditingController(text: '');
  TextEditingController numberController = new TextEditingController(text: '');
  TextEditingController emailController = new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bg@3x.png',
              height: pHeight * 0.15,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Container(
                  height: pHeight * 0.15,
                  width: pWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'BASIC DETAILS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white,
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD ADDRESS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD DOCUMENTS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD BANK DETAILS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value.length < 1) {
                        return 'Invalid name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
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
                      width: pWidth * 0.69,
                      child: TextFormField(
                        controller: numberController,
                        validator: (value) {
                          if (value.length < 10) {
                            return 'Invalid phone number';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          hintStyle: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.black.withOpacity(0.75),
                              fontSize: pHeight * 0.024),
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AddAddress(nameController.text,emailController.text,numberController.text),
                      ),
                    );
                  },
                  child: Container(
                    width: pWidth * 0.6,
                    height: pHeight * 0.05,
                    decoration: BoxDecoration(
                      color: kButtonColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Calibre',
                            fontSize: pHeight * 0.022),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.06,
                ),
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
                  height: pHeight * 0.04,
                ),
                Text(
                  'By joining, you are agreeing to our',
                  style: TextStyle(
                      fontFamily: 'Calibre',
                      color: kTextColor,
                      fontSize: pHeight * 0.022),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                      fontFamily: 'Calibre',
                      color: kButtonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: pHeight * 0.025),
                ),
                SizedBox(
                  height: pHeight * 0.11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already a member?',
                      style: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black,
                          fontSize: pHeight * 0.022),
                    ),
                    SizedBox(
                      width: pWidth * 0.02,
                    ),
                    Text(
                      'LOGIN',
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
        ],
      ),
    );
  }
}
