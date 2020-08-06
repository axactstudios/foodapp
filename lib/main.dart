import 'package:flutter/material.dart';
import 'package:foodapp/Screens/SplashScreen.dart';
import 'package:foodapp/Screens/landing.dart';
import 'package:foodapp/Screens/LoginScreen.dart';
import 'package:foodapp/Screens/navbar.dart';

import 'Screens/IntroScreens.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      routes: {

        '/': (context) => SplashScreen(),
        '/land': (context) => Landing(),
        '/intro': (context) => IntroScreens(),
        '/home': (context) => Navbar(),
      },
      //home: SplashScreen(),
    );
  }
}
