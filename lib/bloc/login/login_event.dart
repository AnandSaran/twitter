import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ListenLoginUser extends LoginEvent {}
class GoogleSignIn extends LoginEvent {}

/*class GoogleSignInSuccess extends LoginEvent {
  final User user;

  const GoogleSignInSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'GoogleSignInSuccess { user: $user }';
}

class GoogleSignInFailure extends LoginEvent {}*/
