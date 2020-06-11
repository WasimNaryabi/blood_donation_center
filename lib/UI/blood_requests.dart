import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class BloodRequest extends StatefulWidget {
  @override
  _BloodRequestState createState() => _BloodRequestState();
}

class _BloodRequestState extends State<BloodRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: BackButton(color:Colors.red),
          title: Text("Blood Requests",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
        body: Container(

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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
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
                              padding: EdgeInsets.all(10.0),
                              child:Text("     48 hours ago",style: TextStyle(color: Colors.white,fontSize: 20.0),)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child:Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
                            textAlign: TextAlign.left,)
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
                          Container(
                            margin: EdgeInsets.all(5.0),
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.all(Radius.circular(50.0))
                            ),
                            child: Padding(
                                padding: EdgeInsets.all(1.0),
                                child:Icon(Icons.call,color: Colors.white,size: 20,)
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


    );;
  }
}
