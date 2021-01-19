import 'package:equatable/equatable.dart';
import 'package:firebase_login/models/UserModel.dart';

abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent {

  final UserModel userModel;

  LoginButtonPressed({this.userModel});

  @override
  List<Object> get props => throw UnimplementedError();
}




