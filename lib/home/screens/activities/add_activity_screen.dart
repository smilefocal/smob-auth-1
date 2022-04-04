import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strathmoresesc/constants.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/add_text_activity_bloc.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/add_text_activity/add_text_activity_provider.dart';
import 'package:strathmoresesc/home/screens/activities/blocs/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:strathmoresesc/home/screens/activities/polls/laura_polls.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    //this is the bloc for the message.
    final addTextBloc = AddTextActivityProvider.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.cancel_sharp,
                color: Colors.brown,
              )),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _PublishMessageButton(
                addTextActivityBloc: addTextBloc,
                user: user,
              ),
            )
          ],
        ),

        ///the body contains the textField
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.vertical,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage("${user.photoURL}"),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Container(
                      height: 25,
                      color: Colors.brown,
                      width: 2,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.help_center_rounded,
                        color: Colors.brown,
                      ),
                    ),
                    Container(
                      height: 25,
                      color: Colors.brown,
                      width: 2,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.tag,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      BlocBuilder<BottomNavBarCubit, int>(
                        builder: (context, state) {
                          return AnimatedContainer(
                            duration: const Duration(seconds: 3),
                            height: MediaQuery.of(context).size.height / 1.5,
                            width: MediaQuery.of(context).size.width / 1.5,

                            ///todo: we can switch this depending on the value of
                            ///todo: the bottomNavBar bloc.
                            child: state == 0
                                ? _MessageTextField(
                                    addTextActivityBloc: addTextBloc)
                                : state == 1
                                    ? const LauraPolls()
                                    : const _PollView(),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BlocBuilder<BottomNavBarCubit, int>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state == 0
                  ? 0
                  : state == 1
                      ? 1
                      : 2,
              onTap: (index) {
                index == 0
                    ? context.read<BottomNavBarCubit>().normalTextView()
                    : index == 1
                        ? context.read<BottomNavBarCubit>().pollView()
                        : context.read<BottomNavBarCubit>().mediaView();
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.text_fields), label: 'Normal'),
                BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'Poll'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.play_circle_outline), label: 'Media'),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _MessageTextField extends StatelessWidget {
  const _MessageTextField({Key? key, required this.addTextActivityBloc})
      : super(key: key);
  final AddTextActivityBloc addTextActivityBloc;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: addTextActivityBloc.message,
        builder: (context, snapshot) {
          return TextField(
            onChanged: addTextActivityBloc.changeMessage,
            // autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Write something ...',
              filled: true,
              // errorText: snapshot.error.toString(),
            ),
            expands: true,
            maxLines: null,
            minLines: null,
          );
        });
  }
}

///
class _PublishMessageButton extends StatelessWidget {
  const _PublishMessageButton(
      {Key? key, required this.addTextActivityBloc, required this.user})
      : super(key: key);
  final AddTextActivityBloc addTextActivityBloc;
  final User user;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: addTextActivityBloc.submitValidMessage,
        builder: (context, snapshot) {
          return ElevatedButton(
            style: buttonStyle,
            onPressed: () => snapshot.hasData
                ? addTextActivityBloc.submitMessage(
                    user,
                    context,
                  )
                : null,
            child: const Text('Publish'),
          );
        });
  }
}

///
class _PollView extends StatelessWidget {
  const _PollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: Text('This is the pollview'),
    );
  }
}
