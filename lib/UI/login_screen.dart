import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'forgetpassword.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

/*class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String contact;
  final String bloodgroup;
  final String city;
  final String address;
  final String lastdonation;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.contact,
      this.bloodgroup,
      this.city,
      this.address,
      this.lastdonation});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['member_id'],
     // name: json['name'],
      email: json['email'],
      contact: json['contact'],
      bloodgroup: json['bloodgroup'],
      address: json['address'],
      city: json['city'],
      lastdonation: json['lastdonation'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["member_id"] = id;
    //map["name"] = name;
    map["email"] = email;
    map["password"]=password;
    map["contact"] = contact;
    map["bloodgroup"] = bloodgroup;
    map["address"] = address;
    map["city"] = city;
    map["lastdonation"] = lastdonation;

    return map;
  }
}

Future<User> loginUser(String url, {Map body}) async {
  return http.post(url, body: body).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return User.fromJson(json.decode(response.body));
  });
}*/

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  var id;

  var name;

  var email;

  var contact;

  var bloodgroup;

  var address;

  var city;

  var lastdonation;
  var islogined;

  static final CREATE_POST_URL =
      'http://www.fonesolutions31.com/BloodDonationCenterApi/apies/member-login.php';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String selectedValues;
  bool passwordVisible;

  bool isConnected;
  var result;

  @override
  void initState() {
    passwordVisible = true;
    _getPreferences().whenComplete(() {
      setState(() {});
      if (islogined) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.redAccent,
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(""),
                    Text(""),
                    Image.asset(
                      'images/logo.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    Text(""),
                    Text(
                      "Member Login",
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
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Email is required';
                                        } else if (!(EmailValidator.validate(
                                            value))) {
                                          return 'Please Enter valid Email Format';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        //icon: Icon(Icons.mail),
                                        labelText: "Email",
                                        hintText: "Email",
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
                                    padding: EdgeInsets.only(
                                        top: 20.0,
                                        right: 10.0,
                                        left: 10.0,
                                        bottom: 10.0),
                                    child: TextFormField(
                                      //autofocus: false,
                                      obscureText: passwordVisible,
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Password is Required';
                                        } else if (value.length < 8) {
                                          return 'Password must be atleast 8 letters';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: InputDecoration(
                                        //icon: Icon(Icons.mail),
                                        labelText: "Password",
                                        hintText: "Password",
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
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            passwordVisible
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    )),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                      EdgeInsets.only(right: 10.0,
                                          left: 10.0,top: 5.0, bottom: 1.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder:
                                                        (BuildContext context) =>
                                                            ForgetPasswordScreen()));
                                          },
                                          child: Text(
                                            "Forget Password?",
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 15.0, color: Colors.blueAccent),
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: RaisedButton(
                                                color: Colors.blue,
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                      fontSize: 22.0,
                                                      color: Colors.white),
                                                ),
                                                onPressed: () async {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  if (_formKey1.currentState
                                                      .validate()) {
                                                    _checkConnectivity()
                                                        .then((result) async {
                                                      if (result == true) {
                                                        _showSnackbar();
                                                        String email =
                                                            _emailController
                                                                .text;
                                                        String password =
                                                            _passwordController
                                                                .text;

                                                        _memberLogin(
                                                            email, password);
                                                      }
                                                    });
                                                  }
                                                }))
                                      ],
                                    )),
                                Container(
                                  margin:
                                      EdgeInsets.only(top: 5.0, bottom: 10.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SignupScreen()));
                                      },
                                      child: Text(
                                        "New Member? Create Account",
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.red),
                                      )),
                                )
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

  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance(); // Save a value
    //preferences.setString('value_key', 'hello preferences');// Retrieve value later
    id = sharedPrefs.getString('id');
    name = sharedPrefs.getString('name');
    email = sharedPrefs.getString('email');
    contact = sharedPrefs.getString('contact');
    bloodgroup = sharedPrefs.getString('bloodgroup');
    address = sharedPrefs.getString('address');
    city = sharedPrefs.getString('city');
    lastdonation = sharedPrefs.getString('lastdonation');
    islogined = sharedPrefs.getBool('islogin');
  }

  _memberLogin(email, password) {
    http.post(CREATE_POST_URL,
        body: {'email': email, 'password': password}).then((response) {
      var responseerror = response.statusCode;
      print(responseerror);

      Map mapRes = json.decode(response.body);
      var error = mapRes['error'];

      if (error) {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _showDialog("Message", "Invalide Eamil or Password \ntry again");
      } else {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        var id = mapRes['member_id'];
        var name = mapRes['name'];
        var email = mapRes['email'];
        var contact = mapRes['contact'];
        var bloodgroup = mapRes['bloodgroup'];
        var address = mapRes['address'];
        var city = mapRes['city'];
        var lastdonation = mapRes['lastdonation'];

        _save('id', id);
        _save('name', name);
        _save('email', email);
        _save('contact', contact);
        _save('bloodgroup', bloodgroup);
        _save('address', address);
        _save('city', city);
        _save('lastdonation', lastdonation);
        _save('islogin', true);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('Do you want to exit an App'),
            actions: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("NO"),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("YES"),
              ),
            ],
          ),
        ) ??
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
            "  Signing-In...",
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
