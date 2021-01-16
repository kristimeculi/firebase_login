import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("LOGIN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key:_formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Email field
              Text("Email address",style:TextStyle(fontSize:22,fontWeight:FontWeight.w600),textAlign: TextAlign.left,),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
              ),

              SizedBox(height:20.0),

              ///Password field
              Text("Password",style:TextStyle(fontSize:22,fontWeight:FontWeight.w600),textAlign: TextAlign.left,),
              TextField(
                obscureText: true,

                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                ),
              ),

              SizedBox(height:30.0),

              Container(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  color: Colors.red,
                  hoverColor: Colors.redAccent,
                  splashColor:Colors.redAccent,
                  onPressed: () {

                  },
                  child: Text("SIGN IN"),
                ),
              ),

              SizedBox(height:15.0),

              Align(
                alignment: Alignment.center,
                child: FlatButton(
                  onPressed: () {
                  },
                  child: Text("Forgot Password?"),
                ),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
