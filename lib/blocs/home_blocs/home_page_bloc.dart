
import 'package:bloc/bloc.dart';
import 'package:firebase_login/repositories/user_repository.dart';
import 'package:meta/meta.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomeScreenBloc extends Bloc<HomePageEvent, HomePageState> {
  UserRepository userRepository;

  HomeScreenBloc({@required UserRepository userRepository}) {
    this.userRepository = userRepository;
  }

  @override
  HomePageState get initialState => LogOutInitial();

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is LogOutEvent) {
      print("LOG out Bloc");
      userRepository.signOut();
      yield LogOutSuccessState();
    }
  }
}
