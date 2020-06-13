import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
const api="AIzaSyBa4yF5GSdjEKmJ_UGctg1Fujhs-g5xDLU";
class Place_Search extends StatefulWidget {
  @override
  _Place_SearchState createState() => _Place_SearchState();
}

class _Place_SearchState extends State<Place_Search> {


  void get_data(String input) async{

    if(input.isEmpty){
      return;
    }
    String basrurl='https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String type='(regions)';
    String request='$basrurl?input=$input&key=$api&type=$type';

    var response =await Dio().get(request);
  print(response);}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(top: 10),
            child:TextField(
              onChanged: (value){
                get_data(value);
              },
              decoration:InputDecoration(
                fillColor: Color.fromRGBO(220, 220, 220,1.0),
                filled: true,
                hintText: "Going to",
                hintStyle: TextStyle(
                  color:  Color.fromRGBO(169, 169, 169,1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
              ),
            ),
          ),

        ],
      ),
    );
  }
}




