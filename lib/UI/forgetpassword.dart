import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:blooddonationcenter/UI/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mailer2/mailer.dart';
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

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {


  var id;
  var options = new GmailSmtpOptions()
    ..username = 'blood.donation.center2020@gmail.com'
    ..password = 'Blood2020';

  static final FORGET_PASSWORD_URL =
      'http://www.fonesolutions31.com/BloodDonationCenterApi/apies/forgetpassword.php';

  TextEditingController _emailController = TextEditingController();

  final _formKey1 = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  @override
  void initState() {

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
                      "Forget Password",
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
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: RaisedButton(
                                                color: Colors.blue,
                                                child: Text(
                                                  "Check",
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
                                                        print("Email: $email");
                                                        _SendPassword(
                                                            email);
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
                                                    LoginScreen()));
                                      },
                                      child: Text(
                                        "Go to Login",
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


  _SendEmail(email,password){
    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
    /*..from = 'foo@bar.com'*/
      ..recipients.add(email)
    /*..bccRecipients.add('hidden@recipient.com')*/
      ..subject = 'Your Account Password'
      ..text = 'Asalam O Alikom Here is your password.'
      ..html = '<h2>Asalam O Alikom Here is your password.</h2><h4>Email: </h4><p>$email</p><h4>Password: </h4><p>$password</p>';

    // Email it.
    emailTransport.send(envelope)
        .then((envelope) => print('Email sent! to $email'))
        .catchError((e) => print('Error occurred: $e'));
  }

  _SendPassword(email) {
    http.post(FORGET_PASSWORD_URL,
        body: {'email': email}).then((response) {
      var responseerror = response.statusCode;
      print(responseerror);
      Map mapRes = json.decode(response.body);
      var error = mapRes['success'];
      var password =mapRes['password'];
      if (error == 0) {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _showDialog("Message", "No user found on this email");
      } else {
        _scaffoldKey.currentState.hideCurrentSnackBar();
        _SendEmail(email,password);
        _showDialog("Message", "Please Check your email.");
      }
    });
  }

  _showSnackbar() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.white,
      content: Row(
        children: <Widget>[
          CircularProgressIndicator(backgroundColor: Colors.red),
          Text(
            "  Searching .....",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ));
  }

  Future<bool> _onBackPressed() {

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


}
