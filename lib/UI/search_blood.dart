import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'post_blood_request.dart';

class SearchBlood extends StatefulWidget {
  @override
  _SearchBloodState createState() => _SearchBloodState();
}

class _SearchBloodState extends State<SearchBlood> {
  static var _cityname = ['Peshawar','Lahor','Karachi','Quitta','Islamabad','Hangu'];
  String _selectedValue="Hangu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(color:Colors.red),
        title: Text("Search Blood",style: TextStyle(fontSize: 22.0,color: Colors.red),),
      ),
      backgroundColor: Colors.redAccent,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height/9,
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
                      width: MediaQuery.of(context).size.width/3,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0))
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        icon: Icon(Icons.arrow_drop_down,size: 20,color: Colors.red,),
                        items: _cityname.map((String dropDownStringItem) {
                          return DropdownMenuItem<String>(
                              value: dropDownStringItem,
                              child:Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Text(dropDownStringItem,style: TextStyle(color: Colors.red),)
                              )
                          );
                        }).toList(),
                        value: _selectedValue,
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        onChanged: (userSelectdValue) {
                          setState(() {
                            _selectedValue =userSelectdValue;

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) => SearchBlood()));
                            debugPrint("You selected $userSelectdValue");
                          });
                        },
                      ),
                    ),
                  )

                ],
              ),
            ),
            Container(
              height: (MediaQuery.of(context).size.height/1),
              child:ListView(
                children:<Widget>[
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  Container(
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
                              Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Demo Name",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child:Container(
                                  margin: EdgeInsets.all(5.0),
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(1.0),
                                      child:Text("A+",style:TextStyle(color: Colors.red,fontSize: 16.0))
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(1.0)),

                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width/1.4,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
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
                                                    child:Icon(Icons.calendar_today,color: Colors.white,size: 17,)
                                                ),
                                              ),
                                              Text("29 Aug, 2019",style: TextStyle(color: Colors.black,fontSize: 12.0),
                                                textAlign: TextAlign.left,)
                                            ]),
                                      ),
                                      Container(
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



                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                  child:Icon(Icons.location_city,color: Colors.white,size: 18,)
                                              ),
                                            ),
                                            Text("City name"),



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width/4,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.all(5.0),
                                        width: 50.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(Radius.circular(50.0))
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.all(1.0),
                                            child:Icon(Icons.call,color: Colors.white,size: 25,)
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
        /**/
      ),


    );;
  }
}
