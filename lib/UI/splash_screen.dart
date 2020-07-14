import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'login_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
 var islogined;
  @override
  void initState() {
    super.initState();
    /*_getPreferences().whenComplete(() {
      setState(() {
        print("Message =>> $islogined");
      });});*/

      Timer(
          Duration(seconds: 2),
              () {

              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => LoginScreen()));

          }
      );


  }

  _getPreferences() async{
    var sharedPrefs = await SharedPreferences.getInstance();// Save a value

    islogined =sharedPrefs.getBool('islogin');

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Container(
        margin: EdgeInsets.only(top:0.0),
      child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 100.0,
              height: 100.0,
            ),
            Text(""),
            Text(
              "Blood Donation Center",
              style: TextStyle(fontSize: 22.0, color: Colors.white),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "v 1.0",
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
      )
    );
  }
}