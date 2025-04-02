import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:user_repository/src/entities/my_user_entity.dart';
import 'package:user_repository/src/models/my_user_model.dart';
import 'package:user_repository/src/user_repo.dart';

class FireBAseUserRepository implements UserRepository {
  FireBAseUserRepository({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

   @override
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser){
      final user = firebaseUser;
      return user;
    });
  }

  // sign up
  @override
  Future<MyUserModel> signup(MyUserModel myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );
      myUser = myUser.copyWith(id: user.user!.uid);

      return myUser;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // sign in
  @override
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // sign out
  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  // reset password
  @override
  Future<void> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> setUserData(MyUserModel user) async {
    try {
      await userCollection.doc(user.id).set(user.toEntity().toJson());
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<MyUserModel> getMyUser(String myUserID) async {
    try {
      return await userCollection
          .doc(myUserID)
          .get()
          .then(
            (value) =>
                MyUserModel.fromEntity(MyUserEntity.fromJson(value.data()!)),
          );
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
  
 
}
