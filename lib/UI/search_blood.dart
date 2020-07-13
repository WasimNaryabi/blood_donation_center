import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';
import 'post_blood_request.dart';
import 'package:http/http.dart' as http;

class AllMembers{
  var id,name,contact,bloodgroup,date,address,city;

  AllMembers({this.id,this.name, this.contact,  this.bloodgroup,
    this.date,  this.address, this.city});

  factory AllMembers.fromJson(Map<String, dynamic> json){
    return AllMembers(
      id:json['id'].toString(),
      name: json['name'].toString(),
      contact: json['contact'].toString(),
      bloodgroup: json['bloodgroup'].toString(),
      address: json['address'].toString(),
      city: json['city'].toString(),
      date: json['date'].toString(),
    );
  }


}

class SearchBlood extends StatefulWidget {
  final String _bloodGroup;
  const SearchBlood(this._bloodGroup);

  @override
  _SearchBloodState createState() => _SearchBloodState();
}

class _SearchBloodState extends State<SearchBlood> {

  static var _cityname = ['Peshawar','Lahor','Karachi','Quitta','Islamabad','Hangu'];
  String _selectedValue="Peshawar";

  var id;

  _getPreferences() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    id = sharedPrefs.getString('id');
  }

  List<AllMembers> allMembers =[];

  static final API_URL ="http://www.fonesolutions31.com/BloodDonationCenterApi/apies/get-list-of-members.php";

  var list_lenght;

  Future<List<AllMembers>> _getAllMembers() async {
        var data =await http.post(API_URL,
        body: {'bloodgroup': widget._bloodGroup, 'city': _selectedValue,'id':id});
        if (data.statusCode == 200) {
        var jsonData = json.decode(data.body);
        allMembers = (jsonData['members'] as List)
            .map((p) => AllMembers.fromJson(p))
            .toList();
        setState(() {
          list_lenght = allMembers.length;
        });
        return allMembers;
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
  void initState() {
    super.initState();
    _getPreferences().whenComplete(() {
      setState(() {
      });
    });

    _getAllMembers().whenComplete(() {
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
          title: Text("Blood Group ("+widget._bloodGroup+")",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/12,
                margin: EdgeInsets.all(5.0),

                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width/2,
                        child: Text("Search by City",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0),),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0))),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              canvasColor: Colors.white,
                            ),
                            child: DropdownButton(
                              underline: SizedBox(),
                              isExpanded: true,
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: Colors.red,
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
                                                  .red),
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
              Container(
                height: MediaQuery.of(context).size.height / 1.15,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: FutureBuilder<List<AllMembers>>(
                        future: _getAllMembers(),
                        builder: (BuildContext context, AsyncSnapshot snapshot){
                          if(snapshot.data == null){
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
                          }else {
                            return ListView.builder(
                                itemCount: list_lenght,
                                itemBuilder: (BuildContext context, int index){
                                  return  Container(
                                    margin: EdgeInsets.all(5.0),
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
                                              color:Colors.red,
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
                                                          fontSize: 18.0,
                                                      fontWeight: FontWeight.bold),
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.all(10.0),
                                                    child: Text(
                                                      snapshot.data[index].bloodgroup,
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          backgroundColor: Colors.white,
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
                                                            Icons.calendar_today,
                                                            color: Colors.white,
                                                            size: 18,
                                                          )),
                                                    ),
                                                    Text(snapshot.data[index].date),
                                                  ],),
                                                ) ,
                                              ),

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
                                                            Icons.local_hospital,
                                                            color: Colors.white,
                                                            size: 18,
                                                          )),
                                                    ),
                                                    Text(snapshot.data[index].address),
                                                  ],),
                                                ) ,
                                              ),
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
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child:Container(

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
                                                      child: IconButton(
                                                          color: Colors.white,
                                                          icon: Icon(Icons.call),
                                                          onPressed: (){_Call(snapshot.data[index].contact.toString());}
                                                      )),
                                                ),
                                              ),
                                            ],
                                          ),
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
              )
            ],
          ),
          /**/
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop();
    false;
  }
}
