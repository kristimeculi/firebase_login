
import 'package:bloc/bloc.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;

  AuthBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStartedEvent) {
      try {
        var isSignedIn = await userRepository.isSignedIn();
        if (isSignedIn) {
          var user = await userRepository.getCurrentUser();
          yield AuthenticatedState(user: user);
        } else {
          yield UnauthenticatedState();
        }
      } catch (e) {
        yield UnauthenticatedState();
      }
    }
  }
}
