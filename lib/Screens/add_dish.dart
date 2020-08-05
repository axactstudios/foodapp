import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../Classes/Constants.dart';
import '../Classes/Constants.dart';

class Additem extends StatefulWidget {
  @override
  _AdditemState createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final servingntroller = TextEditingController();
  final Items = ['Per Unit', 'Per Serve'];
  final units = ['gm', 'kg'];
  DateTime date = DateTime.now();
  final Local = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10'
  ];
  final Global = [
    '00',
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10'
  ];

  String dropdownValue1 = 'Per Unit';
  String dropdownValue2 = '00';
  String dropdownValue3 = '00';
  String dropdownValue4 = 'gm';
  bool but1 = false;
  bool but2 = false;
  int start1 = 0;
  int start2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            'Add Dish Item',
            style: TextStyle(
                fontFamily: 'Calibre', fontSize: 18, color: khometextcolor3),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Calibre',
                    color: khometextcolor3,
                  ),
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Dish Name",
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter File Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 195,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Calibre',
                          color: khometextcolor3,
                        ),
                        controller: priceController,
                        decoration: InputDecoration(
                          labelText: "Dish Price",
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter File Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: 102,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: DropdownButtonFormField(
                          value: dropdownValue1,
                          items: Items.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(
                                value,
                                style: TextStyle(
                                  fontFamily: 'Calibre',
                                  fontSize: 20,
                                  color: khometextcolor3,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue1 = newValue;
                            });
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Select Item';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Calibre',
                      color: khometextcolor3),
                  controller: servingntroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Total Serving Count",
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter serving count';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      but1
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    but1 = false;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: khometextcolor1,
                                  size: 16,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    but1 = true;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: khometextcolor2,
                                  size: 16,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Local',
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              fontSize: 16,
                              color: khometextcolor3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 74,
                          height: 24,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '$start2',
                                style: TextStyle(
                                  fontFamily: 'Calibre',
                                  fontSize: 16,
                                  color: khometextcolor3,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start2 > 0) {
                                          start2++;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start2 > 0) {
                                          start2--;
                                        } else {
                                          start2 = 0;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      but2
                          ? Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    but2 = false;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: khometextcolor1,
                                  size: 16,
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    but2 = true;
                                  });
                                },
                                child: Icon(
                                  Icons.check_circle,
                                  color: khometextcolor2,
                                  size: 16,
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Global',
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              fontSize: 16,
                              color: khometextcolor3),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          width: 74,
                          height: 24,
                          child: Row(
                            children: <Widget>[
                              Text(
                                '$start1',
                                style: TextStyle(
                                  fontFamily: 'Calibre',
                                  fontSize: 16,
                                  color: khometextcolor3,
                                ),
                              ),
                              Column(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start1 > 0) {
                                          start1++;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start1 > 0) {
                                          start1--;
                                        } else {
                                          start1 = 0;
                                        }
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 195,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Calibre',
                            color: khometextcolor3,
                          ),
                          controller: priceController,
                          decoration: InputDecoration(
                            labelText: "In 1 Service Count",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter File Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: 102,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: DropdownButtonFormField(
                            value: dropdownValue4,
                            items: units.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(
                                    fontFamily: 'Calibre',
                                    fontSize: 20,
                                    color: khometextcolor3,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue4 = newValue;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Select Item';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: 195,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Calibre',
                            color: khometextcolor3,
                          ),
                          controller: priceController,
                          decoration: InputDecoration(
                            labelText: "Dish Supply Time",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter File Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: 102,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 17),
                          child: DropdownButtonFormField(
                            value: dropdownValue1,
                            items: Items.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(
                                  value,
                                  style: TextStyle(
                                    fontFamily: 'Calibre',
                                    fontSize: 20,
                                    color: khometextcolor3,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue1 = newValue;
                              });
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please Select Item';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
