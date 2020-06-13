import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Screens/Trip_Info.dart';

import '../Variable.dart';

class Trip extends StatelessWidget {
  List<AllData> t_data;

  Trip({this.t_data});

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: t_data.length,
        itemBuilder: (BuildContext context, int index) {
          return buildList(context, index);
        });
  }

  Widget buildList(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        print(t_data[index].org_name);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Trip_Info(
                    tripdata: t_data[index],
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        width: double.infinity,
        height: 110,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 80,
              height: 80,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
//                border: Border.all(width: 3, color: secondary),
                image: DecorationImage(
                  image: NetworkImage(t_data[index].imageurl),
                    fit: BoxFit.fill),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: secondary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(t_data[index].from,
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  letterSpacing: .3)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: secondary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(t_data[index].to,
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  letterSpacing: .3)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: secondary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(t_data[index].org_name,
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  letterSpacing: .3)),
                        ],
                      ),
                      Row(
                        children: <Widget>[

                          SizedBox(
                            width: 5,
                          ),
                          Text("₹${t_data[index].price}",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  letterSpacing: .3)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
