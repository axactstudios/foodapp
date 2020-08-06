import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/navbar.dart';



class AddBankDetails extends StatefulWidget {
  String profilephotourl, aadharurl, videourl ,address, pin, state, country,phonenumber,otp,email,name;
  AddBankDetails(this.profilephotourl, this.aadharurl, this.videourl,this.address,this.pin,this.state,this.country,this.phonenumber,this.otp,this.email,this.name);
  @override
  _AddBankDetailsState createState() => _AddBankDetailsState();
}
Future<String>sendDetails(String bankname,String accountNumber, String ifsccode,String profilephotourl, String aadharurl, String videourl ,String address, String pin, String  state,String country,String phonenumber,String otp,String email)async{
  HttpClient httpClient = new HttpClient();
  final String apiUrl="https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/registerProvider";
  Map map = {"phoneNumber": phonenumber,
    "otpValue":otp,
    "appId":"food",
    "requestType":"verify",
    "type" : "provider",
    "email" : email,
    "address" : address,
    "country" : country,
    "state"  : state,
    "pincode" : pin,
    "documentType"  :" voter",
    "documentPhoto" : aadharurl,
    "userProfilePhoto" : profilephotourl,
    "kitchenVideo" : videourl,
    "bankname": bankname,
    "accountNumber" : accountNumber,
    "ifsc_code" : ifsccode
  };
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(apiUrl));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(json.encode(map)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  return reply;
}

class _AddBankDetailsState extends State<AddBankDetails> {
  TextEditingController bankController = new TextEditingController(text: '');
  TextEditingController accountController = new TextEditingController(text: '');
  TextEditingController ifscController = new TextEditingController(text: '');

  saveBankDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('bank', bankController.text);
    prefs.setString('account', accountController.text);
    prefs.setString('ifsc', ifscController.text);
  }

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
                      if (value.isEmpty) {
                        return 'Invalid Bank Name';
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
                      if (value.length < 11) {
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
                  onTap: () async{
                   final String otp=widget.otp;
                   final String phonenumber=widget.phonenumber;
                   final String email=widget.email;
                   final String address=widget.address;
                   final String country=widget.country;
                   final String state=widget.state;
                   final String pin=widget.pin;
                   final String profilephotourl=widget.profilephotourl;
                   final String aadharurl=widget.aadharurl;
                   final String videourl=widget.videourl;
                   final String bankname=bankController.text;
                   final String accountNumber=accountController.text;
                   final String ifsccode=ifscController.text;
                   await sendDetails(bankname, accountNumber, ifsccode, profilephotourl, aadharurl, videourl, address, pin, state, country, phonenumber, otp, email);
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
