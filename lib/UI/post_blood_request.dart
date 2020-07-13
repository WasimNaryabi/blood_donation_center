import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'my_requests.dart';

class PostBloodrequest extends StatefulWidget {
  @override
  _PostBloodrequestState createState() => _PostBloodrequestState();
}

class _PostBloodrequestState extends State<PostBloodrequest> {
  static var _bloodGroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  static var _cityname = ['Peshawar','Lahor','Karachi','Quitta','Islamabad','Hangu'];
  String _selectedValue="Hangu";
  String _selectedBloodGroup="A+";

  TextEditingController _nameController= TextEditingController();
  TextEditingController _contactController=MaskedTextController(mask: "0000-0000000");
  TextEditingController _messageController=TextEditingController();
  TextEditingController _unitsController=TextEditingController();
  TextEditingController _addressController=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String selectedValues;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static final API_URL =
      "http://www.fonesolutions31.com/BloodDonationCenterApi/apies/post-request.php";

  var id;

  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    id = sharedPrefs.getString('id');
  }

  @override
  void initState() {
    super.initState();
    _getPreferences().whenComplete(() {
      setState(() {
      });
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
            title: Text("New Blood Request",style: TextStyle(fontSize: 22.0,color: Colors.red),),
          ),
          body: Container(

            child:ListView(
              children:<Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child:Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                spreadRadius: 1.0,
                                blurRadius: 1.0,

                              )
                            ]
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Text(""),
                              Image.asset('images/logo.png',width: 50.0,height: 50.0,),
                              Padding(
                                  padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                  child:TextFormField(
                                    controller: _nameController,
                                    validator: (value) => value.isEmpty?'Name is required':null,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.mail),
                                      labelText: "Name",
                                      hintText: "Name",
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                      ),
                                      labelStyle: new TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.red),
                                      ),
                                      errorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.blue),
                                      ),
                                      errorStyle: TextStyle(color:Colors.blue,),
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _contactController,
                                    validator: (value) {if (value.isEmpty) {
                              return 'Contact is Required';
                              } else if (value.length < 12) {
                        return 'Enter valid phone number e.g (0300-0000000)';
                        } else {
                        return null;
                        }},
                                    decoration: InputDecoration(
                                      labelText: "Contact",
                                      hintText: "Contact",
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                      ),
                                      labelStyle: new TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.red),
                                      ),
                                      errorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.blue),
                                      ),
                                      errorStyle: TextStyle(color:Colors.blue,),
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                  child:TextFormField(
                                    controller: _messageController,
                                    validator: (value) => value.isEmpty?'Message is required':null,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.mail),
                                      labelText: "Message",
                                      hintText: "Message",
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                      ),
                                      labelStyle: new TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.red),
                                      ),
                                      errorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.blue),
                                      ),
                                      errorStyle: TextStyle(color:Colors.blue,),
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height/9,
                                  margin: EdgeInsets.all(5.0),

                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(

                                          child: Text("Select BloodGroup",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5.0))
                                            ),
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                canvasColor: Colors.red,
                                              ),
                                              child: DropdownButton(
                                                underline: SizedBox(),
                                                isExpanded: true,
                                                icon: Icon(Icons.arrow_drop_down,size: 20,color: Colors.white,),
                                                items: _bloodGroup.map((String dropDownStringItem) {
                                                  return DropdownMenuItem<String>(
                                                      value: dropDownStringItem,
                                                      child:Padding(
                                                          padding: EdgeInsets.only(left: 10.0),
                                                          child: Text(dropDownStringItem,style: TextStyle(color: Colors.white),)
                                                      )
                                                  );
                                                }).toList(),
                                                value: _selectedBloodGroup,
                                                style: TextStyle(color: Colors.black, fontSize: 16.0),
                                                onChanged: (userSelectdValue) {
                                                  setState(() {
                                                    _selectedBloodGroup =userSelectdValue;

                                                  });
                                                },
                                              ),
                                            )
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                /**/
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                  child:TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _unitsController,
                                    validator: (value) => value.isEmpty?'Units is required':null,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.mail),
                                      labelText: "Units",
                                      hintText: "Units",
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                      ),
                                      labelStyle: new TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.red),
                                      ),
                                      errorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.blue),
                                      ),
                                      errorStyle: TextStyle(color:Colors.blue,),
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                    ),
                                  )
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:TextFormField(
                                    controller: _addressController,
                                    validator: (value) => value.isEmpty?'Address is required':null,
                                    decoration: InputDecoration(

                                      // icon: Icon(Icons.lock),
                                      labelText: "Address",
                                      hintText: "Address",
                                      enabledBorder: const OutlineInputBorder(
                                        // width: 0.0 produces a thin "hairline" border
                                        borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                      ),
                                      labelStyle: new TextStyle(color: Colors.red),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.red),
                                      ),
                                      errorBorder:OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                        borderSide: BorderSide(width: 1,color: Colors.blue),
                                      ),
                                      errorStyle: TextStyle(color:Colors.blue,),
                                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Container(
                                  height: MediaQuery.of(context).size.height/9,
                                  margin: EdgeInsets.all(5.0),

                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(

                                          child: Text("Select City",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(


                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius: BorderRadius.all(Radius.circular(5.0))
                                            ),
                                            child: Theme(
                                              data: Theme.of(context).copyWith(
                                                canvasColor: Colors.red,
                                              ),
                                              child: DropdownButton(
                                                underline: SizedBox(),
                                                isExpanded: true,
                                                icon: Icon(Icons.arrow_drop_down,size: 20,color: Colors.white,),
                                                items: _cityname.map((String dropDownStringItem) {
                                                  return DropdownMenuItem<String>(
                                                      value: dropDownStringItem,
                                                      child:Padding(
                                                          padding: EdgeInsets.only(left: 10.0),
                                                          child: Text(dropDownStringItem,style: TextStyle(color: Colors.white),)
                                                      )
                                                  );
                                                }).toList(),
                                                value: _selectedValue,
                                                style: TextStyle(color: Colors.black, fontSize: 16.0),
                                                onChanged: (userSelectdValue) {
                                                  setState(() {
                                                    _selectedValue =userSelectdValue;

                                                    /*  Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (BuildContext context) => SearchBlood()));
                                              debugPrint("You selected $userSelectdValue");*/
                                                  });
                                                },
                                              ),
                                            )
                                        ),
                                      )

                                    ],
                                  ),
                                ),
                                /**/
                              ),
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Row(
                                    children: <Widget>[
                                      Expanded(
                                          child:  RaisedButton(
                                            color: Colors.blue,
                                            child: Text("Submit",style: TextStyle(fontSize: 22.0,color: Colors.white),),
                                            onPressed: (){
                                              FocusScope.of(context).unfocus();
                                              if(_formKey.currentState.validate()){

                                                _checkConnectivity()
                                                    .then((result) async {
                                                  if (result == true) {
                                                    _showSnackbar();
                                                    String name = _nameController.text;
                                                    String contact = _contactController.text;
                                                    String message = _messageController.text;
                                                    String units = _unitsController.text;
                                                    String address = _addressController.text;
                                                    var currentDate =  DateFormat.yMMMd().format(new DateTime.now());

                                                    _newBloodDonationRequest(
                                                        id,name, message, units, contact, _selectedBloodGroup, address, _selectedValue,currentDate);

                                                  }
                                                });

                                              }
                                            },
                                          )
                                      )
                                    ],
                                  )
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),
              ],
            ),
          )
      ),
    );
  }

  _newBloodDonationRequest(
      member_id,name, message, units, contact, bloodgroup, address, city,date) {

    http.post(API_URL, body: {
      'member_id':member_id,
      'name': name,
      'message': message,
      'contact': contact,
      'bloodgroup': bloodgroup,
      'units': units,
      'city': city,
      'date':date,
      'hospital': address

    }).then((response) {
      var responseerror = response.statusCode;

      Map mapRes = json.decode(response.body);
      var error = mapRes['success'];
      var message = mapRes['message'];
      if (error == 0) {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _showDialog("Error Message", message);
      } else {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyBloodRequest()));
        _showDialog('Success Message', message);
      }

    });
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => MyBloodRequest()));
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
            "  Request in progress ...",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ));
  }
}
