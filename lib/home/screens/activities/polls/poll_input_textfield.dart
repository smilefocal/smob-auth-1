import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strathmoresesc/home/screens/activities/polls/bloc/manage_textfields_bloc.dart';

class PollInputTextField extends StatelessWidget {
  const PollInputTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 5,
      minLines: 1,
      decoration: InputDecoration(
        suffixIcon: BlocBuilder<ManageTextFieldsBloc, int>(
          builder: (context, state) {
            return GestureDetector(
              child: state > 2 ? const Icon(Icons.remove_circle_outline) : null,
              onTap: () =>
                  context.read<ManageTextFieldsBloc>().decrementTextFields(),
            );
          },
        ),
      ),
    );
  }
}
