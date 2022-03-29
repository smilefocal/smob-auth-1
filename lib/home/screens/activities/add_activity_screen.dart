import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:strathmoresesc/constants.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
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
              child: OutlinedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text('Publish'),
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
                      AnimatedContainer(
                        duration: const Duration(seconds: 3),
                        height: MediaQuery.of(context).size.height / 1.5,
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: const TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            hintText: 'Write something ...',
                            filled: true,
                          ),
                          expands: true,
                          maxLines: null,
                          minLines: null,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.text_fields), label: 'Normal'),
            BottomNavigationBarItem(icon: Icon(Icons.poll), label: 'Poll'),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_outline), label: 'Media'),
          ],
        ),
      ),
    );
  }
}
