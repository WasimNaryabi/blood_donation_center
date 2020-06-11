import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class PostBloodrequest extends StatefulWidget {
  @override
  _PostBloodrequestState createState() => _PostBloodrequestState();
}

class _PostBloodrequestState extends State<PostBloodrequest> {
  static var _bloodGroup = ['A+','A-','B+','B-','AB+','AB-','O+','O-'];
  static var _cityname = ['Peshawar','Lahor','Karachi','Quitta','Islamabad','Hangu'];
  String _selectedValue="Hangu";
  String _selectedBloodGroup="A+";

  TextEditingController _nameController= TextEditingController();
  TextEditingController _contactController=TextEditingController();
  TextEditingController _messageController=TextEditingController();
  TextEditingController _unitsController=TextEditingController();
  TextEditingController _addressController=TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String selectedValues;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: BackButton(color:Colors.red),
          title: Text("New Blood Request",style: TextStyle(fontSize: 22.0,color: Colors.red),),
        ),
        body: Container(

          child:ListView(
            children:<Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child:Container(
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Text(""),
                            Image.asset('images/logo.png',width: 50.0,height: 50.0,),
                            Padding(
                                padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                child:TextFormField(
                                  controller: _nameController,
                                  validator: (value) => value.isEmpty?'Name is required':null,
                                  decoration: InputDecoration(
                                    //icon: Icon(Icons.mail),
                                    labelText: "Name",
                                    hintText: "Name",
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                    ),
                                    labelStyle: new TextStyle(color: Colors.red),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.red),
                                    ),
                                    errorBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.blue),
                                    ),
                                    errorStyle: TextStyle(color:Colors.blue,),
                                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                  ),
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child:TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _contactController,
                                  validator: (value) => value.isEmpty?'Contact is required':null,
                                  decoration: InputDecoration(
                                    labelText: "Contact",
                                    hintText: "Contact",
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                    ),
                                    labelStyle: new TextStyle(color: Colors.red),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.red),
                                    ),
                                    errorBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.blue),
                                    ),
                                    errorStyle: TextStyle(color:Colors.blue,),
                                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                  ),
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                child:TextFormField(
                                  controller: _messageController,
                                  validator: (value) => value.isEmpty?'Message is required':null,
                                  decoration: InputDecoration(
                                    //icon: Icon(Icons.mail),
                                    labelText: "Message",
                                    hintText: "Message",
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                    ),
                                    labelStyle: new TextStyle(color: Colors.red),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.red),
                                    ),
                                    errorBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.blue),
                                    ),
                                    errorStyle: TextStyle(color:Colors.blue,),
                                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height/9,
                                margin: EdgeInsets.all(5.0),

                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(

                                        child: Text("Select BloodGroup",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(


                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              canvasColor: Colors.red,
                                            ),
                                            child: DropdownButton(
                                              isExpanded: true,
                                              icon: Icon(Icons.arrow_drop_down,size: 20,color: Colors.white,),
                                              items: _bloodGroup.map((String dropDownStringItem) {
                                                return DropdownMenuItem<String>(
                                                    value: dropDownStringItem,
                                                    child:Padding(
                                                        padding: EdgeInsets.only(left: 10.0),
                                                        child: Text(dropDownStringItem,style: TextStyle(color: Colors.white),)
                                                    )
                                                );
                                              }).toList(),
                                              value: _selectedBloodGroup,
                                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                                              onChanged: (userSelectdValue) {
                                                setState(() {
                                                  _selectedBloodGroup =userSelectdValue;

                                                  /*  Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (BuildContext context) => SearchBlood()));
                                              debugPrint("You selected $userSelectdValue");*/
                                                });
                                              },
                                            ),
                                          )
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              /**/
                            ),
                            Padding(
                                padding: EdgeInsets.only(top:20.0,right: 10.0,left: 10.0,bottom: 10.0),
                                child:TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: _unitsController,
                                  validator: (value) => value.isEmpty?'Units is required':null,
                                  decoration: InputDecoration(
                                    //icon: Icon(Icons.mail),
                                    labelText: "Units",
                                    hintText: "Units",
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                    ),
                                    labelStyle: new TextStyle(color: Colors.red),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.red),
                                    ),
                                    errorBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.blue),
                                    ),
                                    errorStyle: TextStyle(color:Colors.blue,),
                                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                  ),
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child:TextFormField(
                                  controller: _addressController,
                                  validator: (value) => value.isEmpty?'Address is required':null,
                                  decoration: InputDecoration(

                                    // icon: Icon(Icons.lock),
                                    labelText: "Address",
                                    hintText: "Address",
                                    enabledBorder: const OutlineInputBorder(
                                      // width: 0.0 produces a thin "hairline" border
                                      borderSide: const BorderSide(color: Colors.red, width: 0.0),
                                    ),
                                    labelStyle: new TextStyle(color: Colors.red),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.red),
                                    ),
                                    errorBorder:OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                                      borderSide: BorderSide(width: 1,color: Colors.blue),
                                    ),
                                    errorStyle: TextStyle(color:Colors.blue,),
                                    border:OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height/9,
                                margin: EdgeInsets.all(5.0),

                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(

                                        child: Text("Select City",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 15.0),),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(


                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                                          ),
                                          child: Theme(
                                            data: Theme.of(context).copyWith(
                                              canvasColor: Colors.red,
                                            ),
                                            child: DropdownButton(
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              icon: Icon(Icons.arrow_drop_down,size: 20,color: Colors.white,),
                                              items: _cityname.map((String dropDownStringItem) {
                                                return DropdownMenuItem<String>(
                                                    value: dropDownStringItem,
                                                    child:Padding(
                                                        padding: EdgeInsets.only(left: 10.0),
                                                        child: Text(dropDownStringItem,style: TextStyle(color: Colors.white),)
                                                    )
                                                );
                                              }).toList(),
                                              value: _selectedValue,
                                              style: TextStyle(color: Colors.black, fontSize: 16.0),
                                              onChanged: (userSelectdValue) {
                                                setState(() {
                                                  _selectedValue =userSelectdValue;

                                                  /*  Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (BuildContext context) => SearchBlood()));
                                              debugPrint("You selected $userSelectdValue");*/
                                                });
                                              },
                                            ),
                                          )
                                      ),
                                    )

                                  ],
                                ),
                              ),
                              /**/
                            ),
                            Padding(
                                padding: EdgeInsets.all(10.0),
                                child:Row(
                                    children: <Widget>[
                                      Expanded(
                                          child:  RaisedButton(
                                            color: Colors.blue,
                                            child: Text("Submit",style: TextStyle(fontSize: 22.0,color: Colors.white),),
                                            onPressed: (){
                                              if(_formKey.currentState.validate()){
                                                String name = _nameController.text;
                                                String contact = _contactController.text;
                                                String message = _messageController.text;
                                                String units = _unitsController.text;
                                                String address = _addressController.text;


                                                selectedValues = "Name:  $name \n"
                                                    "Contact:  $contact \n"
                                                    "Message:  $message \n"
                                                    "Blood Group:  $_selectedBloodGroup \n"
                                                    "Units:  $units \n"
                                                    "Address:  $address \n"
                                                    "City:  $_selectedValue \n";
                                                var alertDialog = AlertDialog(
                                                  title: Text("Blood Request posted "),
                                                  content: Text(selectedValues),
                                                );
                                                showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return alertDialog;
                                                    });
                                              }
                                              //Navigator.pop(context);
                                            },
                                          )
                                      )
                                    ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),
        )
    );;
  }
}
