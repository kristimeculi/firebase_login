
import 'package:bloc/bloc.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;

  LoginBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoadingState();
      try {
        var user = await userRepository.signInEmailAndPassword(
            event.userModel);
        yield LoginSuccessState(user: user);
      } catch (e) {
        yield LoginFailState(message: e.toString());
      }
    }
  }
}
