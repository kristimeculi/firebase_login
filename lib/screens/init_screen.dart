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

              ///Logo
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.network(
                    'https://cdn.shopify.com/s/files/1/0274/0282/9884/files/OWG_US_Logo_red_65x.png?v=1571148504'),
              ),

              ///90% of the free space
              Spacer(flex: 9),

              ///Company name
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "EIN GRILL \nZWEI SYSTEME",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              ///Sign up button
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    hoverColor: Colors.redAccent,
                    splashColor: Colors.redAccent,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignUpScreen();
                      }));
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              ///Sign up with facebook
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        "SIGN UP WITH FACEBOOK",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///Sign in button
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                child: Text(
                  "SIGN IN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              ///10% of thee free space
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
