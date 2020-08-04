import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/AddDocumentsScreen.dart';

class AddAddress extends StatefulWidget {
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController addressController = new TextEditingController(text: '');
  TextEditingController countryController = new TextEditingController(text: '');
  TextEditingController stateController = new TextEditingController(text: '');
  TextEditingController pinController = new TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bg@3x.png',
              height: pHeight * 0.15,
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: pHeight * 0.02,
                ),
                Container(
                  height: pHeight * 0.15,
                  width: pWidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'BASIC DETAILS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD ADDRESS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white,
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD DOCUMENTS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                        Text(
                          'ADD BANK DETAILS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Calibre',
                              color: Colors.white.withOpacity(0.65),
                              fontSize: pHeight * 0.018),
                        ),
                        SizedBox(
                          width: pWidth * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: addressController,
                    validator: (value) {
                      if (value.length < 10) {
                        return 'Invalid phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Address',
                      suffixIcon: Icon(
                        Icons.gps_fixed,
                        color: kButtonColor.withOpacity(0.7),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: countryController,
                    validator: (value) {
                      if (value.length < 10) {
                        return 'Invalid phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Country',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: stateController,
                    validator: (value) {
                      if (value.length < 10) {
                        return 'Invalid phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'State',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Container(
                  width: pWidth * 0.8,
                  child: TextFormField(
                    controller: pinController,
                    validator: (value) {
                      if (value.length < 10) {
                        return 'Invalid phone number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Pin Code',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      hintStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AddDocuments(),
                      ),
                    );
                  },
                  child: Container(
                    width: pWidth * 0.6,
                    height: pHeight * 0.05,
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
                            fontSize: pHeight * 0.022),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
