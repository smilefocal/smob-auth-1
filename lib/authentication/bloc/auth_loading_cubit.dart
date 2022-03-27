import 'package:flutter_bloc/flutter_bloc.dart';

class AuthLoadingCubit extends Cubit<bool> {
  AuthLoadingCubit() : super(false);

  ///this is the default value.
  ///it is also called when the network is disconnected while
  ///attempting to submit the form.
  deactivateLoading() => emit(false);
  //
  activateLoading() => emit(true);
  //
}
