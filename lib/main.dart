import 'package:flutter/material.dart';
import 'package:foodapp/Screens/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      home: SplashScreen(),
    );
  }
}
