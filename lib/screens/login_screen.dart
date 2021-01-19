import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/blocs/login_blocs/login_bloc.dart';
import 'package:firebase_login/blocs/login_blocs/login_event.dart';
import 'package:firebase_login/blocs/login_blocs/login_state.dart';
import 'package:firebase_login/models/UserModel.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:firebase_login/screens/home_screen.dart';
import 'package:firebase_login/utils/form_validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_login/screens/signup_screen.dart';


class LoginPageParent extends StatelessWidget {
  final UserRepository userRepository;

  LoginPageParent({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(userRepository: userRepository),
      child: LoginScreen(userRepository: userRepository),
    );
  }
}


// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  LoginBloc loginBloc;
  final UserRepository userRepository;

  LoginScreen({@required this.userRepository});



  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("LOGIN"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Email label
                  Text(
                    "Email address",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10.0),
                  /// Email text field
                  TextFormField(
                    validator: (value)=> FormValidation.emailValidation(value),
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
                  Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10.0),
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
                  SizedBox(height: 50.0),

                  ///Bloc
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: BlocListener<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginSuccessState) {
                          navigateToHomeScreen(context, state.user);
                        }
                      },
                      child: BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          if (state is LoginInitialState) {
                            return buildInitialUi();
                          } else if (state is LoginLoadingState) {
                            return buildLoadingUi();
                          } else if (state is LoginFailState) {
                            return buildFailureUi(state.message);
                          } else if (state is LoginSuccessState) {
                            emailController.text = "";
                            passController.text = "";
                            return Container();
                          }else{
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),

                  ///Login button
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
                        loginButtonPressed();
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),

                  ///Forget password button
                  Align(
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
    return Container();
  }

  Widget buildLoadingUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildFailureUi(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Fail $message",
            style: TextStyle(color: Colors.red),
          ),
        ),
        buildInitialUi(),
      ],
    );
  }

  void navigateToHomeScreen(BuildContext context, FirebaseUser user) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePageParent(user: user, userRepository: userRepository);
    }));
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPageParent(userRepository: userRepository);
    }));
  }

  void loginButtonPressed() {
    if(_formKey.currentState.validate()){
      UserModel userModel = UserModel();
      userModel.email = emailController.text;
      userModel.password = passController.text;
      loginBloc.add(
        LoginButtonPressed(
          userModel: userModel,
        ),
      );
    }
  }
}
