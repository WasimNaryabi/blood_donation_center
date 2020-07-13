import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blooddonationcenter/UI/profile_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


class AddDonationHistory extends StatefulWidget {
  @override
  _AddDonationHistoryState createState() => _AddDonationHistoryState();
}

class _AddDonationHistoryState extends State<AddDonationHistory> {

  var id;

  static final API_URL =
      'http://www.fonesolutions31.com/BloodDonationCenterApi/apies/add-donation.php';

  static var _cityname = [
    'Peshawar',
    'Lahor',
    'Karachi',
    'Quitta',
    'Islamabad',
    'Hangu'
  ];
  String _selectedValue = "Peshawar";

  TextEditingController _hospitalController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String selectedValues;

  bool isConnected;
  var result;

  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    id = sharedPrefs.getString('id');
  }

  @override
  void initState() {
    _getPreferences().whenComplete(() {
      setState(() {});

    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: BackButton(color:Colors.red),
            title: Text("Add Donation",style: TextStyle(fontSize: 22.0,color: Colors.red),),
          ),
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(""),
                    Text(
                      "Add Your last Donation Details",
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                )
                              ]),
                          child: Form(
                            key: _formKey1,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 20.0,
                                        right: 10.0,
                                        left: 10.0,
                                        bottom: 10.0),
                                    child: TextFormField(
                                      controller: _hospitalController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Hospital is required';
                                        }  else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        //icon: Icon(Icons.mail),
                                        labelText: "Hospital Name",
                                        hintText: "Hospital Name",
                                        enabledBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(
                                              color: Colors.red, width: 0.0),
                                        ),
                                        labelStyle:
                                            new TextStyle(color: Colors.red),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.0)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.red),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7.0)),
                                          borderSide: BorderSide(
                                              width: 1, color: Colors.blue),
                                        ),
                                        errorStyle: TextStyle(
                                          color: Colors.blue,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(7.0)),
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Container(
                                    height:
                                    MediaQuery.of(context).size.height / 9,
                                    margin: EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Container(
                                            child: Text(
                                              "Select City",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0))),
                                              child: Theme(
                                                data: Theme.of(context).copyWith(
                                                  canvasColor: Colors.red,
                                                ),
                                                child: DropdownButton(
                                                  underline: SizedBox(),
                                                  isExpanded: true,
                                                  icon: Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  items: _cityname.map((String
                                                  dropDownStringItem) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                        value: dropDownStringItem,
                                                        child: Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                left: 10.0),
                                                            child: Text(
                                                              dropDownStringItem,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )));
                                                  }).toList(),
                                                  value: _selectedValue,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16.0),
                                                  onChanged: (userSelectdValue) {
                                                    setState(() {
                                                      _selectedValue =
                                                          userSelectdValue;
                                                    });
                                                  },
                                                ),
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  /**/
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: RaisedButton(
                                                color: Colors.blue,
                                                child: Text(
                                                  "Add Donation",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  FocusScope.of(context).unfocus();
                                                  if(_formKey1.currentState.validate()){

                                                    _checkConnectivity()
                                                        .then((result) async {
                                                      if (result == true) {
                                                        _showSnackbar();
                                                        String hospital = _hospitalController.text;
                                                        var currentDate =  DateFormat.yMMMd().format(new DateTime.now());

                                                        _addDonationHistory(id, _selectedValue,currentDate,hospital);

                                                      }
                                                    });

                                                  }
                                                }))
                                      ],
                                    )),

                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }


  _addDonationHistory(member_id, city,date,hospital) {
    http.post(API_URL,
        body: {'member_id': member_id, 'city': city,'date':date,'hospital':hospital}).then((response) {
      var responseerror = response.statusCode;
      print(responseerror);

      Map mapRes = json.decode(response.body);
      var error = mapRes['success'];
      var message = mapRes['message'];
      if (error == 0) {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _showDialog("Error Message", message);
      } else {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _save('lastdonation', date);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ProfileScreen()));
        _showDialog('Success Message', message);
      }
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop();
    false;
  }

  _showDialog(title, text) {
    var alertDialog = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: <Widget>[],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  Future<bool> _checkConnectivity() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  _showSnackbar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(backgroundColor: Colors.red),
          Text(
            "Your New Donation adding...",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ));
  }

  _save(String key, dynamic value) async {
    final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    if (value is bool) {
      sharedPrefs.setBool(key, value);
    } else if (value is String) {
      sharedPrefs.setString(key, value);
    } else if (value is int) {
      sharedPrefs.setInt(key, value);
    } else if (value is double) {
      sharedPrefs.setDouble(key, value);
    } else if (value is List<String>) {
      sharedPrefs.setStringList(key, value);
    }
  }

}
