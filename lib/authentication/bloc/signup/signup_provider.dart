import 'package:flutter/material.dart';
import 'package:strathmoresesc/authentication/bloc/signup/signup_bloc.dart';
//

class SignUpProvider extends InheritedWidget {
  final bloc = SignUpBloc();

  SignUpProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static SignUpBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<SignUpProvider>())!.bloc;
  }
}
