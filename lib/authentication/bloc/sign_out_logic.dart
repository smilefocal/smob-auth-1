import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:strathmoresesc/authentication/bloc/repository/authentication_repository.dart';

class SignOutLogic {
  late final firebase_auth.FirebaseAuth _firebaseAuth;
  late final GoogleSignIn _googleSignIn;

  ///
  Future<void> logOut(BuildContext context) async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]).whenComplete(() => Navigator.of(context).pushReplacementNamed('/'));
    } catch (_) {
      throw LogOutFailure();
    }
  }
}
