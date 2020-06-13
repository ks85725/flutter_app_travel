import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Screens/Booking_Screen.dart';
import 'package:flutter_app_travel/Screens/Create_Trip.dart';
import 'package:flutter_app_travel/Screens/Main_Screen.dart';
import 'package:flutter_app_travel/Screens/Profile_Screen.dart';
class Home_Screen extends StatefulWidget {
  @override
  _Home_ScreenState createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int  _currentTab=0;
  final List<Widget> _children=[
    Main_Screen(),
    Create_Trip(),
    Booking_Screen(),
    Profile_Screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body:_children[_currentTab],





      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,

        onTap: (int value){
          setState(() {
            _currentTab=value;

          });
          print(_currentTab);
          print(value);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,
                color: _currentTab==0?Colors.blue:Colors.grey,
                size: 20.0,

              ),
              title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create,semanticLabel: "create",
              color: _currentTab==1?Colors.blue:Colors.grey,
              size: 20.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart,semanticLabel: "save",
              color: _currentTab==2?Colors.blue:Colors.grey,
              size: 20.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,semanticLabel: "create",
              color: _currentTab==3?Colors.blue:Colors.grey,
              size: 20.0,
            ),
            title: SizedBox.shrink(),
          ),

        ],
      ),
    );
  }
}
