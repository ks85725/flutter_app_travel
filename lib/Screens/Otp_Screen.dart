import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_travel/Screens/Home_Screen.dart';
import 'package:flutter_app_travel/Screens/Main_Screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../Constants.dart';

class Otp_Screen extends StatefulWidget {
  final String phone_number;
  Otp_Screen({this.phone_number});


  @override
  _Otp_ScreenState createState() => _Otp_ScreenState();
}

class _Otp_ScreenState extends State<Otp_Screen> {
  String _verificationId;
  PinDecoration _pinDecoration = UnderlineDecoration(
    enteredColor: Colors.black,
  );
  TextEditingController pinController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    print(widget.phone_number);
   Phone_authentication(widget.phone_number, context);
  }

  Future<bool> Phone_authentication(String phone, BuildContext context) async {
    phone = "+91" + phone;





    final PhoneVerificationCompleted verificationCompleted=(AuthCredential authCredential) async{
      AuthResult result= await _auth.signInWithCredential(authCredential);
      FirebaseUser user=result.user;
      if(user!=null){
        Constants.prefs.setBool("isLoggedIn", true);
        Navigator.push(context, MaterialPageRoute(builder:(context)=>Home_Screen()));
      }
      else{
        showToast("Error validating OTP, try again", Colors.red);
      }

    };




    final PhoneVerificationFailed verificationFailed=(AuthException exception){
      showToast(exception, Colors.red);

    };


    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };



    _auth.verifyPhoneNumber(phoneNumber: phone,
        timeout:Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: null);

  }


  void onSubmitted() async{
    final code=pinController.text;
    AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: _verificationId, smsCode: code);
    AuthResult result= await _auth.signInWithCredential(authCredential);
    FirebaseUser user=result.user;
    if(user!=null){
      Constants.prefs.setBool("isLoggedIn", true);
      Navigator.push(context, MaterialPageRoute(builder:(context)=>Main_Screen()));
    }
    else{
      showToast("Error validating OTP, try again", Colors.red);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phone Verfication"),
        elevation: 0.0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 80,),
                  Text("Otp Send to  ${widget.phone_number}",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey
                  ),),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: PinInputTextField(
                    decoration: _pinDecoration,
                    pinLength: 6,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    controller: pinController,
                    onSubmit: (pin) {
                      if (pin.length == 6) {
                        onSubmitted();
                      } else {
                        showToast("Invalid OTP", Colors.red);
                      }
                    },
                  )),
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    width:
                    MediaQuery.of(context).size.width *
                        0.5,
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10)),
                      child: Text(
                        "Enter OTP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if(pinController.text.length==6){
                          onSubmitted();
                        }
                        else{
                          showToast("Invalid OTP", Colors.red);
                        }

                      },
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
