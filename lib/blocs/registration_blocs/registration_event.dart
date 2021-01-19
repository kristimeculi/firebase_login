import 'package:equatable/equatable.dart';
import 'package:firebase_login/models/UserModel.dart';

abstract class RegistrationEvent extends Equatable {}

class SignUpButtonPressed extends RegistrationEvent {

  final UserModel userModel;

  SignUpButtonPressed({this.userModel});

  @override
  List<Object> get props => throw UnimplementedError();
}