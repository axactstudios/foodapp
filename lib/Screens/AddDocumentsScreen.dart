import 'dart:io';
import 'dart:convert';

import 'package:aws_s3/aws_s3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Classes/Constants.dart';
import 'package:foodapp/Screens/AddBankDetailsScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Classes/Constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/services.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:simple_s3/simple_s3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDocuments extends StatefulWidget {
  String address, pin, state, country, phonenumber, otp, email, name;
  AddDocuments(this.address, this.pin, this.state, this.country,
      this.phonenumber, this.otp, this.email, this.name);
  @override
  _AddDocumentsState createState() => _AddDocumentsState();
}

File fileProfilePhoto;
File fileIdPhoto;
File fileKitchenVideo;
File fileVideoDone;




class _AddDocumentsState extends State<AddDocuments> {
  bool but1 = false;
  String fileType = '';
  File file;
  File fileProfilePhoto;
  File fileIdPhoto;
  File fileKitchenVideo;
  String fileName = '';
  String operationText = '';
  bool isUploaded = true;
  String result = '';

  Future filePickerimg(BuildContext context) async {

    if (fileType == 'image') {
      fileProfilePhoto = await FilePicker.getFile(type: FileType.image);
      setState(() {
        fileName = p.basename(fileProfilePhoto.path);
      });
      print(fileName);
    }
  }
  Future filePickerid(BuildContext context) async {

    if (fileType == 'image') {
      fileIdPhoto = await FilePicker.getFile(type: FileType.image);
      setState(() {
        fileName = p.basename(fileIdPhoto.path);
      });
      print(fileName);
    }
  }

  Future filePickervid(BuildContext context) async {
    if (fileType == 'video') {
      fileKitchenVideo = await FilePicker.getFile(type: FileType.video);
      _controller = VideoPlayerController.file(fileKitchenVideo)
        ..initialize();
      setState(() {
        fileName = p.basename(fileKitchenVideo.path);
      });
      print(fileName);
    }
  }
  VideoPlayerController _controller;
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  final Items = ['Aadhar Card', 'Voter Id Card', 'Pan Card', 'Others'];
  String dropdownValue1 = 'Aadhar Card';
  Widget build(BuildContext context) {
    _onAlertWithCustomContentPressed(context) {
      Alert(
          context: context,
          title: "ADD DOCUMENT",
          content: Column(
            children: <Widget>[
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Select Your ID Type",
                  labelStyle: TextStyle(
                      fontFamily: 'Calibre',
                      color: khometextcolor2,
                      fontSize: 20),
                ),
                value: dropdownValue1,
                items: Items.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(
                      value,
                      style: TextStyle(
                        fontFamily: 'Calibre',
                        fontSize: 16,
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
              (fileIdPhoto == null)
                  ?
              Container(
                height: 153,
                width: 234,
              )
              :
              (
              Image.file(fileIdPhoto)
              ),
              Row(
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
                      'Use This As Address Proof',
                      style: TextStyle(
                          fontFamily: 'Calibre',
                          fontSize: 16,
                          color: khometextcolor2),
                    ),
                  ),
                ],
              ),
            ],
          ),
          buttons: [
            DialogButton(
              onPressed: () async{
                setState(() {
                  fileType = 'image';
                });
                filePickerid(context);
              },
              color: khometextcolor1,
              child: Text(
                "ADD",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 15, letterSpacing: 1.07),
              ),
            )
          ]).show();
    }

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

                (fileProfilePhoto == null)
                    ?
                InkWell(
                  onTap: () {
                    setState(() {
                      fileType = 'image';
                    });
                    filePickerimg(context);
                  },
                  child: Container(
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
                )
                    :
                (
                    Image.file(fileProfilePhoto,
                      height: pHeight * 0.12,
                      width: pHeight * 0.12)
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
                      (fileIdPhoto == null)
                      ?
                      SizedBox(
                        height: pHeight * 0.08,

                        child: InkWell(
                          onTap: () {
                            _onAlertWithCustomContentPressed(context);
                          },
                          child: Container(
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
                        ),
                      )
                          :
                      (
                      Image.file(fileIdPhoto,
                        height: pHeight * 0.2,
                        width: pWidth)
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
                      (fileKitchenVideo == null)
                      ?
                      InkWell(
                        onTap: () {
                          Alert(
                              context: context,
                              title: "ADD YOUR VIDEO",
                              content: Column(
                                children: <Widget>[
                                  Container(
                                    width: pWidth,
                                    height: pHeight * 0.45,
                                  ),
                                ],
                              ),
                              buttons: [
                                DialogButton(
                                  onPressed: () {
                                    setState(() {
                                      fileType = 'video';
                                    });
                                    filePickervid(context);
                                  },
                                  color: khometextcolor1,
                                  child: Text(
                                    "ADD VIDEO",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 1.07),
                                  ),
                                )
                              ]).show();
                        },
                        child: Container(
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
                      )
                      :
                    Container(
                      width: pWidth,
                      height: pHeight * 0.25,
                      child: (
                      VideoPlayer(_controller)
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
                  onTap: () async{
                    /*String urlProfile = await SimpleS3.uploadFile(
                        file,
                        bucketName,
                        poolID,
                        AWSRegions.apSouth1,
                    );
                    String urlID = await SimpleS3.uploadFile(
                      file,
                      bucketName,
                      poolID,
                      AWSRegions.apSouth1,
                    );
                    String urlVideo = await SimpleS3.uploadFile(
                        file,
                        bucketName,
                        poolID,
                        AWSRegions.apSouth1,
                    );
                    saveURLDetails()
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('profile', urlProfile);
                      prefs.setString('id', urlID);
                      prefs.setString('video', urlVideo);*/

                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => AddBankDetails(
                            'abcd',
                            'efgh',
                            'ijkl',
                            widget.address,
                            widget.pin,
                            widget.state,
                            widget.country,
                            widget.phonenumber,
                            widget.otp,
                            widget.email,
                            widget.name),
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
