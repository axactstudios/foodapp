import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Cards.dart';

import '../Classes/Constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    Card Order(String dish) {
      return Card(

        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    dish,
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.035,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total Qty',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.1,
                  ),
                  Text(
                    '50 Servings',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Order Placed',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.1,
                  ),
                  Text(
                    '30/50 Servings',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Picked-Up',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.1,
                  ),
                  Text(
                    '20/30 Item',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: pHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Order Close Time',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: pWidth * 0.1,
                  ),
                  Text(
                    '5 hrs 20 mins',
                    style: TextStyle(
                      fontFamily: 'Calibre',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.location_on, color: Colors.black45),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Order('Speacial Gajar Ka Halwa'),
            SizedBox(
              height: pHeight * 0.01,
            ),
            Order('Tandoori Murgh'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: khometextcolor1,
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}
