import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/navbar.dart';

class AddBankDetails extends StatefulWidget {
  String profilephotourl, aadharurl, videourl;
  AddBankDetails(this.profilephotourl, this.aadharurl, this.videourl);
  @override
  _AddBankDetailsState createState() => _AddBankDetailsState();
}

class _AddBankDetailsState extends State<AddBankDetails> {
  TextEditingController bankController = new TextEditingController(text: '');
  TextEditingController accountController = new TextEditingController(text: '');
  TextEditingController ifscController = new TextEditingController(text: '');
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
                              color: Colors.white,
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
                    controller: bankController,
                    validator: (value) {
                      if (value.length < 5) {
                        return 'Invalid bank name';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      labelText: 'Select Bank',
                      labelStyle: TextStyle(
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
                    controller: accountController,
                    validator: (value) {
                      if (value.length < 14) {
                        return 'Invalid account number';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      labelText: 'Account Number',
                      labelStyle: TextStyle(
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
                    controller: ifscController,
                    validator: (value) {
                      if (value.length < 8) {
                        return 'Invalid IFSC code';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      labelText: 'IFSC Code',
                      labelStyle: TextStyle(
                          fontFamily: 'Calibre',
                          color: Colors.black.withOpacity(0.75),
                          fontSize: pHeight * 0.024),
                    ),
                  ),
                ),
                Spacer(),
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
                      MaterialPageRoute(
                        builder: (context) => Navbar(),
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
                        'SUBMIT',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Calibre',
                            fontSize: pHeight * 0.022),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.025,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
