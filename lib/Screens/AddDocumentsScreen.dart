import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/AddBankDetailsScreen.dart';

class AddDocuments extends StatefulWidget {
  String address, pin, state, country,phonenumber,otp,email,name;
  AddDocuments(this.address, this.pin, this.state, this.country,this.phonenumber,this.otp,this.email,this.name);
  @override
  _AddDocumentsState createState() => _AddDocumentsState();
}

class _AddDocumentsState extends State<AddDocuments> {
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
              width: pWidth,
              fit: BoxFit.fill,
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
                              color: Colors.white.withOpacity(0.65),
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
                              color: Colors.white,
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
                  height: pHeight * 0.12,
                  width: pHeight * 0.12,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 225, 232, 1),
                    borderRadius: BorderRadius.circular(pHeight * 0.12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: kButtonColor,
                      size: pHeight * 0.035,
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.015,
                ),
                Text(
                  'ADD PROFILE PHOTO',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Calibre',
                      fontSize: pHeight * 0.022),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                SizedBox(
                  width: pWidth * 0.85,
                  child: Divider(
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                Container(
                  width: pWidth * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'ADD IMAGE',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibre',
                                fontSize: pHeight * 0.022),
                          ),
                          Icon(
                            Icons.info,
                            color: Colors.black.withOpacity(0.6),
                            size: pHeight * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: pHeight * 0.005,
                      ),
                      Text(
                        'Make sure your id proof should not be blur.',
                        style: TextStyle(
                            color: kTextColor,
                            fontFamily: 'Calibre',
                            fontSize: pHeight * 0.02),
                      ),
                      SizedBox(
                        height: pHeight * 0.008,
                      ),
                      Container(
                        height: pHeight * 0.1,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 225, 232, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cloud_upload,
                                color: kButtonColor,
                                size: pHeight * 0.05,
                              ),
                              SizedBox(
                                width: pWidth * 0.04,
                              ),
                              Text(
                                'Upload Here',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Calibre',
                                    fontSize: pHeight * 0.022),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                SizedBox(
                  width: pWidth * 0.85,
                  child: Divider(
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                Container(
                  width: pWidth * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'ADD KITCHEN VIDEO',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Calibre',
                                fontSize: pHeight * 0.022),
                          ),
                          Icon(
                            Icons.info,
                            color: Colors.black.withOpacity(0.6),
                            size: pHeight * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: pHeight * 0.005,
                      ),
                      Text(
                        'File size should be 5MB max.',
                        style: TextStyle(
                            color: kTextColor,
                            fontFamily: 'Calibre',
                            fontSize: pHeight * 0.02),
                      ),
                      SizedBox(
                        height: pHeight * 0.008,
                      ),
                      Container(
                        height: pHeight * 0.2,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 225, 232, 1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.cloud_upload,
                                color: kButtonColor,
                                size: pHeight * 0.05,
                              ),
                              SizedBox(
                                width: pWidth * 0.04,
                              ),
                              Text(
                                'Upload Here',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Calibre',
                                    fontSize: pHeight * 0.022),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                SizedBox(
                  width: pWidth,
                  child: Divider(
                    color: kTextColor,
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            AddBankDetails('abcd', 'efgh', 'ijkl',widget.address,widget.pin,widget.state,widget.country,widget.phonenumber,widget.otp,widget.email,widget.name),
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
