import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("SIGN UP"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Information label
                  Text(
                    "YOUR INFORMATION",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10.0),

                  ///Required label
                  Text(
                    "* Required field",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 30.0),

                  ///Email label
                  labelText("Email address*"),

                  SizedBox(height: 5.0),

                  /// Email text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Password label
                  labelText("Password*"),

                  SizedBox(height: 5.0),

                  ///Password text field
                  TextField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    cursorHeight: 22.0,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Firstname label
                  labelText("Firstname*"),

                  SizedBox(height: 5.0),

                  /// Firstname text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Phone Number label
                  labelText("Phone number"),

                  SizedBox(height: 5.0),

                  /// Phone text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Street label
                  labelText("Street"),

                  SizedBox(height: 5.0),

                  /// Street text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Postal Code label
                  labelText("Postal Code"),

                  SizedBox(height: 5.0),

                  /// Postal Code text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///City label
                  labelText("City"),

                  SizedBox(height: 5.0),

                  /// City text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Country label
                  labelText("Country"),

                  SizedBox(height: 5.0),

                  /// Country text field
                  TextField(
                    cursorHeight: 22.0,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),

                  SizedBox(height: 20.0),

                  ///Sign up button
                  Container(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget labelText(String label){
    return Text(
      label,
      style: TextStyle(
        color: Colors.white70,
        fontSize: 16.0,
      ),
      textAlign: TextAlign.left,
    );
  }
}
