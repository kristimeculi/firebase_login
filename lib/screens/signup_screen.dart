import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/blocs/registration_blocs/registration_bloc.dart';
import 'package:firebase_login/blocs/registration_blocs/registration_event.dart';
import 'package:firebase_login/blocs/registration_blocs/registration_state.dart';
import 'package:firebase_login/models/UserModel.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:firebase_login/screens/home_screen.dart';
import 'package:firebase_login/screens/login_screen.dart';
import 'package:firebase_login/utils/form_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'elements/label_text.dart';

class SignUpPageParent extends StatelessWidget {

  final UserRepository userRepository;

  SignUpPageParent({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(userRepository: userRepository),
      child: SignUpScreen(userRepository: userRepository),
    );
  }
}



// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  String authResult;
  RegistrationBloc userRegBloc;
  final UserRepository userRepository;

  SignUpScreen({@required this.userRepository});


  @override
  Widget build(BuildContext context) {
    userRegBloc = BlocProvider.of<RegistrationBloc>(context);

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
              key: _formKey,
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
                  LabelText("Email address*"),
                  SizedBox(height: 5.0),
                  /// Email text field
                  TextFormField(
                    validator: (value)=>FormValidation.emailValidation(value),
                    controller: emailController,
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
                  LabelText("Password*"),
                  SizedBox(height: 5.0),
                  ///Password text field
                  TextFormField(
                    validator: (value)=>FormValidation.passwordValidation(value),
                    controller: passController,
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
                  LabelText("Firstname*"),
                  SizedBox(height: 5.0),
                  /// Firstname text field
                  TextFormField(
                    controller: firstnameController,
                    validator: (value)=>FormValidation.nameValidation(value),
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
                  LabelText("Phone number"),
                  SizedBox(height: 5.0),
                  /// Phone text field
                  TextFormField(
                    controller: phoneController,
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
                  LabelText("Street"),
                  SizedBox(height: 5.0),
                  /// Street text field
                  TextFormField(
                    controller: streetController,
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
                  LabelText("Postal Code"),
                  SizedBox(height: 5.0),
                  /// Postal Code text field
                  TextFormField(
                    controller: postalCodeController,
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
                  LabelText("City"),
                  SizedBox(height: 5.0),
                  /// City text field
                  TextFormField(
                    controller: cityController,
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
                  LabelText("Country"),
                  SizedBox(height: 5.0),
                  /// Country text field
                  TextFormField(
                    controller: countryController,
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

                  ///Bloc
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: BlocListener<RegistrationBloc, RegistrationState>(
                      listener: (context, state) {
                        if (state is RegistrationSuccessfully) {
                          navigateToHomePage(context, state.user);
                        }
                      },
                      child: BlocBuilder<RegistrationBloc, RegistrationState>(
                        builder: (context, state) {
                          if (state is RegistrationInitial) {
                            return buildInitialUi();
                          } else if (state is RegistrationLoading) {
                            return buildLoadingUi();
                          } else if (state is RegistrationFailure) {
                            return buildFailureUi(state.message);
                          } else if (state is RegistrationSuccessfully) {
                            //emailController.text = "";
                            //passController.text = "";
                            return Container();
                          }else{
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),

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
                        signUpButtonPressed();
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

  Widget buildInitialUi() {
    return Text("Waiting For Authentication");
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void navigateToHomePage(BuildContext context, FirebaseUser user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePageParent(user: user, userRepository: userRepository);
    }));
  }

  Widget buildFailureUi(String message) {
    return Text(
      message,
      style: TextStyle(color: Colors.red),
    );
  }

  void navigateToLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPageParent(userRepository: userRepository);
    }));
  }

  void signUpButtonPressed() {
    if(_formKey.currentState.validate()){
      UserModel userModel = UserModel();
      userModel.email = emailController.text;
      userModel.password = passController.text;
      userModel.firstname = firstnameController.text;
      userModel.phone = phoneController.text??"";
      userModel.street = streetController.text??"";
      userModel.postalCode = int.tryParse(postalCodeController.text)??0;
      userModel.city = cityController.text??"";
      userModel.country = countryController.text??"";

      userRegBloc.add(SignUpButtonPressed(userModel: userModel));
    }
  }


}
