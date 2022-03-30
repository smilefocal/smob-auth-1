import 'package:flutter/material.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/add_text_activity_bloc.dart';

class AddTextActivityProvider extends InheritedWidget {
  final bloc = AddTextActivityBloc();

  AddTextActivityProvider({Key? key, Widget? child})
      : super(key: key, child: child!);

  // bool updateShouldNotify(_) => true;
  @override
  bool updateShouldNotify(oldWidget) => true;

  static AddTextActivityBloc of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<AddTextActivityProvider>())!
        .bloc;
  }
}
