import 'package:blooddonationcenter/UI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var id;
  var name;
  var email;
  var contact;
  var bloodgroup;
  var address;
  var city;
  var lastdonation;
  var islogined;

  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance();
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: BackButton(color:Colors.red),
          title: Text("Profile",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/3,
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,

                      )
                    ]
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,

                            )
                          ]
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child:Text(name,style: TextStyle(color: Colors.white,fontSize: 18.0),)
                            ),
                          ),
                          Expanded(
                            child:  Container(
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Update",style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.mail,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text(email),


                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text(contact),


                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.home,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text(address),


                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            width: 25.0,
                            height: 25.0,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text(city),

                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 10.0, bottom: 1.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                        )
                      ]),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Last Donation",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20.0),
                                )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: GestureDetector(
                                  onTap: () {

                                  },
                                  child: Text(
                                    "Set",
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.blue),
                                    textAlign: TextAlign.right,
                                  )),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Date : $lastdonation",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25.0),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(

                margin: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(

                      child: Row(
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left:1.0,right: 5.0,top: 5.0,bottom: 10.0),
                              child:Text("Blood Donation History",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/5,
                      child: Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(1.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black38,
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,

                                  )
                                ]
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 15.0),)
                                ),

                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Icon(Icons.local_hospital,color: Colors.white,size: 18,)
                                  ),
                                ),
                                Text("Hospital Address"),
                                Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                  ),
                                ),
                                Text("City name"),


                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    false;
  }
}
