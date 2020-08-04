import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
  String dropdownValue1 = 'Per Unit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Add Dish Item',
          style: TextStyle(
              fontFamily: 'Calibre',
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 5),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Calibre',
                      fontWeight: FontWeight.bold),
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
                  height: 30,
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
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
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
                  height: 30,
                ),
                TextFormField(
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Calibre',
                      fontWeight: FontWeight.bold),
                  controller: servingntroller,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
