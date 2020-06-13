import 'package:firebase_auth/firebase_auth.dart';
import 'Main_Screen.dart';
import 'package:flutter/material.dart';
import 'Otp_Screen.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
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
              image: DecorationImage(image: AssetImage("assets/images/home.jpg"),fit: BoxFit.fill)
            ),
            child: Center(
              child: Text("Safer",style: TextStyle(
                fontSize: 50,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column( mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
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
                        child: Text("Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: ()  {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext bc) {
                                print("VALID CC: $isValid");

                                return StatefulBuilder(builder:
                                    (BuildContext context, StateSetter state) {
                                  return Container(
                                    padding: EdgeInsets.all(16),
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    child: new Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w900,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Login/Create Your Account',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 0),
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            controller: _phoneNumberController,
                                            autofocus: true,
                                            onChanged: (text) {
                                              validate(state);
                                            },
                                            decoration: InputDecoration(
                                              labelText: "10 digit mobile number",
                                              prefix: Container(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                  "+91",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                            autovalidate: true,
                                            autocorrect: false,
                                            maxLengthEnforced: true,
                                            validator: (value) {
                                              return !isValid
                                                  ? 'Please provide a valid 10 digit phone number'
                                                  : null;
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                            child: SizedBox(
                                              width:
                                              MediaQuery.of(context).size.width *
                                                  0.85,
                                              child: RaisedButton(
                                                color: !isValid
                                                    ? Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5)
                                                    : Theme.of(context).primaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(0.0)),
                                                child: Text(
                                                  !isValid
                                                      ? "ENTER PHONE NUMBER"
                                                      : "Login",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                onPressed: () {
                                                  if (isValid) {
                                                    Navigator.push(context, MaterialPageRoute(
                                                        builder: (context) => Otp_Screen(phone_number: _phoneNumberController.text,)),);
                                                  } else {
                                                    validate(state);
                                                  }
                                                },
                                                padding: EdgeInsets.all(16.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              });
                        },
                        padding: EdgeInsets.all(16.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )

    );
  }
}

Widget Login_Screen(){

}