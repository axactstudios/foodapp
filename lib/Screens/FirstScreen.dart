import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/IntroScreens.dart';
import 'package:foodapp/Screens/landing.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Classes/Constants.dart';

String role;

Future<void> addRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('role', "chef");
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: pHeight,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/main_top.png',
                  fit: BoxFit.fill,
                  height: pHeight * 0.35,
                  width: pWidth,
                ),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: pHeight * 0.125,
                  ),
                  Text(
                    'Please Select Your Role',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.04,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: pHeight * 0.005,
                  ),
                  Text(
                    'You want to continue as:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.035,
                        fontWeight: FontWeight.w300,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: pHeight * 0.025,
                  ),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/customer@3x.png',
                                  height: pHeight * 0.25,
                                ),
                                Text(
                                  'CUSTOMER',
                                  style: TextStyle(
                                      fontFamily: 'Calibre',
                                      fontSize: pHeight * 0.025,
                                      color: kPrimaryColor),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: pHeight * 0.03,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                width: pWidth * 0.25,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.deepOrange.withOpacity(0.45),
                                ),
                              ),
                              SizedBox(
                                width: pWidth * 0.05,
                              ),
                              Text(
                                'OR',
                                style: TextStyle(
                                  fontFamily: 'Calibre',
                                  fontWeight: FontWeight.bold,
                                  fontSize: pHeight * 0.02,
                                  color: Colors.deepOrange.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                width: pWidth * 0.05,
                              ),
                              SizedBox(
                                width: pWidth * 0.25,
                                child: Divider(
                                  thickness: 2,
                                  color: Colors.deepOrange.withOpacity(0.45),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: pHeight * 0.03,
                          ),
                          InkWell(
                            onTap: () {
                              //role = "chef";

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Landing(),
                                ),
                              );
                            },
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    'assets/images/chef@3x.png',
                                    height: pHeight * 0.25,
                                  ),
                                  Text(
                                    'CHEF',
                                    style: TextStyle(
                                        fontFamily: 'Calibre',
                                        fontSize: pHeight * 0.025,
                                        color: kButtonColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
