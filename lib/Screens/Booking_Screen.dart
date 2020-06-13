import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Widget/Trip.dart';
import 'package:flutter_app_travel/Widget/loader.dart';

import '../Variable.dart';
class Booking_Screen extends StatefulWidget {
  @override
  _Booking_ScreenState createState() => _Booking_ScreenState();
}

class _Booking_ScreenState extends State<Booking_Screen> {

  DatabaseReference ref = FirebaseDatabase.instance.reference();
  var user_uid;
  List<AllData> mydata = [];
  bool valid=true;

  @override
  void initState() {
    call();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child:valid?Trip(
        t_data: mydata,
      ):Center(child: Text("no trip book yet"),),
    );
  }

  void call() async{
  await uid();
  fetch_data();

  }

  Future uid() async{
    await FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        user_uid=user.uid;
      }
    });
  }


  void fetch_data()async{
     DataSnapshot snapshot= await ref.child("user").child(user_uid).child("booking").once();
     var keys=snapshot.value.keys;
     print(snapshot.value);
     if(snapshot.value==null){
       valid=false;
       return;
     }

     ref.child("All_trips").once().then((DataSnapshot snap){
       var data = snap.value;
       mydata.clear();
       for (var key in keys) {
         AllData d = AllData(
           data[key]["Organizer_Name"],
           data[key]["Available_Seat"],
           data[key]["Total_Seat"],
           data[key]["Phone"],
           data[key]["Ending_date"],
           data[key]["Starting_Date"],
           data[key]["imageurl"],
           data[key]["From"],
           data[key]["To"],
           data[key]["Price"],
           data[key]["Trip_Discreption"],
           key,
           data[key]["org_id"]
         );
         mydata.add(d);
       }
       setState(() {
         print("lenght: ${mydata.length}");
         for (var i = 0; i < mydata.length; i++) {
           print(mydata[i].key);
         }
       });

     });

  }
}


