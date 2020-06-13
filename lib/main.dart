
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './UI/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var isLogined;
  _isLogned() async{
    var sharedPrefs = await SharedPreferences.getInstance();// Save a value
    // preferences.setString('value_key', 'hello preferences');// Retrieve value later
    isLogined = sharedPrefs.getBool('isLogin');

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Donation Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}


