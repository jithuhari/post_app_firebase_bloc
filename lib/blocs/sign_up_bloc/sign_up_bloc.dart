import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;
  SignUpBloc({required UserRepository myUserRepository})
    : _userRepository = myUserRepository,
      super(SignUpInitial())  {
    on<SignUpRequired>((event, emit) async{
      emit(SignUpProcess());
      try {
        MyUserModel user =  await _userRepository.signup(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(SignUpFailure());
      }
    });
  }
}
