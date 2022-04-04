import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:strathmoresesc/home/screens/activities/polls/bloc/manage_textfields_bloc.dart';

void main() {
  group('The number of poll options can be altered', () {
    final manageTextFieldsBloc = ManageTextFieldsBloc();
    blocTest(
      'initial number is 2',
      build: () => ManageTextFieldsBloc(),
      expect: () => [],
    );
  });
}
