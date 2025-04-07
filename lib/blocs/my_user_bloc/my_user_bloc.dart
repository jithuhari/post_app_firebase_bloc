import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

part 'my_user_event.dart';
part 'my_user_state.dart';

class MyUserBloc extends Bloc<MyUserEvent, MyUserState> {
  final UserRepository userRepository;
  MyUserBloc({required UserRepository myUserRepository})
    : userRepository = myUserRepository,
      super(const MyUserState.loading()) {
    on<GetMyUser>((event, emit)async {
      try {
        MyUserModel myUser = await userRepository.getMyUser(event.myUserId);
        emit(MyUserState.success(myUser));
      } catch (e) {
        debugPrint(e.toString());
        emit(MyUserState.failure());
      }
    });
  }
}
