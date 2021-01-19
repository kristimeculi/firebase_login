import 'package:firebase_login/screens/home_screen.dart';
import 'package:firebase_login/screens/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'blocs/auth_blocs/auth_bloc.dart';
import 'blocs/auth_blocs/auth_event.dart';
import 'blocs/auth_blocs/auth_state.dart';
import 'repositories/user_repository.dart';


void main() => runApp(FirebaseLogin());

// ignore: must_be_immutable
class FirebaseLogin extends StatelessWidget {

  UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          height: 50,
        ),
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(userRepository: userRepository)..add(AppStartedEvent()),
        child: MyApp(userRepository: userRepository,),
      ),
    );
  }
}

class MyApp extends StatelessWidget {

  final UserRepository userRepository;

  MyApp({@required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialState) {
          return InitScreen(userRepository: userRepository);
        } else if (state is AuthenticatedState) {
          return HomePageParent(user: state.user, userRepository: userRepository);
        } else if (state is UnauthenticatedState) {
          return InitScreen(userRepository: userRepository);
        }else{
          return InitScreen(userRepository: userRepository);
        }
      },
    );
  }
}


