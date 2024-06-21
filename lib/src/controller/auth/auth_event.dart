part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {}

class EmailChanged extends AuthEvent {
  final String email;

  EmailChanged({this.email = ''});

  @override
  List<Object?> get props => [
        email,
      ];
}

class PassWordChanged extends AuthEvent {
  final String password;

  PassWordChanged({this.password = ''});

  @override
  List<Object?> get props => [
        password,
      ];
}

class GoogleSignInEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {
  final User? currUser;

  AppStarted({this.currUser});

  @override
  List<Object?> get props => [
        currUser,
      ];
}

class AppLogout extends AuthEvent {
  @override
  List<Object?> get props => [];
}
