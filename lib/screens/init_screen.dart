import 'package:firebase_login/screens/login_screen.dart';
import 'package:firebase_login/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Image.network('https://cdn.shopify.com/s/files/1/0274/0282/9884/files/OWG_US_Logo_red_65x.png?v=1571148504'),
              ),
              Spacer(flex:10),
              Padding(
                padding: const EdgeInsets.only(bottom:20),
                child: Text("EIN GRILL \nZWEI SYSTEME",style:TextStyle(fontSize:25,fontWeight:FontWeight.bold,),textAlign: TextAlign.center,),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:10.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red,
                    hoverColor: Colors.redAccent,
                    splashColor:Colors.redAccent,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return SignUpScreen();
                          }
                      ));
                    },
                    child: Text("SIGN UP"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(

                    color: Colors.red,
                    hoverColor: Colors.redAccent,
                    splashColor:Colors.redAccent,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebook),
                        SizedBox(width:10.0),
                        Text("SIGN UP WITH FACEBOOK"),
                      ],
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return LoginScreen();
                    }
                  ));
                },
                child: Text("SIGN IN"),
              ),
              Spacer(flex:1),
            ],
          ),
        ),
      ),
    );
  }
}