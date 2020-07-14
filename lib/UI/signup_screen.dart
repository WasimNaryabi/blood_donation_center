import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mailer2/mailer.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static var _bloodGroup = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  static var _cityname = [
    'Abbottabad',
    'Bannu',
    'Battagram',
    'Batkhela',
    'Charsadda',
    'Chitral',
    'Dera Ismail Khan',
    'Dir',
    'Faisalabad',
    'Gujranwala',
    'Gujrat',
    'Hangu',
    'Haripur',
    'Hyderabad',
    'Islamabad',
    'Jhang',
    'Jhelum',
    'Karak',
    'Karachi',
    'Kohat',
    'Lakki Marwat',
    'Lahore',
    'Mansehra',
    'Mianwali',
    'Multan',
    'Murree',
    'Mardan',
    'Nowshera',
    'Peshawar',
    'Quitta',
    'Rawalpindi',
    'Sargodha',
    'Sialkot',
    'Swabi',
    'Swat',
    'Tank',
    'Taxila',
  ];
  String _selectedValue = "Abbottabad";
  String _selectedBloodGroup = "A+";


  var options = new GmailSmtpOptions()
    ..username = 'blood.donation.center2020@gmail.com'
    ..password = 'Blood2020';

  static final API_URL =
      "http://www.fonesolutions31.com/BloodDonationCenterApi/apies/add-member.php";

  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String selectedValues;

  bool passwordVisible;

  @override
  void initState() {
    passwordVisible = true;
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
                    Image.asset(
                      'images/logo.png',
                      width: 80.0,
                      height: 80.0,
                    ),
                    Text(""),
                    Text(
                      "Member Registration",
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
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
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: 20.0,
                                      right: 10.0,
                                      left: 10.0,
                                      bottom: 10.0),
                                  child: TextFormField(
                                    controller: _nameController,
                                    validator: (value) => value.isEmpty
                                        ? 'Name is required'
                                        : null,
                                    decoration: InputDecoration(
                                      //icon: Icon(Icons.mail),
                                      labelText: "Name",
                                      hintText: "Name",
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
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: _contactController,
                                    validator: (value) => value.isEmpty
                                        ? 'Contact is required'
                                        : null,
                                    decoration: InputDecoration(
                                      labelText: "Contact",
                                      hintText: "Contact",
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
                                            passwordVisible = !passwordVisible;
                                          });
                                        },
                                      ),
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
                                            "Select BloodGroup",
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
                                                items: _bloodGroup.map((String
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
                                                value: _selectedBloodGroup,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0),
                                                onChanged: (userSelectdValue) {
                                                  setState(() {
                                                    _selectedBloodGroup =
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
                                  child: TextFormField(
                                    controller: _addressController,
                                    validator: (value) => value.isEmpty
                                        ? 'Address is required'
                                        : null,
                                    decoration: InputDecoration(
                                      // icon: Icon(Icons.lock),
                                      labelText: "Address",
                                      hintText: "Address",
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
                                          "Signup",
                                          style: TextStyle(
                                              fontSize: 22.0,
                                              color: Colors.white),
                                        ),
                                        onPressed: () async {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState
                                              .validate()) {
                                            _checkConnectivity()
                                                .then((result) async {
                                              if (result == true) {
                                                _showSnackbar();
                                                String name =
                                                    _nameController.text;
                                                String contact =
                                                    _contactController.text;
                                                String email =
                                                    _emailController.text;
                                                String password =
                                                    _passwordController.text;
                                                String city = _selectedValue;
                                                String bloodgroup =
                                                    _selectedBloodGroup;
                                                String address =
                                                    _addressController.text;

                                                _memberRegistration(
                                                    name,
                                                    email,
                                                    password,
                                                    contact,
                                                    bloodgroup,
                                                    address,
                                                    city);

                                              }
                                            });
                                          }
                                        },
                                      ))
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                                child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  LoginScreen()));
                                    },
                                    child: Text(
                                      "Already have member? Login",
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.red),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(""),
                    Text(""),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  _SendEmail(name, email, password){
    var emailTransport = new SmtpTransport(options);

    // Create our mail/envelope.
    var envelope = new Envelope()
    /*..from = 'foo@bar.com'*/
      ..recipients.add(email)
    /*..bccRecipients.add('hidden@recipient.com')*/
      ..subject = 'New Account Details'
      ..text = 'Account Details'
      ..html = '<h4>Asalam O Alikom, Welcome to Pakistan Blood Donation Center.</h4>'
               '<h5>Dear, $name</h5>'
               '<p>Your account is successfully create at BLOOD DONATION CENTER.</p>'
               '<p>Your account login details is following</p>'
               '<table border="1"><tr><th>Email: </th><td>$email</td></tr> '
               '<tr><th>Password: </th><td>$password</td></tr></table>'
               '<hr><h4>Thank you for join us <br> From Pakistan Blood Donation Center.</h4>';

    // Email it.
    emailTransport.send(envelope)
        .then((envelope) => print('Email sent! to $email'))
        .catchError((e) => print('Error occurred: $e'));
  }

  _memberRegistration(
      name, email, password, contact, bloodgroup, address, city) {
    http.post(API_URL, body: {
      'name': name,
      'email': email,
      'password': password,
      'contact': contact,
      'bloodgroup': bloodgroup,
      'address': address,
      'city': city
    }).then((response) {
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
        _SendEmail(name, email, password);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()));
        _showDialog('Success Message', message);
      }
    });
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
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
            "  Registration in progress ...",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
    ));
  }
}
