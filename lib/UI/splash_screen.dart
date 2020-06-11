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
        margin: EdgeInsets.only(top:200.0),
      child:Center(
        child: Column(
          children: <Widget>[
            Image.asset('images/logo.png'),
            Text(""),
            Text("Blood Donation",style: TextStyle(fontSize: 22.0,color: Colors.white),),
            Text("Center",style: TextStyle(fontSize: 22.0,color: Colors.white)),
          ],
        ),
      ),
      )
    );
  }
}