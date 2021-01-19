import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegistrationState extends Equatable {}

class RegistrationInitial extends RegistrationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class RegistrationLoading extends RegistrationState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class RegistrationSuccessfully extends RegistrationState {

  final FirebaseUser user;

  RegistrationSuccessfully(this.user);

  @override
  List<Object> get props => throw UnimplementedError();
}

class RegistrationFailure extends RegistrationState {

  final String message;

  RegistrationFailure(this.message);

  @override
  List<Object> get props => throw UnimplementedError();
}