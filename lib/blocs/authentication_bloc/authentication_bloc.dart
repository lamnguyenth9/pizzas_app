import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<MyUser?> _userSubcription;
  AuthenticationBloc( {required this.userRepository} ) : super(AuthenticationState.unknow()) {
    _userSubcription=userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    },);
    on<AuthenticationUserChanged>((event, emit) {
      if(event.user != MyUser.empty){
        emit(AuthenticationState.authenticated(event.user!));
      }else{
        emit(AuthenticationState.unauthenticated());
      }
    });
  }
  @override
  Future<void> close(){
    _userSubcription.cancel();
    return super.close();
  }
}
