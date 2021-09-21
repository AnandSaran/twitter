import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitter/bloc/login/login_state.dart';

import 'login_event.dart';

class LoginBLoc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBLoc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(Init());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is ListenLoginUser) {
      _mapListenLoginUser();
    } else if (event is GoogleSignIn) {
      _mapGoogleSignInSuccessToState();
    }
    /*else if (event is GoogleSignInSuccess) {
      yield* _mapGoogleSignInSuccessToState();
    } else if (event is GoogleSignInFailure) {
      _mapGoogleSignInFailureToState();
    }*/
  }

  _mapGoogleSignInSuccessToState() {
    _authenticationRepository.logInWithGoogle();
  }

  _mapListenLoginUser() async* {
    _authenticationRepository.user.listen((user) {
      print("name listen:" + user.name.toString());
      if (user.isNotEmpty) {
        _mapListenLoginUserState(user);
      }
    });
  }

  Stream<LoginState> _mapListenLoginUserState(User user) async* {
    print("name:" + user.name.toString());
    yield LoginSuccess(user);
  }
}
