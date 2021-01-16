import 'package:firebase_login/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //buttonColor: Colors.red,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red,
          height: 50.0,
          splashColor: Colors.redAccent,
          hoverColor: Colors.redAccent,
        ),
      ),
      home: LoginScreen()
    );
  }
}

