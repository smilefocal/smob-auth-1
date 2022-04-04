import 'package:flutter_bloc/flutter_bloc.dart';

class ManageTextFieldsBloc extends Cubit<int> {
  //The initial value is 2 textFields.
  ManageTextFieldsBloc() : super(2);

  void incrementTextFields() => emit(state + 1);

  void decrementTextFields() {
    if (state > 2) {
      emit(state - 1);
    }
    emit(state);
  }
}
