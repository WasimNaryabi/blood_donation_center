import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'post_blood_request.dart';

class BloodCompatability extends StatefulWidget {
  @override
  _BloodCompatabilityState createState() => _BloodCompatabilityState();
}

class _BloodCompatabilityState extends State<BloodCompatability> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: BackButton(color:Colors.red),
          title: Text("Blood Compatability",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        backgroundColor: Colors.redAccent,
        body: Container(
          margin: EdgeInsets.all(5.0),

          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Container(
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
                  child:Column(
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
                            Container(
                              width: 70.0,
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("Blood Group",style: TextStyle(color: Colors.white,fontSize: 18.0),)
                              ),
                            ),
                            Expanded(
                              child: Container(

                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("Donate to",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18.0),)
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("Accepte From",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 18.0),)
                                ),
                              ),
                            )

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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("A+",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A+, AB+",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A+, A-, O+, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("A-",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A+, A-, AB+, AB-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A-, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("B+",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("B+, AB+",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("B+, B-, O+, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("B-",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("B+, B-, AB+, AB-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("B-, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("AB+",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("AB+",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("Anyone",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("AB-",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("AB+, AB-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A-, AB-, B-, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("O+",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("A+, B+, AB+, O+",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("O+, O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
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
                              width: 60.0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    //                   <--- left side
                                    color: Colors.black,
                                    width: 1.0,

                                  )
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child:Text("O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.red,fontSize: 15.0,fontWeight: FontWeight.bold),)
                              ),

                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("Anyone",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            ),
                            Expanded(

                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      //                   <--- left side
                                      color: Colors.black,
                                      width: 1.0,

                                    )
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:Text("O-",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15.0),)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.of(context).pop();
    false;
  }
}
