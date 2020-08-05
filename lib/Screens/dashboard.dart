import 'package:flutter/material.dart';
import '../Classes/Constants.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kdashboard1,
      ),
      backgroundColor: kdashboard1,
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 270),
                        child: Text(
                          'TODAYS',
                          style: TextStyle(
                              letterSpacing: 1.07,
                              color: khometextcolor3,
                              fontFamily: 'Calibre',
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 108,
                              width: 163,
                              child: Card(
                                color: kdashboard2,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 70),
                                      child: Text(
                                        '120',
                                        style: TextStyle(
                                            fontFamily: 'Calibre',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 28),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 28, top: 10),
                                      child: Text(
                                        'Total Orders',
                                        style: TextStyle(
                                            fontFamily: 'Calibre',
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 108,
                              width: 163,
                              child: Card(
                                color: kdashboard3,
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20, right: 45),
                                      child: Text(
                                        'Rs 5000',
                                        style: TextStyle(
                                            fontFamily: 'Calibre',
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 23),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 28, top: 15),
                                      child: Text(
                                        'Total Earnings',
                                        style: TextStyle(
                                            fontFamily: 'Calibre',
                                            color: Colors.white,
                                            fontSize: 17),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'MONTHLY',
                    style: TextStyle(
                        letterSpacing: 1.07,
                        fontFamily: 'Calibre',
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: 15,
                        letterSpacing: 1.07),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                width: 321,
                height: 94,
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Total Orders',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Calibre',
                                  color: khometextcolor3),
                            ),
                            SizedBox(
                              width: 170,
                            ),
                            Text(
                              '500',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Calibre',
                                  color: khometextcolor3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Total Earnings',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Calibre',
                                  color: khometextcolor3),
                            ),
                            SizedBox(
                              width: 125,
                            ),
                            Text(
                              'Rs. 5000',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Calibre',
                                  color: khometextcolor3),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: khometextcolor1,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Center(
                      child: Text(
                        'EXPORT',
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
            ),
          ],
        ),
      ),
    );
  }
}
