import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBarCubit extends Cubit<int> {
  ///By default, we want the user to be able to see the normalView
  ///once they open the add activity interface.
  BottomNavBarCubit() : super(0);
  void normalTextView() => emit(0);
  void pollView() => emit(1);
  void mediaView() => emit(2);
}
