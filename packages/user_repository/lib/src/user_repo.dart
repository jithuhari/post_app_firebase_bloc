import 'package:firebase_auth/firebase_auth.dart';

import '../user_repository.dart';

abstract class UserRepository{
  Stream<User?> get user;
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<MyUserModel> signup(MyUserModel myUser , String password);
  Future<void> resetPassword(String email);

  //setUserData

  Future<void> setUserData(MyUserModel user);

  //getMyUserData
  Future<MyUserModel> getMyUser(String myUserID);
}