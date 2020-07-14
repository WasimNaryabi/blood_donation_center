import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'post_blood_request.dart';
import 'package:http/http.dart' as http;

class BloodRequests{
  var id,name,contact,message,bloodgroup,date,units,address,city;

  BloodRequests({this.id,this.name, this.contact, this.message, this.bloodgroup,
    this.date, this.units, this.address, this.city});

  factory BloodRequests.fromJson(Map<String, dynamic> json){
    return BloodRequests(
      id:json['id'].toString(),
      name: json['name'].toString(),
      message: json['message'].toString(),
      contact: json['contact'].toString(),
      bloodgroup: json['bloodgroup'].toString(),
      units: json['units'].toString(),
      address: json['address'].toString(),
      city: json['city'].toString(),
      date: json['postdate'].toString(),

    );
  }


}

class MyBloodRequest extends StatefulWidget {
  @override
  _MyBloodRequestState createState() => _MyBloodRequestState();
}

class _MyBloodRequestState extends State<MyBloodRequest> {

  var id;


  static final DELETE_API_URL =
      'http://www.fonesolutions31.com/BloodDonationCenterApi/apies/delete-request.php';
  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    id = sharedPrefs.getString('id');
  }

  List<BloodRequests> bloodrequests =[];
  var list_lenght;
  static final API_URL ="http://www.fonesolutions31.com/BloodDonationCenterApi/apies/get-my-blood-request.php";

  Future<List<BloodRequests>> _getBloodRequests() async {
    var data = await http.post(API_URL,body: {
      'id':id
    });
    if (data.statusCode == 200) {
      var jsonData = json.decode(data.body);

      bloodrequests=(jsonData['requests'] as List)
          .map((p) => BloodRequests.fromJson(p))
          .toList();
      setState(() {
        list_lenght= bloodrequests.length;
      });
      return bloodrequests;
    }
    return null;
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
          title: Text("My Blood Requests",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add),
          elevation: 6,
          tooltip: "Add new blood request",
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => PostBloodrequest()));
          },
        ),
        body: ListView(children: <Widget>[
          Column(
            children:<Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: 5.0, right: 5.0, top: 1.0, bottom: 5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.15,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                  ),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: FutureBuilder<List<BloodRequests>>(
                          future: _getBloodRequests(),
                          builder: (BuildContext context, AsyncSnapshot snapshot){
                            if(snapshot.data == null){
                              print(snapshot.data);
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircularProgressIndicator(backgroundColor: Colors.red),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Text(
                                        "Loading...",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }else if(list_lenght < 1){
                              return Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(1.0)),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[

                                      Text(
                                        "You not post any request",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            else{
                              return ListView.builder(
                                  itemCount: list_lenght,
                                  itemBuilder: (BuildContext context, int index){
                                    return  Container(
                                      margin: EdgeInsets.only(bottom: 5.0,top: 5.0),
                                      padding: EdgeInsets.all(1.0),
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(1.0)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black38,
                                                    spreadRadius: 1.0,
                                                    blurRadius: 1.0,
                                                  )
                                                ]),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.all(5.0),
                                                      child: Text(
                                                        snapshot.data[index].name,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18.0),
                                                      )),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                      padding: EdgeInsets.all(10.0),
                                                      child: Text(
                                                        snapshot.data[index].date,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.0),
                                                        textAlign: TextAlign.right,
                                                      )),
                                                )

                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Container(
                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(1.0),
                                                            child: Icon(
                                                              Icons.mail,
                                                              color: Colors.white,
                                                              size: 18,
                                                            )),
                                                      ),
                                                      Flexible(
                                                        child:  Text(snapshot.data[index].message),
                                                      )
                                                    ],),
                                                  ) ,
                                                ),

                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Container(
                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(1.0),
                                                            child: Icon(
                                                              Icons.call,
                                                              color: Colors.white,
                                                              size: 18,
                                                            )),
                                                      ),
                                                      Text(snapshot.data[index].contact),
                                                    ],),
                                                  ) ,
                                                ),
                                                Expanded(
                                                  child:Container(
                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(1.0),
                                                            child: Icon(
                                                              Icons.location_city,
                                                              color: Colors.white,
                                                              size: 18,
                                                            )),
                                                      ),
                                                      Text(snapshot.data[index].city),
                                                    ],),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Container(
                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(1.0),
                                                            child: Icon(
                                                              Icons.place,
                                                              color: Colors.white,
                                                              size: 18,
                                                            )),
                                                      ),
                                                      Flexible(
                                                        child: Text(snapshot.data[index].address),
                                                      )
                                                    ],),
                                                  ) ,
                                                ),

                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Container(

                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(2.0),
                                                            child: Text(
                                                              snapshot.data[index].bloodgroup,
                                                              style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),
                                                              textAlign: TextAlign.center,

                                                            )),
                                                      ),
                                                      Text("Blood Group",textAlign: TextAlign.left),
                                                    ],),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:Container(
                                                    child: Row(children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.all(5.0),
                                                        width: 25.0,
                                                        height: 25.0,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    50.0))),
                                                        child: Padding(
                                                            padding: EdgeInsets.all(2.0),
                                                            child: Text(
                                                              snapshot.data[index].units,
                                                              style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),
                                                              textAlign: TextAlign.center,

                                                            )),
                                                      ),
                                                      Text("Units",textAlign: TextAlign.left),
                                                    ],),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                              padding: EdgeInsets.all(5.0),
                                              child:Row(
                                                children: <Widget>[
                                                  Expanded(
                                                      child: Container(),
                                                  ),
                                                  Expanded(
                                                      child:  RaisedButton(
                                                        color: Colors.blue,
                                                        child: Text("Delete",style: TextStyle(fontSize: 15.0,color: Colors.white),),
                                                        onPressed: (){

                                                          var id =snapshot.data[index].id;
                                                          print("Request ID:$id");
                                                          _deleteRequest(id);
                                                        },
                                                      )
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                ],
                                              )
                                          ),

                                        ],
                                      ),
                                    );
                                  });
                            }
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
        ),


      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop();
    false;
  }

  _deleteRequest(id){

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to delete this request'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
            },
            child: Text("NO",style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.blue,
                fontSize: 20.0),),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(false);
              print("Request ID:$id");
              _deleteBloodRequest(id);
            },
            child: Text("YES",style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.red,
                fontSize: 20.0),),
          ),
        ],
      ),
    ) ??
        false;

  }

  _deleteBloodRequest(id){
    http.post(DELETE_API_URL,
        body: {'id': id}).then((response) {
      var responseerror = response.statusCode;
      print(responseerror);

      Map mapRes = json.decode(response.body);
      var error = mapRes['success'];
      var message = mapRes['message'];
      if (error == 0) {
        _showDialog("Error Message", message);
      } else {
        _showDialog('Success Message', message);
      }
    });
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
}
