import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              height: MediaQuery.of(context).size.height/2.5,
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
                        Text("demo@gmail.com"),


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
                        Text("03056097548"),


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
                        Text("Your Address"),


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
                        Text("City"),

                        Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child:Text("Update",style: TextStyle(color: Colors.white),)
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:5.0,right: 5.0,top: 5.0,bottom: 5.0),
              child:Container(
                height: MediaQuery.of(context).size.height/7.4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left:10.0,right: 5.0,top: 2.0,bottom: 5.0),
                            child:Text("My Last Donation",style: TextStyle(color: Colors.red,fontSize: 15.0),)
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:GestureDetector(
                              onTap: () {
                                /* Navigator.of(context).pushReplacement(MaterialPageRoute(
                                            builder: (BuildContext context) => SignupScreen()));*/
                              },
                              child: Text(
                                "                                Set",
                                style: TextStyle(fontSize: 15.0,color: Colors.blue),
                                textAlign: TextAlign.right,
                              )),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left:10.0,right: 5.0,top: 1.0,bottom: 5.0),
                            child:Text("20 Aug 2019",style: TextStyle(color: Colors.black,fontSize: 18.0),)
                        ),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child:Text("     40 Days ago",style: TextStyle(color: Colors.red,fontSize: 18.0),)
                        ),
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
    );
  }
}
