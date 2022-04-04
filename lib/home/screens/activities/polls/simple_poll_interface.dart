import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strathmoresesc/home/screens/activities/polls/bloc/manage_textfields_bloc.dart';
import 'package:strathmoresesc/home/screens/activities/polls/poll_input_textfield.dart';

class SimplePollInterface extends StatelessWidget {
  const SimplePollInterface({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageTextFieldsBloc, int>(
      builder: (context, state) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            const TextField(
              maxLines: 5,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                label: Text('Title of poll'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            for (int i = 0; i < state; i++) const PollInputTextField(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () => context
                      .read<ManageTextFieldsBloc>()
                      .incrementTextFields(),
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
