import 'package:flutter/material.dart';
import 'package:foodapp/Screens/SplashScreen.dart';
import 'package:foodapp/Screens/landing.dart';
import 'package:foodapp/Screens/LoginScreen.dart';
import 'package:foodapp/Screens/navbar.dart';

import 'Screens/LoginScreen.dart';
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
        '/': (context) => Landing(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => Navbar(),
      },
      //home: SplashScreen(),
    );
  }
}
