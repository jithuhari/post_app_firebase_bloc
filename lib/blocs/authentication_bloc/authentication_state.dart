part of 'authentication_bloc.dart';

enum AuthenticationStatus{authenticated, unauthenticated,unknown}



class AuthenticationState extends Equatable{
  final AuthenticationStatus status;
  final User? user;
  const AuthenticationState._({
    this.status=AuthenticationStatus.unknown,this.user
  });

  ///no information about hr [AuthenticatioStatus] of the current user
  const AuthenticationState.unknown():this._();


  /// current user is [authenticated]
  /// 
  /// it takes a [MyUser] property representing the current [authenticated] user
  const AuthenticationState.authenticated(User user):this._(status: AuthenticationStatus.authenticated,user: user);

  /// current user is [unauthenticated]
  const AuthenticationState.unauthenticated():this._(status: AuthenticationStatus.unauthenticated);
 
  
  @override

  List<Object?> get props => [status,user];

}
