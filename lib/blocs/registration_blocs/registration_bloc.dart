
import 'package:bloc/bloc.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'registration_event.dart';
import 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  UserRepository userRepository;

  RegistrationBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  RegistrationState get initialState => RegistrationInitial();

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield RegistrationLoading();
      try {
        var user = await userRepository.signUpUserWithEmailPass(
            event.userModel);
        print("BLoC : ${user.email}");
        yield RegistrationSuccessfully(user);
      } catch (e) {
        yield RegistrationFailure(e.toString());
      }
    }
  }
}
