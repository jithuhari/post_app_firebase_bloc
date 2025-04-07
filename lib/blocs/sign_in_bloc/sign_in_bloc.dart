import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;
  SignInBloc({required UserRepository myUserRepository})
    : _userRepository = myUserRepository,
      super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProgress());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } catch (e) {
        debugPrint(e.toString());
        emit(SignInFailure());
      }
    });

    on<SignOutRequired>((event, emit) async {
      await _userRepository.signOut();
    });
  }
}
