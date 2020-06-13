import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Screens/Booking_Screen.dart';
import 'package:flutter_app_travel/Screens/Create_Trip.dart';
import 'package:flutter_app_travel/Screens/FormUI.dart';
import 'package:flutter_app_travel/Screens/Profile_Screen.dart';
import 'package:flutter_app_travel/Screens/Trip_Info.dart';
import 'package:flutter_app_travel/Variable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app_travel/Widget/Trip.dart';
import 'package:flutter_app_travel/urls.dart';

class Main_Screen extends StatefulWidget {
  @override
  _Main_ScreenState createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  List<AllData> mydata = [];
  final ref = FirebaseStorage.instance.ref();
  var user;
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  FirebaseAuth _auth = FirebaseAuth.instance;
  int  _currentTab=0;

  @override
  void initState() {
    DatabaseReference ref = FirebaseDatabase.instance.reference();

    ref.child("All_trips").once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
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

      });
    });

  }

  Future uid() async {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        print(user.uid);
      }
    });
  }

  Future downloadurl() async {
    for (int i = 0; i < mydata.length; i++) {
      final ref = FirebaseStorage.instance.ref().child(mydata[i].imageurl);
      var url = await ref.getDownloadURL();
      mydata[i].imageurl = url;
      print(mydata[i].imageurl);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height*0.93,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 145),
//                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Trip(
                    t_data: mydata,
                  )),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          uid();
                        },
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Vacation",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          // controller: TextEditingController(text: locations[0]),
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Search your best Trip",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                  elevation: 0.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: IconButton(
                                      icon: Icon(Icons.search),
                                      onPressed: () {
                                        url();
                                      })),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  }

  void url() {
    for (int i = 0; i < 5; i++) {
      print(FirebaseStorage.instance
          .ref()
          .child(mydata[i].imageurl)
          .getDownloadURL());
    }
  }
}
