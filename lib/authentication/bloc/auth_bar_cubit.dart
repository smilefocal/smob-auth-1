import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBarCubit extends Cubit<bool> {
  AuthBarCubit() : super(true);
  //
  void isSignUpMode() => emit(false);
  //
  void isLoginMode() => emit(true);
}
