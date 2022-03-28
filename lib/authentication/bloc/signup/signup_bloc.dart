import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:strathmoresesc/authentication/bloc/repository/authentication_repository.dart';
import 'package:strathmoresesc/authentication/bloc/signup/signup_validators.dart';

class SignUpBloc extends Object with SignUpValidators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _confirmPassword = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<String> get confirmPassword =>
      _confirmPassword.stream.transform(validateConfirmPassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest3(email, password, confirmPassword, (a, b, c) => true);

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeConfirmPassword => _confirmPassword.sink.add;

  submit(BuildContext context) async {
    final validEmail = _email.value;
    final validPassword = _password.value;
    final validConfirmPassword = _confirmPassword.value;
    //
    if (validPassword != validConfirmPassword) {
      return ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match! Try again!"),
          backgroundColor: Colors.redAccent,
        ),
      );
    } else {
      FocusScope.of(context).unfocus();
      signUp(context: context, email: validEmail, password: validPassword);
      print(
          'Email is $validEmail and password is $validPassword and confirmPass is $validConfirmPassword');
    }
  }

  dispose() {
    _email.close();
    _password.close();
    _confirmPassword.close();
  }
}

Future<void> signUp({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) async {
      User? user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification().whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('Check your email address for the verification link!'),
                backgroundColor: Colors.green,
              ),
            ),
          );
    });
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text(SignUpWithEmailAndPasswordFailure.fromCode(e.code).toString()),
        backgroundColor: Colors.red,
      ),
    );
  } catch (_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(const SignUpWithEmailAndPasswordFailure().toString()),
        backgroundColor: Colors.red,
      ),
    );
  }
}
