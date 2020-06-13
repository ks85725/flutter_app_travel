import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Variable.dart';

class Trip_Info extends StatefulWidget {
  final AllData tripdata;

  const Trip_Info({this.tripdata});

  @override
  _Trip_InfoState createState() => _Trip_InfoState();
}

class _Trip_InfoState extends State<Trip_Info> {
  String s = 'o';
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  int count=1;
  String uidnum;
  String user_name;
  String user_phone;
  var seat=0;
  bool book=false;
  DatabaseReference ref = FirebaseDatabase.instance.reference();
   @override
  void initState() {
    // TODO: implement initState
     uid();



  }
  Future uid() async{
    await FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        print(user.uid);
        uidnum=user.uid;
        user_name="kuldeep";
        user_phone=user.phoneNumber;
        print(uidnum);
      }
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.tripdata.imageurl),
                  fit: BoxFit.fill),
            ),
          ),
          SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 50.0, // soften the shadow
                      spreadRadius: 2.0, //extend the shadow
                      offset: Offset(
                        10.0, // Move to right 10  horizontally
                        10.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.white60,
                            blurRadius: 5.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              10.0, // Move to right 10  horizontally
                              10.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120,
                                  height: 120,
                                  margin: EdgeInsets.only(right: 15),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
//                border: Border.all(width: 3, color: secondary),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.tripdata.imageurl),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            color: secondary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              width: 60,
                                              child: Text(widget.tripdata.to,
                                                  style: TextStyle(
                                                      color: primary,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: secondary,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            color: secondary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Container(
                                              width: 60,
                                              child: Text(widget.tripdata.from,
                                                  style: TextStyle(
                                                      color: primary,
                                                      fontWeight:
                                                          FontWeight.w600))),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.date_range,
                                            color: secondary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              widget.tripdata.Ending_trip
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  color: primary,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Icon(
                                        Icons.arrow_upward,
                                        color: secondary,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.date_range,
                                            color: secondary,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                              widget.tripdata.Starting_trip
                                                  .substring(0, 10),
                                              style: TextStyle(
                                                  color: primary,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            ListTile(
                              title: Text(
                                "Organizer Name",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              leading: Icon(
                                Icons.supervised_user_circle,
                                color: secondary,
                              ),
                              subtitle: Text(widget.tripdata.org_name,
                                  style: TextStyle(color: primary)),
                            ),
                            ListTile(
                              title: Text(
                                "Contact Number",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              leading: Icon(
                                Icons.phone,
                                color: secondary,
                              ),
                              subtitle: Text(widget.tripdata.phoneNumber,
                                  style: TextStyle(color: primary)),
                            ),
                            ListTile(
                              title: Text("Price",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                              leading: Text(
                                "₹",
                                style: TextStyle(fontSize: 30, color: secondary),
                              ),
                              subtitle: Text("₹${widget.tripdata.price}",
                                  style: TextStyle(color: primary)),
                            ),
                            ListTile(
                              title: Text("Total Seat",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                              leading: Icon(
                                Icons.event_seat,
                                color: secondary,
                              ),
                              subtitle: Text(widget.tripdata.total_seat,
                                  style: TextStyle(color: primary)),
                            ),
                            ListTile(
                              title: Text("Available Seat",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                              leading: Icon(
                                Icons.event_seat,
                                color: secondary,
                              ),
                              subtitle: Text(widget.tripdata.total_seat,
                                  style: TextStyle(color: primary)),
                            ),
                            ListTile(
                              title: Text("Trip Description",
                                  style: TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Text(widget.tripdata.trip_desc,
                                  style: TextStyle(color: primary)),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Book Seat",
                                      style: TextStyle(fontWeight: FontWeight.w600)),
                                  
                                  Row(
                                    children: <Widget>[
                                      CircleAvatar(
                                        backgroundColor: Colors.blue,
                                          child: Container(
                                              child: IconButton(
                                                  icon:Icon(Icons.add,color: Colors.black,),
                                                  onPressed: (){
                                                    print("ok");
                                                    if(count<5){
                                                    setState(() {
                                                      count++;
                                                    });}
                                                  }))),
                                      SizedBox(width: 10,),
                                      Text("${ count }"),
                                      SizedBox(width: 10,),
                                      CircleAvatar(
                                          backgroundColor: Colors.blue,
                                          child: Container(
                                              child: IconButton(
                                                  icon:Icon(Icons.remove,color: Colors.black,),
                                                  onPressed: (){
                                                    print("ok");
                                                    if(count>1){
                                                    setState(() {
                                                      count--;
                                                    });}
                                                  }))),
                                    ],
                                  )
                                ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.all(0),
                              child: Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: RaisedButton(
                                    color: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Text(
                                      "Book Vacation",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    padding: EdgeInsets.all(16.0),
                                    onPressed: () async {
                                      await selected();

                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }

  Future selected() async {
     int flag=0;
    print(uidnum);
    await ref.child("user").child(uidnum).child("booking").child(widget.tripdata.key).once().then((DataSnapshot snap) {
      print(snap.value);
      if(snap.value==null){
        seat=count;
        var data={
          "Seat":seat,
        };
        ref.child("user").child(uidnum).child("booking").child(widget.tripdata.key).set(data);
        flag=1;
      }
      else{
        var data=snap.value;
        seat=data["Seat"];
        seat=seat+count;

        if(seat<6){
          var data={
            "Seat":seat,
          };
          ref.child("user").child(uidnum).child("booking").child(widget.tripdata.key).set(data);
          print(seat);
        flag=1;
        }
        else{print("full");}

      }

    });
    if(flag==1){
      var data={
        "name":user_name,
        "phone_number":user_phone,
        "Seat":seat
      };
      ref.child("user").child(widget.tripdata.org_id).child("create").child(widget.tripdata.key).push().set(data);
    }
  }
}

