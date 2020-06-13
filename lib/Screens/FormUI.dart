import 'dart:core';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Screens/Main_Screen.dart';
import 'package:flutter_app_travel/Variable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:date_field/date_field.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class FormUI extends StatefulWidget {
  @override
  _FormUIState createState() => _FormUIState();
}

class _FormUIState extends State<FormUI> {
  AllData trip_info;
  var currDt = DateTime.now();
  DateTime selectedDate1;
  DateTime selectedDate2;
  GlobalKey<FormState> _key = new GlobalKey();
  File _image;
  String imageurl;
  bool selected=false;
  String org_name,from,to,price,trip_desc,phoneNumber,total_seat;


  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      var image= await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        if(image!=null){
        _image=image;
        selected=true;}
      });

    }
    Future upload(BuildContext context)async{
      String Filename='images/${DateTime.now()}.png';
      StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(Filename);
      StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Photo upload successfully...")));
        imageurl=Filename;

      });

    }



    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1.0),
      body: Builder(builder: (context)=>SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _key,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Going to",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    to = value;
                  },
                ),
                SizedBox(
                  height: 20,   //9990554365
                ),
                TextFormField(
                  validator: valid,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "From",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    from = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DateField(
                  label: "Starting day",
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate1 = value;
                    });
                  },
                  firstDate: DateTime(currDt.year, currDt.month, currDt.day),
                  selectedDate: selectedDate1,
                ),
                SizedBox(
                  height: 20,
                ),
                DateField(
                  label: "Last Day" ,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    ),
                  ),
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDate2 = value;

                    });
                  },
                  firstDate: DateTime(currDt.year, currDt.month, currDt.day),
                  selectedDate: selectedDate2,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Organizer name",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    org_name = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Phone Number",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    phoneNumber = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Price per Seat",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.local_offer,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    price = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Total Seat",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.event_seat,
                      color: Colors.grey,
                    ),
                  ),
                  onSaved: (value) {
                    total_seat = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: valid,
                  maxLength: 150,
                  maxLines: 10,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(220, 220, 220, 1.0),
                    filled: true,
                    hintText: "Trip description",
                    hintStyle: TextStyle(
                      color: Color.fromRGBO(169, 169, 169, 1.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none,
                    ),

                  ),
                  onSaved: (value) {
                    trip_desc = value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(0),
                  child: Center(
                    child: SizedBox(
                      width:
                      MediaQuery.of(context).size.width ,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10)),
                        child: Text("Uploade Image",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: ()  async{
                          try{
                            await getImage();

                            if (selected){
                              upload(context);}
                          }
                          catch(error){
                            print(error);
                          }
                        },
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton.extended(
                      onPressed: sendtodata,
                      icon: Icon(Icons.save),
                      label: Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ))
    );



  }

  sendtodata()  async{
    try{
      if(selected!=false){
        if(selectedDate1!=null){
          if(selectedDate2!=null){
            if (_key.currentState.validate()) {
              _key.currentState.save();
              DatabaseReference ref = FirebaseDatabase.instance.reference();
              print("ok");
              var data = {
                "Organizer_Name":org_name,
                "From": from,
                "To": to,
                "Price": price,
                "Trip_Discreption": trip_desc,
                "imageurl":imageurl,
                "Starting_Date":selectedDate1.toString(),
                "Ending_date":selectedDate2.toString(),
                "Phone":phoneNumber,
                "Total_Seat":total_seat,
                "Available_Seat":total_seat,
              };
              print(data);
              await ref.child("All_trips").push().set(data);
              org_name="";
              from="";
              to="";
              price="";
              trip_desc="";
              imageurl="";
              phoneNumber="";
              total_seat="";
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Main_Screen()),
              );



            }
          }
          else {
            print("Date Field is empty...");
          }
        }
        else {
          print("Date Field is empty...");
        }
      }
      else {
        print("Photo is not uploaded...");
      }
    }
    catch(error){
      print(error);
    }
  }



  String valid(String value){
    if(value.isEmpty){
      return "Field is empty";
    }
  }
}
