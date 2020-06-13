import 'package:flutter/material.dart';
import 'package:flutter_app_travel/Constants.dart';
import 'package:flutter_app_travel/Screens/FormUI.dart';
import 'package:flutter_app_travel/Screens/Home_Screen.dart';
import 'package:flutter_app_travel/Screens/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs= await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var status=true;

  @override
  void initState() {
    navigateuser();
  }

  @override
  Widget build(BuildContext context) {
    return Constants.prefs.get("isLoggedIn")==true?Home_Screen():Login();
  }

  void navigateuser() async {
    FirebaseAuth.instance.currentUser().then((user) {
      if (user != null) {
        print(user.uid);
        status=true;
      }
    });
  }
}
