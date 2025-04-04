part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthenticatioUserChanged extends AuthenticationEvent {
  const AuthenticatioUserChanged(this.user);

  final User? user;
}
