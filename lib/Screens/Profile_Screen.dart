import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Screens/Booking_Screen.dart';
import 'package:flutter_app_travel/Screens/Create_Trip.dart';
import 'package:flutter_app_travel/Screens/Main_Screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class Profile_Screen extends StatefulWidget {
  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}


const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xCBF6FFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);
const kSpacingUnit = 10;

class _Profile_ScreenState extends State<Profile_Screen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: Container(
         margin: EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: <Widget>[
            Row(
               mainAxisAlignment:  MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(foregroundColor: Colors.yellow,
                  backgroundColor: Colors.blue,
                  radius: 80,
                ),
              ],
            ),
            SizedBox(height: 15,),

            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Kuldeep",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),
                    Text("9868455628",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.grey,))
                  ],
                )
              ],
            ),
            SizedBox(height: 30,),

        Container(
          height: kSpacingUnit* 5.5,
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ).copyWith(
            bottom: 10,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Row(
            children: <Widget>[
              Icon(

                LineAwesomeIcons.question_circle_1,size: 30,
              ),
              SizedBox(width: 20),
              Text(
                "Help & Support",style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color: Colors.grey),
              ),
              Spacer(),

            ],
          ),
        ),
            Container(
              height: kSpacingUnit* 5.5,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  Icon(

                    LineAwesomeIcons.user_plus,size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Invite a Friend",style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color: Colors.grey),
                  ),
                  Spacer(),

                ],
              ),
            ),
            Container(
              height: kSpacingUnit* 5.5,
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ).copyWith(
                bottom: 10,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.indigoAccent,
              ),
              child: Row(
                children: <Widget>[
                  Icon(

                    LineAwesomeIcons.user_shield,size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Log Out",style: TextStyle(fontSize:20,fontWeight: FontWeight.w400,color: Colors.grey),
                  ),
                  Spacer(),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
