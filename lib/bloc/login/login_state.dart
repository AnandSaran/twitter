import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class Init extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoginSuccess { user: $user }';
}
