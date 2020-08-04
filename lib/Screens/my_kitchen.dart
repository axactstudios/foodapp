import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_dish.dart';
import '../Classes/Constants.dart';
import '../Classes/Constants.dart';

class Mykitchen extends StatefulWidget {
  @override
  _MykitchenState createState() => _MykitchenState();
}

class _MykitchenState extends State<Mykitchen> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 54.0,
              backgroundImage:
                  AssetImage('assets/images/emptyMykitchen@3x.png'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Item added yet',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 0.7,
                color: khometextcolor2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 140,
                height: 36,
                decoration: BoxDecoration(
                  color: khometextcolor1,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(
                    child: Text(
                      'ADD ITEM',
                      style: TextStyle(
                          fontFamily: 'Calibre',
                          fontSize: 15,
                          color: Colors.white,
                          letterSpacing: 1.07),
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
