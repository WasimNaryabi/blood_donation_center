import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'post_blood_request.dart';

class MyBloodRequest extends StatefulWidget {
  @override
  _MyBloodRequestState createState() => _MyBloodRequestState();
}

class _MyBloodRequestState extends State<MyBloodRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(color:Colors.red),
        title: Text("My Blood Request",style: TextStyle(fontSize: 22.0,color: Colors.red),),
      ),
      backgroundColor: Colors.redAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
        elevation: 6,
        tooltip: "Add new blood request",
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => PostBloodrequest()));
        },
      ),
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
                                  child:Icon(Icons.delete,color: Colors.red,size: 18,)
                              ),
                            ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                        child:Icon(Icons.message,color: Colors.white,size: 18,)
                    ),
                  ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


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
                                child:Icon(Icons.delete,color: Colors.red,size: 18,)
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                                child:Icon(Icons.message,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


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
                                child:Icon(Icons.delete,color: Colors.red,size: 18,)
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                                child:Icon(Icons.message,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


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
                                child:Icon(Icons.delete,color: Colors.red,size: 18,)
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                                child:Icon(Icons.message,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


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
                                child:Icon(Icons.delete,color: Colors.red,size: 18,)
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                                child:Icon(Icons.message,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


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
                                child:Icon(Icons.delete,color: Colors.red,size: 18,)
                            ),
                          ),
                        ),
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
                          margin: EdgeInsets.all(5.0),
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(1.0),
                              child:Icon(Icons.healing,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("Blood Group"),
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
                              child:Icon(Icons.add_shopping_cart,color: Colors.white,size: 18,)
                          ),
                        ),
                        Text("5 Units"),



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
                                child:Icon(Icons.message,color: Colors.white,size: 18,)
                            ),
                          ),
                          Text("Demo text there will be message from request",style: TextStyle(color: Colors.black,fontSize: 12.0),
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


                  /*Padding(
                        padding: EdgeInsets.all(10.0),
                        child:*/


                ],
              ),
            ),

          ],
        ),
      ),


    );;
  }
}
