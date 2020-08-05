import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';

import 'LoginScreen.dart';

class IntroScreens extends StatefulWidget {
  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/slider1.png',
                      height: pHeight * 0.6,
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: pHeight * 0.018,
                        width: pHeight * 0.018,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                      SizedBox(
                        width: pWidth * 0.02,
                      ),
                      Container(
                        height: pHeight * 0.012,
                        width: pHeight * 0.012,
                        decoration: BoxDecoration(
                          color: kTextColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                      SizedBox(
                        width: pWidth * 0.02,
                      ),
                      Container(
                        height: pHeight * 0.012,
                        width: pHeight * 0.012,
                        decoration: BoxDecoration(
                          color: kTextColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: pHeight * 0.07,
                  ),
                  Text(
                    'CREATE YOUR PROFILE FOR SELLING DISH',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.025),
                  ),
                  SizedBox(
                    height: pHeight * 0.015,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ut labore dolore.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kTextColor,
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.02),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: pHeight * 0.04,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => IntroScreenTwo(),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.05,
                width: pWidth * 0.3,
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
                      fontSize: pHeight * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroScreenTwo extends StatefulWidget {
  @override
  _IntroScreenTwoState createState() => _IntroScreenTwoState();
}

class _IntroScreenTwoState extends State<IntroScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: Column(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/slider2.png',
                        height: pHeight * 0.6,
                      ),
                    ),
                    SizedBox(
                      height: pHeight * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: pHeight * 0.012,
                          width: pHeight * 0.012,
                          decoration: BoxDecoration(
                            color: kTextColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(pHeight * 0.02),
                          ),
                        ),
                        SizedBox(
                          width: pWidth * 0.02,
                        ),
                        Container(
                          height: pHeight * 0.018,
                          width: pHeight * 0.018,
                          decoration: BoxDecoration(
                            color: kButtonColor,
                            borderRadius: BorderRadius.circular(pHeight * 0.02),
                          ),
                        ),
                        SizedBox(
                          width: pWidth * 0.02,
                        ),
                        Container(
                          height: pHeight * 0.012,
                          width: pHeight * 0.012,
                          decoration: BoxDecoration(
                            color: kTextColor.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(pHeight * 0.02),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: pHeight * 0.07,
                    ),
                    Text(
                      'TRACK YOUR EARNING & EXPENSE',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Calibre',
                          fontSize: pHeight * 0.025),
                    ),
                    SizedBox(
                      height: pHeight * 0.015,
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ut labore dolore.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kTextColor,
                          fontFamily: 'Calibre',
                          fontSize: pHeight * 0.02),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: pHeight * 0.04,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => IntroScreenThree(),
                    ),
                  );
                },
                child: Container(
                  height: pHeight * 0.05,
                  width: pWidth * 0.3,
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
                        fontSize: pHeight * 0.022,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class IntroScreenThree extends StatefulWidget {
  @override
  _IntroScreenThreeState createState() => _IntroScreenThreeState();
}

class _IntroScreenThreeState extends State<IntroScreenThree> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Image.asset(
                      'assets/images/slider3.png',
                      height: pHeight * 0.6,
                    ),
                  ),
                  SizedBox(
                    height: pHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: pHeight * 0.012,
                        width: pHeight * 0.012,
                        decoration: BoxDecoration(
                          color: kTextColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                      SizedBox(
                        width: pWidth * 0.02,
                      ),
                      Container(
                        height: pHeight * 0.012,
                        width: pHeight * 0.012,
                        decoration: BoxDecoration(
                          color: kTextColor.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                      SizedBox(
                        width: pWidth * 0.02,
                      ),
                      Container(
                        height: pHeight * 0.018,
                        width: pHeight * 0.018,
                        decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(pHeight * 0.02),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: pHeight * 0.07,
                  ),
                  Text(
                    'SHARE YOUR MENU WITH YOUR FAVOURITE',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.025),
                  ),
                  SizedBox(
                    height: pHeight * 0.015,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consecte adipiscing elit, sed do eiusmod tempor ut labore dolore.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kTextColor,
                        fontFamily: 'Calibre',
                        fontSize: pHeight * 0.02),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: pHeight * 0.04,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              child: Container(
                height: pHeight * 0.05,
                width: pWidth * 0.35,
                decoration: BoxDecoration(
                  color: kButtonColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(
                    'GET STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Calibre',
                      fontSize: pHeight * 0.022,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
