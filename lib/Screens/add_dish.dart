import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Classes/Constants.dart';
import '../Classes/Constants.dart';
import 'package:path/path.dart' as p;

class Additem extends StatefulWidget {
  @override
  _AdditemState createState() => _AdditemState();
}
Future<String>additem(String quantity,String price,String productName) async {
  HttpClient httpClient = new HttpClient();
  final String apiUrl="https://yhoq67i030.execute-api.ap-south-1.amazonaws.com/dev/addOffering";
  Map map = {"phoneNumber":"+919718764559",
    "quantity": quantity,
    "pickupLocation": {
      "Long": 343434,
      "Lat": 232323
    },
    "price": price,
    "productName": productName,
    "userId": "5cb84df7-4bb6-4dfa-a4f6-9651ba6fd414"
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
class _AdditemState extends State<Additem> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final servingntroller = TextEditingController();
  final supplydateController = TextEditingController();
  final OrderdateController = TextEditingController();
  final LocationController = TextEditingController();
  final DesciptionController = TextEditingController();

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
  bool but3 = false;

  int start1 = 0;
  int start2 = 0;
  String fileType = '';
  File fileDish;
  String fileName = '';
  String operationText = '';
  bool isUploaded = true;
  String result = '';

  Future filePickerimg(BuildContext context) async {
    if (fileType == 'image') {
      fileDish = await FilePicker.getFile(type: FileType.image);
      setState(() {
        fileName = p.basename(fileDish.path);
      });

      print(fileName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return Container(
              child: new Wrap(
                children: <Widget>[
                  new Container(
                    width: pWidth,
                    height: 54,
                    color: Color.fromRGBO(43, 80, 117, 1),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          'Upload Dish Images',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Calibre',
                              fontSize: 15,
                              letterSpacing: 1.07),
                        ),
                      ),
                    ),
                  ),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo,
                      color: khometextcolor1,
                    ),
                    title: new Text('Gallery'),
                    onTap: () {
                      setState(() {
                        fileType = 'image';
                      });
                      filePickerimg(context);
                    },
                  ),
                  new ListTile(
                    leading: new Icon(
                      Icons.photo_camera,
                      color: khometextcolor1,
                    ),
                    title: new Text('Camera'),
                    onTap: () => {},
                  ),
                  new ListTile(
                    leading: new Icon(
                      Icons.search,
                      color: khometextcolor1,
                    ),
                    title: new Text('Search Web'),
                    onTap: () => {},
                  ),
                  SizedBox(
                    height: pHeight * 0.01,
                  ),
                ],
              ),
            );
          });
    }

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
                      return 'Enter Dish Name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: pHeight * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: pWidth * 0.54,
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
                            return 'Enter Dish Price';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SizedBox(
                      width: pWidth * 0.3,
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
                  height: pHeight * 0.01,
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
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                        padding:
                            const EdgeInsets.only(top: 5, left: 5, bottom: 0),
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
                          width: pWidth * 0.21,
                          height: pHeight * 0.15,
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
                                    padding: EdgeInsets.only(bottom: 0),
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start2 >= 0) {
                                          start2++;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.only(top: 0),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
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
                          width: pWidth * 0.24,
                          height: pHeight * 0.15,
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
                                    padding: EdgeInsets.only(bottom: 0),
                                    icon: Icon(
                                      Icons.arrow_drop_up,
                                      color: khometextcolor3,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (start1 >= 0) {
                                          start1++;
                                        }
                                      });
                                    },
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.only(top: 0),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
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
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: pWidth * 0.54,
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
                              return 'Enter Service Count';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SizedBox(
                        width: pWidth * 0.3,
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
                    children: <Widget>[
                      SizedBox(
                        width: pWidth * 0.85,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Calibre',
                            color: khometextcolor3,
                          ),
                          controller: supplydateController,
                          decoration: InputDecoration(
                            labelText: "Dish Supply Date & Time",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Dish Supply Time';
                            }
                            return null;
                          },
                        ),
                      ),
                      Icon(
                        Icons.access_time,
                        color: khometextcolor1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: pWidth * 0.85,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Calibre',
                            color: khometextcolor3,
                          ),
                          controller: OrderdateController,
                          decoration: InputDecoration(
                            labelText: "Order Close Date & Time",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Dish Supply Time';
                            }
                            return null;
                          },
                        ),
                      ),
                      Icon(
                        Icons.access_time,
                        color: khometextcolor1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: pWidth * 0.85,
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Calibre',
                            color: khometextcolor3,
                          ),
                          controller: LocationController,
                          decoration: InputDecoration(
                            labelText: "Supply Location",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Supply Location';
                            }
                            return null;
                          },
                        ),
                      ),
                      Icon(
                        Icons.my_location,
                        color: khometextcolor1,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: pWidth * 0.9,
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Calibre',
                      color: khometextcolor3,
                    ),
                    controller: DesciptionController,
                    decoration: InputDecoration(
                      labelText: "Description",
                    ),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Supply Description';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Row(
                  children: <Widget>[
                    but3
                        ? Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  but3 = false;
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
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  but3 = true;
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
                      padding: const EdgeInsets.only(top: 5, left: 10),
                      child: Text(
                        'Veg',
                        style: TextStyle(
                            fontFamily: 'Calibre',
                            fontSize: 16,
                            color: khometextcolor3),
                      ),
                    ),
                    SizedBox(
                      width: pWidth * 0.37,
                    ),
                    but3
                        ? Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  but3 = false;
                                });
                              },
                              child: Icon(
                                Icons.check_circle,
                                color: khometextcolor2,
                                size: 16,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  but3 = true;
                                });
                              },
                              child: Icon(
                                Icons.check_circle,
                                color: khometextcolor1,
                                size: 16,
                              ),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Text(
                        'Non-Veg',
                        style: TextStyle(
                            fontFamily: 'Calibre',
                            fontSize: 16,
                            color: khometextcolor3),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.03,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'ADD Dish IMAGES',
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
                      'Upload high resolution image only',
                      style: TextStyle(
                          color: kTextColor,
                          fontFamily: 'Calibre',
                          fontSize: pHeight * 0.02),
                    ),
                    (fileDish == null)
                        ?
                    SizedBox(
                      height: pHeight * 0.08,
                      child: InkWell(
                        onTap: () {
                          _settingModalBottomSheet(context);
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
                    Image.file(fileDish)
                    ),
                  ],
                ),
                SizedBox(
                  height: pHeight * 0.04,
                ),
                InkWell(
                  onTap: () async {
                    final String quantity = servingntroller.text;
                    final String price = priceController.text;
                    final String productName = nameController.text;
                    await additem(quantity, price, productName);
                    Fluttertoast.showToast(
                        msg: "Your item is added successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,

                        backgroundColor: Colors.transparent,
                        textColor: Colors.black12,
                        fontSize: 16.0
                    );
                  },

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
                          'SUBMIT',
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
        ),
      ),
    );
  }
}
