part of 'authentication_bloc.dart';

enum AuthenticationStatus {authenticated, unauthenticated, unknow }

class AuthenticationState extends Equatable{
  AuthenticationState._({
    this.status=AuthenticationStatus.unknow, 
    this.user
  } );

  final AuthenticationStatus status;
  final MyUser?  user;

  AuthenticationState.unknow():this._();
  AuthenticationState.authenticated(MyUser myUser): this._(
    status: AuthenticationStatus.authenticated,
    user: myUser
  );
  AuthenticationState.unauthenticated(): this._(
    status: AuthenticationStatus.unauthenticated
  );

  @override
  // TODO: implement props
  List<Object?> get props => [status,user];

}
