import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/blocs/home_blocs/home_page_bloc.dart';
import 'package:firebase_login/blocs/home_blocs/home_page_event.dart';
import 'package:firebase_login/blocs/home_blocs/home_page_state.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:firebase_login/screens/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageParent extends StatelessWidget {
  final FirebaseUser user;
  final UserRepository userRepository;

  HomePageParent({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc(userRepository: userRepository),
      child: HomeScreen(user: user, userRepository: userRepository),
    );
  }
}

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  final FirebaseUser user;
  final UserRepository userRepository;
  HomeScreenBloc homeScreenBloc;

  HomeScreen({@required this.user, @required this.userRepository});

  @override
  Widget build(BuildContext context) {
    homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("email"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onPressed: () {
                homeScreenBloc.add(LogOutEvent());
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Text(user.email),
            ),
            BlocListener<HomeScreenBloc, HomePageState>(
              listener: (context, state) {
                if (state is LogOutSuccessState) {
                  navigateToSignUpPage(context);
                }
              },
              child: BlocBuilder<HomeScreenBloc, HomePageState>(
                builder: (context, state) {
                  if (state is LogOutInitial) {
                    return Container();
                  } else if (state is LogOutSuccessState) {
                    return Container();
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignUpPage(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return InitScreen(userRepository: userRepository);
    }));
  }
}