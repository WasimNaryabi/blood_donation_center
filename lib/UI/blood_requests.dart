import 'dart:convert';

import 'package:blooddonationcenter/UI/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'signup_screen.dart';

class BloodRequests{
  var id,name,contact,message,bloodgroup,date,units,address,city;

  BloodRequests({this.id,this.name, this.contact, this.message, this.bloodgroup,
    this.date, this.units, this.address, this.city});

  factory BloodRequests.fromJson(Map<String, dynamic> json){
    return BloodRequests(
      id:json['id'].toString(),
      name: json['name'].toString(),
      contact: json['contact'].toString(),
      message: json['message'].toString(),
      bloodgroup: json['bloodgroup'].toString(),
      date: json['postdate'].toString(),
      units: json['units'].toString(),
      address: json['address'].toString(),
      city: json['city'].toString(),

    );
  }


}

class BloodRequest extends StatefulWidget {
  @override
  _BloodRequestState createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {


  List<BloodRequests> bloodrequests =[];

  static final API_URL ="http://www.fonesolutions31.com/BloodDonationCenterApi/apies/get-all-blood-request.php";

  var list_lenght;

  var currentId;

  String text = '';
  String subject = '';

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

  share(BuildContext context) {
    final RenderBox box = context.findRenderObject();
    Share.share(text,
        subject: subject,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }

  Future<List<BloodRequests>> _getBloodRequests() async {
    var data = await http.get(API_URL);
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

  _Call(String number) async {
    var url = 'tel:+$number';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
          title: Text("Blood Requests",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
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
                                        "No Blood Request",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                            else {
                              return ListView.builder(
                                  itemCount: list_lenght,
                                  itemBuilder: (BuildContext context, int index){
                                    currentId =snapshot.data[index].id;
                                    return  Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(1.0)),
                                      ),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin:EdgeInsets.only(bottom: 10.0),
                                            decoration: BoxDecoration(
                                                color: getColor(currentId),
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
                                                      padding: EdgeInsets.all(10.0),
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
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child:Container(
                                                    margin: EdgeInsets.all(5.0),
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50.0))),
                                                    child: Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: IconButton(
                                                            color: Colors.white,
                                                            icon: Icon(Icons.call),
                                                            onPressed: (){_Call(snapshot.data[index].contact.toString());}
                                                        )),
                                                  ),
                                                ),
                                                Expanded(
                                                  child:Container(
                                                    margin: EdgeInsets.all(5.0),
                                                    width: 40.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                        color: Colors.blue,
                                                        borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                50.0))),
                                                    child: Padding(
                                                        padding: EdgeInsets.all(1.0),
                                                        child: Builder(
                                                            builder: (BuildContext context){
                                                              return IconButton(
                                                                color: Colors.white,
                                                                icon: Icon(Icons.share),
                                                                onPressed:() {
                                                                  var _name = snapshot.data[index].name;
                                                                  var _message = snapshot.data[index].message;
                                                                  var _contact = snapshot.data[index].contact;
                                                                  var _bloodgroup =snapshot.data[index].bloodgroup;
                                                                  var _units =snapshot.data[index].units;
                                                                  var _city =snapshot.data[index].city;
                                                                  var _addrees =snapshot.data[index].address;
                                                                  text ="Blood Request\nName:$_name\nMessage:$_message\n"
                                                                      "Blood Group: $_bloodgroup\nNeed Units: $_units\n"
                                                                      "Contact Number: $_contact\nCity: $_city\nAddress: $_addrees";
                                                                  subject="Blood Request";


                                                                  if(text.isEmpty){

                                                                  }else {

                                                                    share(context);
                                                                  }
                                                                },
                                                              );
                                                            }

                                                        )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            height: 10,
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

  Color getColor(String selector) {
    if (selector  == id) {
      return Colors.amber;
    } else {
      return Colors.red;
    }
  }

}
